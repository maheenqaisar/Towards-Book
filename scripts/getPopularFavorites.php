<?php
if(isset($_POST["userId"])) {
    
    $id = $_POST["userId"];
    $response = array();
    
    require_once __DIR__ . '/db_config.php';
    
    $connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
    
    if(!$connection) {
        die("Error conn: ".mysqli_connect_error());
    }
    
    $insertQry = "SELECT PopularProduct.* FROM `PopularFavorites`
    
    INNER JOIN PopularProduct on PopularProduct.id = PopularFavorites.popularproductId
    
    WHERE userId = '$id'";
    $result = mysqli_query($connection,$insertQry);
    
    if(mysqli_num_rows($result)>0) {
        $response["popularfavorites"] = array();
        while($row = mysqli_fetch_assoc($result)) {
            $popularfavorites = array();
            $popularfavorites["id"] = $row["id"];
            $popularfavorites["name"] = $row["PopularProduct_name"];
            $popularfavorites["popularcategory"] = $row["popular_name"];
            $popularfavorites["description"] = $row["popular_descrb"];
            $popularfavorites["price"] = $row["price"];
            $popularfavorites["img"] = $row["img"];
            array_push($response["popularfavorites"],$popularfavorites);
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
