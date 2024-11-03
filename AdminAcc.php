<?php 

namespace App\Controllers;

use App\Models\AccountManagementModel; 

class AdminAcc extends BaseController
{
    public function index()
    {
        return view('adminacc');
    }

    // [adrielle] method to handle form data processing in Account Management
    public function updateAccount()
    {
        // Load the model
        $adminModel = new AccountManagementModel();

        // Get the user's role from session
        $userRole = session()->get('role');
        
        // Allow update only if the user has 'mentor' or 'passive-investors' role
        if ($userRole !== 'mentor' && $userRole !== 'passive-investors') {
            return redirect()->back()->with('error', 'Unauthorized access');
        }

        // Get form data
        $email = $this->request->getPost('email');
        $phone = $this->request->getPost('phone');
        $password = $this->request->getPost('password');
        $confirmPassword = $this->request->getPost('confirm_password');

        // Validate email
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return redirect()->back()->with('error', 'Invalid email format');
        }

        // Validate password (if provided) and check if they match
        if ($password && $password !== $confirmPassword) {
            return redirect()->back()->with('error', 'Passwords do not match');
        }

        // Prepare data for update
        $data = [
            'email' => $email,
            'phone' => $phone,
        ];

        // Hash the password if provided
        if ($password) {
            $data['password'] = password_hash($password, PASSWORD_DEFAULT);
        }

        // Update the user account in the database
        $userId = session()->get('user_id'); // Use user_id from the session
        $adminModel->where('id', $userId)->set($data)->update();

        // Redirect back with success message
        return redirect()->back()->with('success', 'Account updated successfully');
    }
}
