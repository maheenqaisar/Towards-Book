<?php

if(isset($_POST["productId"]) && isset($_POST["userId"])) {

    $productId = $_POST["productId"];
    $userId = $_POST["userId"];
    $response = array();
    
    require_once __DIR__ . '/db_config.php';

    $connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
    
    if(!$connection) {
        die("Error conn: ".mysqli_connect_error());
    }
    
    $query = "select * from Favorites where userId = '$userId' and productId = '$productId'";
    
    $isSuccess = mysqli_query($connection,$query);
    
    if(mysqli_num_rows($isSuccess)>0) {

        $response["success"] = 1;
        echo json_encode($response);

    } else {

        $response["success"] = 4;
        $response["message"] = "Error";
        echo json_encode($response);
    
    }
    
    mysqli_close($connection);

} else {
    
    $response["success"] = 0;
    $response["message"] = "Send me param";
    echo json_encode($response);
}

?>
