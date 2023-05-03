<?php

if(isset($_POST["pass"]) && isset($_POST["email"])) {
    
    $email = $_POST["email"];
    $pass = $_POST["pass"];
    $response = array();
    
    require_once __DIR__ . '/db_config.php';
    
    $connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
    
    if(!$connection) {
    die("Error conn: ".mysqli_connect_error());
        
    }
    
    $query = "select * from User where email = '$email' and password = '$pass'";
    
    $result = mysqli_query($connection,$query);
    
    
    if(mysqli_num_rows($result)>0) {
        
        $response["user"] = array();
        while($row = mysqli_fetch_assoc($result)) {
            
            $user = array();
            $user["userId"] = $row["id"];
            $user["email"] = $row["email"];
            $user["full_name"] = $row["full_name"];
            
            break;
        }
        
        $response["success"] = 1;
        echo json_encode($user);
        
    } else {
        
        $response["success"] = 0;
        $response["message"] = "User Not Found";
        echo json_encode($response);
        
    }
    
    mysqli_close($connection);
    
} else {
    
    $response["success"] = 0;
    $response["message"] = "Send me param";
    echo json_encode($response);
}

?>
