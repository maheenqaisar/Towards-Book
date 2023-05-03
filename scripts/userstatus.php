<?php
    
require_once __DIR__ . '/db_config.php';

$conn = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "Connection OK, ";
}

$age = $_POST['a'];
$gender = $_POST['b'];

$sql = "INSERT INTO UserStatus (age, gender) VALUES ('$age','$gender');";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
 
?>

