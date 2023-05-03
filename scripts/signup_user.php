<?php

$response = array();

if(isset($_POST["full_name"]) && isset($_POST["email"]) && isset($_POST["phone"]) && isset($_POST["password"])) {
    
    $full_name = $_POST["full_name"];
    $email = $_POST["email"];
    $phone = $_POST["phone"];
    $password = $_POST["password"];

    require_once __DIR__ . '/db_config.php';
    $connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
    
    if(!$connection) {
        die("Error conn: ".mysqli_connect_error());
    }
    
    $insertQry = "insert into User (full_name,email,phone,passwrod) values ('$full_name','$email','$phone','$password')";
   
    if(mysqli_query($connection,$insertQry)) {
        $response["success"] = 1;
        $response["message"] = "succesfuly inserted";
        echo json_encode($response);
        
    } else {
        $response["success"] = 0;
        $response["message"] = "not inserted err..";
        echo json_encode($response);
    }
} else {
    $response["success"] = 0;
    $response["message"] = "Required filed(s) is missing";
    echo json_encode($response);
}

mysqli_close($connection);
?>
