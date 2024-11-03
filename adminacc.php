<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f9;
    }

    .account-management-section {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
        width: 60%;
        margin-left: auto;
        margin-right: auto;
    }

    .account-management-title {
        font-size: 28px;
        font-weight: bold;
        color: #333;
        text-align: center;
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        font-weight: bold;
        color: #555;
    }

    input[type="text"], input[type="email"], input[type="password"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
        color: #333;
        margin-top: 5px;
    }

    button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background-color: #45a049;
    }

    .danger-button {
        background-color: #f44336;
    }

    .danger-button:hover {
        background-color: #e53935;
    }

    .text-danger {
        color: #f44336;
    }

    .form-group-inline {
        display: flex;
        justify-content: space-between;
    }

    .form-group-inline .form-group {
        width: 48%;
    }

    .back-button {
        background-color: #007BFF;
        color: white;
    }

    .back-button:hover {
        background-color: #0056b3;
    }

    .alert {
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 20px;
    }

    .alert-success {
        background-color: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
    }

    .alert-danger {
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
    }
</style>

<div class="container mt-4">
    <!-- Account Management Section -->
    <div class="account-management-section">
        <button class="back-button" onclick="history.back()">Go Back</button>
        <div class="account-management-title">Account Management</div>

        <!-- Display Success or Error Messages -->
        <?php if (session()->getFlashdata('success')): ?>
            <div class="alert alert-success">
                <?= session()->getFlashdata('success') ?>
            </div>
        <?php endif; ?>

        <?php if (session()->getFlashdata('error')): ?>
            <div class="alert alert-danger">
                <?= session()->getFlashdata('error') ?>
            </div>
        <?php endif; ?>

        <!-- Update Profile Information Form -->
        <form action="<?= base_url('user/updateAccount') ?>" method="post">
            <!-- Update Email -->
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="admin@example.com" required>
            </div>

            <!-- Update Phone Number -->
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="text" id="phone" name="phone" value="+63 9123456789">
            </div>

            <!-- Update Password Section -->
            <div class="form-group-inline">
                <div class="form-group">
                    <label for="password">New Password:</label>
                    <input type="password" id="password" name="password" placeholder="New password">
                </div>
                <div class="form-group">
                    <label for="confirm_password">Confirm Password:</label>
                    <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm new password">
                </div>
            </div>

            <!-- Save Button -->
            <div class="form-group">
                <button type="submit">Update Account</button>
            </div>
        </form>

        <hr>

        <!-- Account Deactivation Section -->
        <div class="text-danger">
            <h4>Danger Zone</h4>
            <p>If you deactivate your account, all your information will be permanently deleted and you will not be able to access the admin panel anymore.</p>
        </div>
        <form action="<?= base_url('admin/deactivateAccount') ?>" method="post">
            <button type="submit" class="danger-button">Deactivate Account</button>
        </form>
    </div>
</div>
