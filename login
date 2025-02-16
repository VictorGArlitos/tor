<?php
include("connection.php");

if (isset($_POST["txt_btn"])) { // Fixed button name
    $un = $_POST['txt_username'];
    $pw = $_POST['txt_password'];

    // Query to check user credentials and get user type
    $sql = "SELECT usertype FROM users WHERE username = '$un' AND password = '$pw'"; // Ensure 'pwd' is the correct column name
    $result = $con->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $user_type = $row['usertype']; // Fixed column name

        echo '<script>alert("Login successful!");</script>';

        // Redirect based on user type
        if ($user_type == 'admin') {
            echo '<script>window.location.href = "admin.php";</script>';
        } elseif ($user_type == 'user') {
            echo '<script>window.location.href = "user.php";</script>';
        }
    } else { 
        echo '<script>alert("Invalid username or password!");</script>';
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login - TintaPh</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant:ital,wght@0,300..700;1,300..700&family=Kavoon&family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">

    <style>
        body {
            background: url('https://2.bp.blogspot.com/-4y73LKDEfW4/VP0dQ4y0FvI/AAAAAAAAKSY/K7L-dw_LQbM/s1600/_EL15860-Muslim%2Bin%2Bthe%2BPhilippines.jpg') no-repeat center center/cover;
            height: 100vh;
            font-family: 'preconnect', sans-serif;
        }

        .overlay {
            background: rgba(0, 0, 0, 0.6);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
        }

        .container {
            position: relative;
            z-index: 1000;
            display: flex;
            align-items: center;
            height: 100vh;
            justify-content: flex-end;
        }

        .login-box {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 7px;
            padding: 40px;
            width: 50%;
            text-align: center;
            color: white;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
            animation: fadeIn 1s ease-in-out;
            margin-left: auto;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateX(50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .form-control {
            background: transparent;
            border: 2px solid white;
            color: white;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .txt_btn {
            background: #000000;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 25px;
            font-weight: bold;
            color: white;
            transition: 0.3s;
        }

        .txt_btn:hover {
            background: #ff1493;
        }

        .logo {
            width: 100px;
            height: auto;
            display: block;
            margin: 0 auto 15px;
        }
    </style>
</head>
<body>

    <div class="overlay"></div>

    <div class="container">
        <div class="login-box">
            <img src="logo (1).png" alt="TintaPh Logo" class="logo">
            <h2>TintaPh Login</h2>

            <form action="" method="POST">
                <div class="mb-3">
                    <input type="text" class="form-control" id="txt_username" name="txt_username" placeholder="Username" required>
                </div>
                <div class="mb-3">
                    <input type="password" class="form-control" id="txt_password" name="txt_password" placeholder="Password" required>
                </div>
                <button type="submit" name="txt_btn" class="btn btn-primary">Login</button>
            </form>
            <div class="login-links mt-3">
                <a href="register.php">DONT HAVE ACCOUNT?</a> | <a href="register.php">Sign Up</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
