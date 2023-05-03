<?php

$response = array();

require_once __DIR__ . '/db_config.php';

$connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);

if(!$connection) {
    die("Error conn: ".mysqli_connect_error());
}


$insertQry = "SELECT * FROM `Popular`";

$result = mysqli_query($connection,$insertQry);

if(mysqli_num_rows($result)>0) {
    $response["popularcategories"] = array();
    while($row = mysqli_fetch_assoc($result)) {
        $popularcategories = array();
        $popularcategories["id"] = $row["id"];
        $popularcategories["name"] = $row["popular_name"];
        $popularcategories["description"] = $row["popular_description"];
        $popularcategories["img"] = $row["popular_img"];
        array_push($response["popularcategories"],$popularcategories);
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
