<?php

$response = array();

require_once __DIR__ . '/db_config.php';

$connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);

if(!$connection) {
    die("Error conn: ".mysqli_connect_error());
}


$insertQry = "SELECT * FROM `Category`";

$result = mysqli_query($connection,$insertQry);

if(mysqli_num_rows($result)>0) {
    $response["categories"] = array();
    while($row = mysqli_fetch_assoc($result)) {
        $categories = array();
        $categories["id"] = $row["id"];
        $categories["name"] = $row["category_name"];
        $categories["img"] = $row["category_img"];
        array_push($response["categories"],$categories);
    }

    $response["success"] = 1;
    echo json_encode($response);
} else {
    $response["success"] = 0;
    $response["message"] = "No data found";
    echo json_encode($response);
}

mysqli_close($connection);

?>
