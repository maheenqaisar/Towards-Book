<?php

if(isset($_POST["fullname"]) && isset($_POST["email"]) && isset($_POST["phone"]) && isset($_POST["pass"])) {
    
    $fullname = $_POST["fullname"];
    $email = $_POST["email"];
    $phone = $_POST["phone"];
    $pass = ($_POST["pass"]);
    $response = array();
    
    require_once __DIR__ . '/db_config.php';
    
    $connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
    
    if(!$connection) {
        die("Error conn: ".mysqli_connect_error());
    }
    
    $query = "select * from User where email = '$email' or phone = '$phone'";
    $is_exists = mysqli_query($connection,$query);

    if(mysqli_num_rows($is_exists)>0) {
        $response["success"] = 0;
        $response["message"] = "User already exists";
        echo json_encode($response);
    } else {
        
        $insertQry = "INSERT INTO User (full_name,email,phone,password) values ('$fullname','$email','$phone','$pass')";
        
        $result = mysqli_query($connection,$insertQry);
        
        if(mysqli_num_rows($result)>0) {
            $response["success"] = 1;
            $response["message"] = "User saved";
            echo json_encode($response);
        } else {
            $response["success"] = 0;
            $response["message"] = "Bruh";
            echo json_encode($response);
        }
    }
    
    mysqli_close($connection);
    
} else { 
    $response["success"] = 0;
    $response["message"] = "Send me param";
    echo json_encode($response);
}

?>
