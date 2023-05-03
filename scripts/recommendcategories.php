<?php

$response = array();

require_once __DIR__ . '/db_config.php';

$connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);

if(!$connection) {
    die("Error conn: ".mysqli_connect_error());
}


$insertQry = "SELECT * FROM `Recommend`";

$result = mysqli_query($connection,$insertQry);

if(mysqli_num_rows($result)>0) {
    $response["recommendcategories"] = array();
    while($row = mysqli_fetch_assoc($result)) {
        $recommendcategories = array();
        $recommendcategories["id"] = $row["id"];
        $recommendcategories["name"] = $row["recommend_name"];
        $recommendcategories["description"] = $row["recommend_description"];
        $recommendcategories["img"] = $row["recommend_img"];
        array_push($response["recommendcategories"],$recommendcategories);
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
