<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Deactivated</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f9;
        }
        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        .modal-content h4 {
            color: #333;
            margin-bottom: 15px;
        }
        .modal-content p {
            color: #555;
            margin-bottom: 20px;
        }
        .modal-content button {
            background-color: #214f80;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .modal-content button:hover {
            background-color: #00aaff;
        }
    </style>
</head>
<body>

<div class="modal-content">
    <h4>Your account has been successfully deactivated.</h4>
    <p>You will be redirected to the home page in 15 seconds, or click "Okay" to go there now.</p>
    <button onclick="redirectToHome()">Okay</button>
</div>

<script>
    function redirectToHome() {
        window.location.href = "<?= base_url('/') ?>";
    }
    setTimeout(redirectToHome, 15000); // Auto-redirect after 15 seconds
</script>

</body>
</html>
