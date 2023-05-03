<?php

if(isset($_POST["id"])) {

    $id = $_POST["id"];
    $response = array();
    
    require_once __DIR__ . '/db_config.php';

    $connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
    
    if(!$connection) {
        die("Error conn: ".mysqli_connect_error());
    }
    
    $insertQry = "SELECT Product.id, Product.Product_name, Category.category_name, Product.category_descrb, Product.price, Product.link, Product.img FROM `Product`
    
    INNER JOIN Category on Category.id = Product.category_id where Product.category_id = '$id'";
    
    $result = mysqli_query($connection,$insertQry);
    
    if(mysqli_num_rows($result)>0) {
        $response["products"] = array();
        while($row = mysqli_fetch_assoc($result)) {

            $products = array();
            $products["id"] = $row["id"];
            $products["name"] = $row["Product_name"];
            $products["category"] = $row["category_name"];
            $products["description"] = $row["category_descrb"];
            $products["price"] = $row["price"];
            $products["link"] = $row["link"];
            $products["img"] = $row["img"];
            array_push($response["products"],$products);
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
