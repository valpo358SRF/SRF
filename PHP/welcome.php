<?php
// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body{ font: 14px sans-serif; text-align: center; }
    </style>
</head>
<body>
    <h1 class="my-5">Hi, <b><?php echo htmlspecialchars($_SESSION["username"]); ?></b>. Welcome to our site.</h1>
    <p>
        <div class="container">
            <div class="row form-group">
                <div class="col">
                    <a href="user-list.php" class="btn btn-primary ml-3">User List</a>
                </div>
                <div class="col">
                    <a href="post.php" class="btn btn-secondary ml-3">New Experiment Post</a>
                </div>
            </div>

            <div class="row align-items-end">
                <div class="col">
                    <a href="reset-password.php" class="btn btn-warning ml-3">Reset Your Password</a>
                </div>
                <div class="col">
                    <a href="logout.php" class="btn btn-danger ml-3">Sign Out of Your Account</a>
                </div>
            </div>
        </div>
    </p>
</body>
</html>