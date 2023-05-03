<?php
if(isset($_POST["userId"])) {
    
    $id = $_POST["userId"];
    $response = array();
    
    require_once __DIR__ . '/db_config.php';
    
    $connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
    
    if(!$connection) {
        die("Error conn: ".mysqli_connect_error());
    }
    
    $insertQry = "SELECT RecommendProduct.* FROM `RecommendFavorites`
    
    INNER JOIN RecommendProduct on RecommendProduct.id = RecommendFavorites.recommendproductId
    
    WHERE userId = '$id'";
    $result = mysqli_query($connection,$insertQry);
    
    if(mysqli_num_rows($result)>0) {
        $response["recommendfavorites"] = array();
        while($row = mysqli_fetch_assoc($result)) {
            $recommendfavorites = array();
            $recommendfavorites["id"] = $row["id"];
            $recommendfavorites["name"] = $row["RecommendProduct_name"];
            $recommendfavorites["recommendcategory"] = $row["recommend_name"];
            $recommendfavorites["description"] = $row["recc_descrb"];
            $recommendfavorites["price"] = $row["price"];
            $recommendfavorites["img"] = $row["img"];
            array_push($response["recommendfavorites"],$recommendfavorites);
        }
        $response["success"] = 1;
        echo json_encode($response);
    } else {
        $response["success"] = 0;
        $response["message"] = "No data found";
        echo json_encode($response);
    }
    
    mysqli_close($connection);
} else {
    $response["success"] = 0;
    $response["message"] = "Send me parameters";
    echo json_encode($response);
}
?>
