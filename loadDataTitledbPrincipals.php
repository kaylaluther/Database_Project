<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "title";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
'<br />';

echo "Connected successfully";

//TITLE.PRINCIPALS TABLE
$sql = "LOAD DATA INFILE '/wamp64/www/webpage/title.principals.tsv' INTO TABLE principals IGNORE 1 LINES";

if (mysqli_query($conn, $sql)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}
'<br />';


$conn->close();
?>