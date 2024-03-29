<?php
header("Content-Type: application/json");

//////////////////////////////////////////////////////////////////////////
    // Replace these values with your MySQL server configuration
    $host = "mysql";         
    $username = "todoapp";
    $password = "todoapp";
    $database = "todoapp";

    $conn = new mysqli($host, $username, $password, $database);

/////////////////////////////////////////////////////////////////////////


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM tasks";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $tasks = [];
    while ($row = $result->fetch_assoc()) {
        $tasks[] = $row;
    }
    echo json_encode($tasks);
} else {
    echo json_encode([]);
}

$conn->close();
?>

