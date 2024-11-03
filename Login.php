<?php

namespace App\Controllers;

use App\Models\SignupModel;
use App\Models\InvestorProfileModel;
use App\Models\StartupDocuModel;
use App\Models\InvestorDocuModel;

use CodeIgniter\Email\Email;
use CodeIgniter\I18n\Time;
use CodeIgniter\Database\Exceptions\DatabaseException;

class Login extends BaseController
{
    //user login
    public function index()
    {
        
        return view('login');
    }

    public function login()
    {
        helper(['form', 'url']);
        
        $validation = \Config\Services::validation();
        
        $validation->setRules([
            'username' => 'required',
            'password' => 'required'
        ]);
    
        if ($validation->withRequest($this->request)->run() == FALSE) {
            return view('login', ['validation' => $this->validator]);
        } else {
            $signupModel = new SignupModel();
            $username = $this->request->getVar('username');
            $password = $this->request->getVar('password');
    
            $user = $signupModel->where('username', $username)->first();
    
            if ($user) {
                // Check if the password matches
                if (password_verify($password, $user['password'])) {
                    // Check if the user is verified
                    if ($user['email_verified'] == 1) {
                        // Set session data for the verified user
                        session()->set([
                            'user_id' => $user['id'],
                            'username' => $user['username'],
                            'email' => $user['email'],
                            'role' => $user['role'],
                            'profile_image' => $user['profile_image'],
                            'isLoggedIn' => true
                        ]);
    
                        // Redirect based on user role
                        if ($user['role'] == 'mentor' || $user['role'] == 'passive-investors') {
                            return redirect()->to('/investor');
                        } elseif ($user['role'] == 'Entrepreneurs' || $user['role'] == 'Tech Startup Companies') {
                            return redirect()->to('/startup');
                        } else {
                            return redirect()->to('validate');
                        }
                    } else {
                        // If user is not verified, redirect with an error message
                        return redirect()->back()->with('error', '<strong style="color: red;">Your email is not yet verified. Please check your Gmail inbox account.</strong><br><br>');
                    }
                } else {
                    // Incorrect password
                    return redirect()->back()->with('error', '<strong style="color: red;">Invalid login credentials.</strong><br><br>');
                }
            } else {
                // User not found
                return redirect()->back()->with('error', '<strong style="color: red;">Invalid login credentials.</strong><br><br>');
            }
        }
    }
    
    
    public function logout()
    {
        session()->destroy();
        return redirect()->to('/');
    }


    //investor signup page
    public function investor_signup()
    {
        return view('investor_signup');
    }

    public function investor_database()
    {
        helper(['form', 'url']);
        $validation = \Config\Services::validation();
    
        $validation->setRules([
            'username' => 'required|min_length[3]|max_length[255]',
            'email'    => 'required|valid_email',
            'password' => 'required|min_length[5]',
            'role'     => 'required'
        ]);
    
        if ($validation->withRequest($this->request)->run() == FALSE) {
            return view('investor_signup', ['validation' => $this->validator]);
        } else {
            $signupModel = new SignupModel();
            $investorProfileModel = new InvestorProfileModel();
    
            // Generate a unique token for email verification
            $verificationToken = bin2hex(random_bytes(32));
    
            // Prepare user data for insertion
            $userData = [
                'username'           => $this->request->getVar('username'),
                'email'              => $this->request->getVar('email'),
                'password'           => password_hash($this->request->getVar('password'), PASSWORD_DEFAULT),
                'role'               => $this->request->getVar('role'),
                'verify_token' => $verificationToken, // Store token in users table
                'email_verified'     => 0 // Initially not verified
            ];

            try{
                // Insert into the 'users' table and retrieve the user ID
                $user_id = $signupModel->insert($userData, true); 
        
                if ($user_id) {
                    // Prepare data for the 'investor_profiles' table
                    $profileData = [
                        'user_id'           => $user_id,
                        'email'             => $userData['email'],
                        'skills'            => '',
                        'expertise'         => '',
                        'achievements'      => '',
                        'social_media_link' => '',
                        'recent_activities' => ''
                    ];
        
                    // Insert the profile data into the 'investor_profiles' table
                    $investorProfileModel->insert($profileData);
        
                    // Send verification email
                    $this->sendVerificationEmail($userData['email'], $verificationToken);
        
                    // Redirect to the validation page on success
                    return redirect()->to('validate')->with('success', '<strong style="color: green;">Account created successfully. Please check your email to verify your account.</strong><br><br>');
                } 
            }
            catch (\Exception $e) {
                // Check if the error is a duplicate entry error
                if (strpos($e->getMessage(), 'Duplicate entry') !== false) {
                    return redirect()->back()->with('error', '<strong style="color: red;">The email address is already registered. Please use a different email.</strong><br><br>');
                } else {
                    // Handle other potential exceptions
                    return redirect()->back()->with('error', '<strong style="color: red;">An error occurred. Please try again.</strong><br><br>');
                }
            }
        }
    }
    

   //startup sign up page
   public function startup_signup()
   {
       return view('startup_signup');
   }
    public function startup_database()
    {
        helper(['form', 'url']);
        
        $validation = \Config\Services::validation();
        
        $validation->setRules([
            'username' => 'required|min_length[3]|max_length[255]',
            'email'    => 'required|valid_email',
            'password' => 'required|min_length[5]',
            'role'     => 'required'
        ]);
    
        if ($validation->withRequest($this->request)->run() == FALSE) {
            return view('startup_signup', ['validation' => $this->validator]);
        } else {
            $signupModel = new SignupModel();
    
            // Generate a unique verification token
            $verificationToken = bin2hex(random_bytes(32));
    
            // Prepare user data
            $userData = [
                'username'           => $this->request->getPost('username'),
                'email'              => $this->request->getPost('email'),
                'password'           => password_hash($this->request->getPost('password'), PASSWORD_DEFAULT),
                'role'               => $this->request->getPost('role'),
                'verify_token' => $verificationToken,
                'email_verified'     => 0 // Initially set to not verified
            ];
    
            try{
                // Save the user data and retrieve the user ID
                $user_id = $signupModel->insert($userData, true);
        
                if ($user_id) {
                    // Send verification email
                    $this->sendVerificationEmail($userData['email'], $verificationToken);
        
                    // Redirect to the validation page on success
                    return redirect()->to('validate')->with('success', '<strong style="color: green;">Account created successfully. Please check your email to verify your account.</strong><br><br>');
                } 
            }
            catch (\Exception $e) {
                // Check if the error is a duplicate entry error
                if (strpos($e->getMessage(), 'Duplicate entry') !== false) {
                    return redirect()->back()->with('error', '<strong style="color: red;">The email address is already registered. Please use a different email.</strong><br><br>');
                } else {
                    // Handle other potential exceptions
                    return redirect()->back()->with('error', '<strong style="color: red;">An error occurred. Please try again.</strong><br><br>');
                }
            }
        }
    }

    
    /**
     * Send verification email to the user
    */
    private function sendVerificationEmail($email, $token)
    {
        $emailService = \Config\Services::email();
        $verificationLink = base_url("verify-email/$token");
    
        $message = "
        <html>
            <head>
                <meta charset='UTF-8'>
                <title>Venture Vortex Email Verification</title>
            </head>
            <body style='font-family: Arial, sans-serif; line-height: 1.6;'>
                <h2 style='text-align: center; color: black;'>Venture Vortex Email Verification</h2>
                
                <p>Dear User,</p> <br>
                
                <p>We hope this message finds you well.</p> <br>
                <p>We are writing to inform you that you have successfully registered an account with Venture Vortex. 
                To complete your registration, please verify your email address by clicking the link below:</p>
                
                <p><a href='{$verificationLink}' style='text-decoration: none;'><strong>Verify Email</strong></a></p><br>
                
                <p>If you did not request this registration, please contact us immediately.</p>
                <p>Feel free to log in to your account after verifying your email. 
                If you encounter any issues, our support team is here to assist you. You can reach us via email or phone.</p><br>

                <p>Thank you for choosing Venture Vortex. We appreciate your trust and look forward to serving you.</p><br>

                <p>Best regards,<br><strong>The Venture Vortex Team</strong></p>
            </body>
        </html>";
    
        $emailService->setTo($email);
        $emailService->setSubject('Venture Vortex Email Verification');
        $emailService->setMessage($message);
    
        if (!$emailService->send()) {
            log_message('error', 'Email sending failed: ' . $emailService->printDebugger());
        }
    }

    public function verifyEmail($token)
    {
        $signupModel = new SignupModel();
        $user = $signupModel->where('verify_token', $token)->first();

        if ($user) {
            $signupModel->update($user['id'], [
                'email_verified' => 1,
                'verify_token' => null // Clear the token
            ]);

            return redirect()->to('/login')->with('message', '<strong style="color: green;">Email has been verified! You can now log in your user account.</strong><br><br>');
        } else {
            return redirect()->to('/login')->with('error', '<strong style="color: red;">Invalid or expired token.</strong><br><br>');
        }
    }


    public function roles()
    {
        return view('roles');
    }



    //FORGOT PASSWORD FUNCTION
    public function forgot_password() {
        helper(['form']);

        // Load the forgot password view
        return view('forgot_password');
    }
    public function processForgotPassword()
    {
        $email = $this->request->getPost('email');
        $signupModel = new SignupModel();
        $user = $signupModel->where('email', $email)->first();

        if ($user) {
            $token = bin2hex(random_bytes(50));  // Generate a random token
            $expiry = Time::now()->addMinutes(30);  // Token valid for 30 minutes

            $signupModel->update($user['id'], [
                'reset_token' => $token,
                'token_expiry' => $expiry
            ]);

            $this->sendResetEmail($email, $token);

            return redirect()->to('/forgot-password')->with('message', '<br><br><strong style="color: green;">Check your Gmail account for the reset link.</strong><br>');
        } else {
            return redirect()->to('/forgot-password')->with('error', '<strong style="color: red;">Email not found.</strong><br><br>');
        }
    }

    private function sendResetEmail($email, $token)
    {
        $resetLink = base_url("reset-password?token=$token");
        // Click this link to reset your password: <a href='$resetLink'>Reset Password</a>
        $message = "
        <html>
            <head>
                <meta charset='UTF-8'>
                <title>Venture Vortex Reset Password</title>
            </head>
            <body style='font-family: Arial, sans-serif; line-height: 1.6;'>
                <h2 style='text-align: center; color: black;'>Venture Vortex Reset Password</h2>
                
                <p>Dear User,</p> <br>
                
                <p>We hope this message finds you well.</p> <br>

                <p>We are writing to inform you that your password has been successfully reset for your Venture Vortex account.</p>
                <p>Click this link to reset your password: <a href='$resetLink' style='text-decoration: none;'>Reset Password</a></p><br>
                
                <p>Please remember to keep your password secure and do not share it with anyone.</p>
                <p>If you did not request this password reset, please contact us immediately.</p>
                
                <p>Feel free to log in to your account using the provided password. You will be prompted to change your password upon login for security reasons.</p><br>

                <p>Thank you for choosing Venture Vortex. We appreciate your trust and look forward to serving you.</p><br>

                <p>Best regards,<br><strong>The Venture Vortex Team</strong></p>
            </body>
        </html>";

        $emailService = \Config\Services::email();
        $emailService->setTo($email);
        $emailService->setFrom('venturevortex125@gmail.com', 'Venture Vortex');
        $emailService->setSubject('Venture Vortex Password Reset Request');
        $emailService->setMessage($message);
        $emailService->send();
    }

    // RESET PASSWORD function
    public function ResetPassword()
    {
        $token = $this->request->getGet('token');
        $signupModel = new SignupModel();
        $user = $signupModel->where('reset_token', $token)
                          ->where('token_expiry >=', Time::now())
                          ->first();

        if (!$user) {
            return redirect()->to('/forgot-password')->with('error', 'Invalid or expired token.');
        }

        return view('reset_password', ['token' => $token]);
    }

    public function updatePassword()
    {
        $token = $this->request->getPost('token');
        $password = $this->request->getPost('password');

        $signupModel = new SignupModel();
        $user = $signupModel->where('reset_token', $token)
                          ->where('token_expiry >=', Time::now())
                          ->first();

        if ($user) {
            $signupModel->update($user['id'], [
                'password' => password_hash($password, PASSWORD_DEFAULT),
                'reset_token' => null,
                'token_expiry' => null
            ]);

            return redirect()->to('/login')->with('message', 'Password updated successfully.');
        } else {
            return redirect()->to('/forgot-password')->with('error', 'Invalid or expired token.');
        }
    }



//validate form
    public function construct() {
        helper(['form', 'url']);
    }

    public function validateForm() {
        return view('validate');
    }

    public function submitDocuments() {
        $userType = $this->request->getPost('userType');

        if ($userType === 'startup') {
            return $this->saveStartupDocuments();
        } elseif ($userType === 'investor') {
            return $this->saveInvestorDocuments();
        }

        return redirect()->back()->with('error', '<strong style="color: red;">Invalid user type selected.</strong><br><br>');
    }

    private function saveStartupDocuments() {
        $validation = \Config\Services::validation();
    
        // Validation rules for startup documents
        $validation->setRules([
            'company_name' => 'required|min_length[3]|max_length[255]',
            'company_address' => 'required',
            'dti_registration' => 'uploaded[dti_registration]',
            'business_permit' => 'uploaded[business_permit]',
            'bir_certificate' => 'uploaded[bir_certificate]',
        ]);
    
        if (!$validation->withRequest($this->request)->run()) {
            return view('validate', ['validation' => $this->validator]);
        }
    
        // Handle file uploads for startups
        $dtiRegistration = $this->request->getFile('dti_registration');
        $businessPermit = $this->request->getFile('business_permit');
        $birCertificate = $this->request->getFile('bir_certificate');
    
        // Move files to the appropriate directory (assets/img/)
        if ($dtiRegistration->isValid()) {
            $dtiRegistration->move(FCPATH . 'assets/img/');
        }
        if ($businessPermit->isValid()) {
            $businessPermit->move(FCPATH . 'assets/img/');
        }
        if ($birCertificate->isValid()) {
            $birCertificate->move(FCPATH . 'assets/img/');
        }
    
        // Save the document paths and form data in the database
        $startupModel = new StartupDocuModel();
        $startupModel->save([
            'company_name' => $this->request->getPost('company_name'),
            'company_address' => $this->request->getPost('company_address'),
            'dti_registration' => $dtiRegistration->getName(),
            'business_permit' => $businessPermit->getName(),
            'bir_certificate' => $birCertificate->getName(),
        ]);
    
        return redirect()->to('guest')->with('message', '<strong style="color: green;">Startup documents submitted successfully! Please wait for verification.</strong><br><br>');
    }
    

    private function saveInvestorDocuments() {
        $validation = \Config\Services::validation();
    
        // Set validation rules for the fields, including the sec_registration
        $validation->setRules([
            'investor_name' => 'required|min_length[3]|max_length[255]',
            'gov_id' => 'uploaded[gov_id]',
            'bir' => 'uploaded[bir]',
            'sec_registration' => 'uploaded[sec_registration]',
        ]);
    
        // If validation fails, return the form with errors
        if (!$validation->withRequest($this->request)->run()) {
            return view('validate', ['validation' => $this->validator]);
        }
    
        // Handle file uploads
        $govID = $this->request->getFile('gov_id');
        $bir = $this->request->getFile('bir');
        $secReg = $this->request->getFile('sec_registration'); // Handle SEC Registration file
    
        // Move files to the 'assets/img/' folder
        if ($govID->isValid()) {
            $govID->move(FCPATH . 'assets/img/');
        }
        if ($bir->isValid()) {
            $bir->move(FCPATH . 'assets/img/');
        }
        if ($secReg->isValid()) {
            $secReg->move(FCPATH . 'assets/img/');
        }
    
        // Save the file paths and other form data to the database
        $investorModel = new InvestorDocuModel();
        $investorModel->save([
            'investor_name' => $this->request->getPost('investor_name'),
            'investor_company' => $this->request->getPost('investor_company'),
            'gov_id' => $govID->getName(),
            'bir' => $bir->getName(),
            'sec_registration' => $secReg->getName(), // Save sec_registration file name
        ]);
    
        return redirect()->to('guest')->with('message', '<strong style="color: green;">Investor documents submitted successfully! Please wait for verification.</strong><br><br>');
    }
    
}









