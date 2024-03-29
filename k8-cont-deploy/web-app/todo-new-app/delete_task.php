<?php
header("Content-Type: application/json");

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $data = json_decode(file_get_contents("php://input"));

    $id = $data->id;

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

    $sql = "DELETE FROM tasks WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);

    $success = $stmt->execute();

    $stmt->close();
    $conn->close();

    if ($success) {
        echo json_encode(["success" => true]);
    } else {
        echo json_encode(["success" => false]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Invalid request method."]);
}
?>

