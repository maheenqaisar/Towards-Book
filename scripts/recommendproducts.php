<?php

if(isset($_POST["id"])) {

    $id = $_POST["id"];
    $response = array();
    
    require_once __DIR__ . '/db_config.php';

    $connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
    
    if(!$connection) {
        die("Error conn: ".mysqli_connect_error());
    }
    
    $insertQry = "SELECT RecommendProduct.id, RecommendProduct.RecommendProduct_name, Recommend.recommend_name, RecommendProduct.price, RecommendProduct.link, RecommendProduct.recc_descrb, RecommendProduct.img FROM `RecommendProduct`
    
    INNER JOIN Recommend on Recommend.id = RecommendProduct.recommend_id where RecommendProduct.recommend_id = '$id'";
    
    $result = mysqli_query($connection,$insertQry);
    
    if(mysqli_num_rows($result)>0) {
        $response["recommendproducts"] = array();
        while($row = mysqli_fetch_assoc($result)) {

            $recommendproducts = array();
            $recommendproducts["id"] = $row["id"];
            $recommendproducts["name"] = $row["RecommendProduct_name"];
            $recommendproducts["recommend"] = $row["recommend_name"];
            $recommendproducts["description"] = $row["recc_descrb"];
            $recommendproducts["price"] = $row["price"];
            $recommendproducts["link"] = $row["link"];
            $recommendproducts["img"] = $row["img"];
            array_push($response["recommendproducts"],$recommendproducts);
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
