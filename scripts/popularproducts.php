<?php

if(isset($_POST["id"])) {

    $id = $_POST["id"];
    $response = array();
    
    require_once __DIR__ . '/db_config.php';

    $connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
    
    if(!$connection) {
        die("Error conn: ".mysqli_connect_error());
    }
    
    $insertQry = "SELECT PopularProduct.id, PopularProduct.PopularProduct_name, PopularProduct.popular_descrb, Popular.popular_name, PopularProduct.price, PopularProduct.link, PopularProduct.img FROM `PopularProduct`
    
    INNER JOIN Popular on Popular.id = PopularProduct.popular_id where PopularProduct.popular_id = '$id'";
    
    $result = mysqli_query($connection,$insertQry);
    
    if(mysqli_num_rows($result)>0) {
        $response["popularproducts"] = array();
        while($row = mysqli_fetch_assoc($result)) {

            $popularproducts = array();
            $popularproducts["id"] = $row["id"];
            $popularproducts["name"] = $row["PopularProduct_name"];
            $popularproducts["popular"] = $row["popular_name"];
            $popularproducts["description"] = $row["popular_descrb"];
            $popularproducts["price"] = $row["price"];
            $popularproducts["link"] = $row["link"];
            $popularproducts["img"] = $row["img"];
            array_push($response["popularproducts"],$popularproducts);
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
