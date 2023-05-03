<?php

if(isset($_POST["recommendproductId"]) && isset($_POST["userId"])) {
    
    $recommendproductId = $_POST["recommendproductId"];
    $userId = $_POST["userId"];
    $response = array();
    require_once __DIR__ . '/db_config.php';
    
    $connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);

    if(!$connection) {
        
        die("Error conn: ".mysqli_connect_error());
    }
    
    $query = "Insert Into RecommendFavorites (recommendproductId,userID) values ('$recommendproductId','$userId')";
    $isSuccess = mysqli_query($connection,$query);

    if($isSuccess) {
        
        $response["success"] = 4;
        $response["message"] = "Added to Recommend Favorites";
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
