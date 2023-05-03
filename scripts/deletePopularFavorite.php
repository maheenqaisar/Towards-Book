<?php

if(isset($_POST["popularproductId"]) && isset($_POST["userId"])) {
    
    $popularproductId = $_POST["popularproductId"];
    $userId = $_POST["userId"];
    $response = array();
    
    require_once __DIR__ . '/db_config.php';
    
    $connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
    
    if(!$connection) {
        die("Error conn: ".mysqli_connect_error());
    
    }
    
    $query = "Delete from PopularFavorites where userId = '$userId' and popularproductId = '$popularproductId'";
    $isSuccess = mysqli_query($connection,$query);
    
    if($isSuccess){
        
        $response["success"] = 4;
        $response["message"] = "Deleted to Popular Favorites";
        echo json_encode($response);
    } else {
        $response["success"] = 0;
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
