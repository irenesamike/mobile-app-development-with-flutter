<?php
// Database configuration
$servername = "localhost";
$username = "root;
$password = "";
$dbname = "image_capter_db";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM pictures";
$result = $conn->query($sql);

$pictures = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $pictures[] = array(
            'path' => $row["path"],
            'latitude' => $row["latitude"],
            'longitude' => $row["longitude"]
        );
    }
    echo json_encode($pictures);
} else {
    echo "0 results";
}

$conn->close();
?>
