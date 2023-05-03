<?php
if(isset($_POST["userId"])) {
    
    $id = $_POST["userId"];
    $response = array();
    
    require_once __DIR__ . '/db_config.php';
    
    $connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
    
    if(!$connection) {
        die("Error conn: ".mysqli_connect_error());
    }
    
    $insertQry = "SELECT Product.* FROM `Favorites`
    
    INNER JOIN Product on Product.id = Favorites.productId
    
    WHERE userId = '$id'";
    $result = mysqli_query($connection,$insertQry);
    
    if(mysqli_num_rows($result)>0) {
        $response["favorites"] = array();
        while($row = mysqli_fetch_assoc($result)) {
            $favorites = array();
            $favorites["id"] = $row["id"];
            $favorites["name"] = $row["Product_name"];
            $favorites["category"] = $row["category_name"];
            $favorites["description"] = $row["category_descrb"];
            $favorites["price"] = $row["price"];
            $favorites["img"] = $row["img"];
            array_push($response["favorites"],$favorites);
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
