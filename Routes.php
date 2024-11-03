<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Guest::index');

// Guest page - christian polishing controllers/routes, date: 10.7.2024
$routes->get('guest', 'Guest::index');
$routes->get('about', 'Guest::about');
$routes->get('startup_intro', 'Guest::startup_intro');
$routes->get('investor_intro', 'Guest::investor_intro');

// User Login page - christian polishing controllers/routes, date: 10.7.2024
$routes->get('login', 'Login::index'); 
$routes->post('/login', 'Login::login');
$routes->get('logout', 'Login::logout');

$routes->get('investor_signup', 'Login::investor_signup'); //login signup
$routes->post('/investor_signup', 'Login::investor_database');

$routes->get('startup_signup', 'Login::startup_signup'); //startup signup
$routes->post('/startup_signup', 'Login::startup_database');

// email verification link upon signup activity - Gerard, Oct 31, 2024
$routes->get('verify-email/(:any)', 'Login::verifyEmail/$1');

$routes->get('roles', 'Login::roles'); // choosing roles
$routes->get('validate', 'Login::validateForm'); //validation form
$routes->post('validate', 'Login::submitDocuments');

// Forgot Password Routes
$routes->get('forgot-password', 'Login::forgot_password'); // Show forgot password form
$routes->post('forgot-password/process', 'Login::processForgotPassword'); // Process forgot password form

// Reset Password Routes
$routes->get('reset-password', 'Login::ResetPassword'); // Show reset password form with token
$routes->post('reset-password/update', 'Login::updatePassword'); // Handle password update

// IDEA DASHBOARD - christian polishing controllers/routes, date: 10.12.2024
$routes->get('idea', 'Idea::index');
$routes->get('pitch', 'Idea::pitch');
$routes->post('pitch', 'Idea::submitPitch'); //christian date: 10.14.2024

// invest_dashboard for investor - christian polish controllers, date: 10.14.2024
$routes->get('invest_dashboard', 'InvestDashboard::index');
$routes->get('ecommerce', 'InvestDashboard::ecommerce');
$routes->get('beverage', 'InvestDashboard::beverage');
$routes->get('technology', 'InvestDashboard::technology');
$routes->get('InvestDashboard/deletePitch/(:num)', 'InvestDashboard::deletePitch/$1'); 
$routes->get('edit/(:num)', 'InvestDashboard::edit/$1');

// UNPOLISHED CONTROLLERS AND ROUTES: 
// Collaboration startup
$routes->get('collab', 'Collab::index');

// Mentor startup
$routes->get('mentoring', 'Mentoring::index');
$routes->get('/find/search', 'Mentoring::search'); //Christian - date: 10/25/2024
//Christian - date: 10/28/2024
$routes->get('find', 'Mentoring::find');
$routes->get('find', 'Mentoring::findInvestor'); 
$routes->get('mentoring/mentors', 'Mentoring::getAllMentorsAndInvestors');
$routes->get('mentoring/search', 'Mentoring::search');
$routes->post('send-request', 'View::sendRequest');

// Route for base URL: localhost/venturevortex/mentor
$routes->get('mentor', 'Mentor::index');

// Initial module
$routes->get('initial', 'InitialController::index');

// Investor profile
$routes->get('investor', 'InvestorController::index');
$routes->post('investor/uploadImage', 'InvestorController::uploadImage'); 
$routes->post('investor/updateProfile', 'InvestorController::updateProfile'); //christian date: 10.14.2024 
$routes->post('investor/addProject', 'InvestorController::addProject'); // christian date 10.14.2024 
$routes->get('investor_profile/(:num)', 'InvestorController::profile/$1'); // christian date 10/25/2024
$routes->get('investor/sendStartupRequest/(:num)/(:any)', 'InvestorController::sendStartupRequest/$1/$2');

// Transaction reports
$routes->get('investor_trans', 'InvestorTrans::index');
// Lendering reports
$routes->get('investor_lender', 'Lender::index');
// Transaction reports for startups - christian, date: 10.31.2024
$routes->get('transaction', 'TransactionController::index');
$routes->post('transaction/add', 'TransactionController::add'); 
$routes->post('transaction/update', 'TransactionController::update');
$routes->get('transaction/delete/(:num)', 'TransactionController::delete/$1');

// Transaction for investor
$routes->get('trans', 'TransController::index');

// Startup profile 
$routes->get('startup', 'StartupController::index');
$routes->post('startup/uploadImage', 'StartupController::uploadImage'); 
$routes->post('startup/updateProfile', 'StartupController::updateProfile');//christian date: 10.14.2024 
$routes->get('loaned_projects', 'LoanedProjects::index');
$routes->get('startup_trans', 'StartupTrans::index');
$routes->get('view', 'View::index');
$routes->get('view/(:num)', 'View::index/$1');

// Admin profile
$routes->get('adminprof', 'AdminProf::index');

// Admin management
$routes->get('adminacc', 'AdminAcc::index');

// adrielle - Form submission route for Account Management
$routes->post('user/updateAccount', 'AdminAcc::updateAccount');

// adrielle - Account Deactivation in Account Management
$routes->post('user/deactivateAccount', 'AdminAcc::deactivateAccount');

// Admin startup account management 
$routes->get('adminSAV', 'AdminSAV::index');
$routes->post('adminSAV/approve/(:num)', 'AdminSAV::approve/$1'); //CHRISTIAN - 10.6.2024
$routes->post('adminSAV/reject/(:num)', 'AdminSAV::reject/$1'); //CHRISTIAN - 10.6.2024

// Admin investor account management 
$routes->get('adminIAV', 'AdminIAV::index');
$routes->post('adminIAV/approve/(:num)', 'AdminIAV::approve/$1'); //CHRISTIAN - 10.6.2024
$routes->post('adminIAV/reject/(:num)', 'AdminIAV::reject/$1'); //CHRISTIAN - 10.6.2024

// Admin transaction history
$routes->get('admintranshistory', 'AdminTransHistory::index');

// Admin report
$routes->get('adminreport', 'AdminReport::index');

// Admin maintenance and update
$routes->get('adminmaintenance', 'AdminMaintenance::index');

// Admin content management 
$routes->get('content', 'Content::index');

// Admin security management 
$routes->get('security', 'Security::index');

// validateCreds for investor
$routes->get('validate_creds', 'ValidateCreds::index');

// Progress report
$routes->get('/progress_report', 'ProgressReportController::index');
$routes->get('/progress_report/create', 'ProgressReportController::create');
$routes->post('/progress_report/store', 'ProgressReportController::store');
$routes->get('/progress_report/edit/(:num)', 'ProgressReportController::edit/$1');
$routes->post('/progress_report/update/(:num)', 'ProgressReportController::update/$1');
$routes->get('/progress_report/delete/(:num)', 'ProgressReportController::delete/$1');

// send request - christian, Date: 10.17.2024
$routes->post('invest_dashboard/sendRequest', 'InvestDashboard::sendRequest');
$routes->get('idea/handleRequest/(:num)/(:alpha)', 'Idea::handleRequest/$1/$2');
$routes->get('idea/requests', 'Idea::getRequestsForStartup');

// resources - christian, Date: 10.21.2024
$routes->get('resources', 'Resources::index');

// Test web page designs (temporary)
$routes->get('test', 'Test::index');
