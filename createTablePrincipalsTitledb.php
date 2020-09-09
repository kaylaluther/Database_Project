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

$sql="
CREATE TABLE title.principals (
	tconst		varchar(9),
	ordering	int(2),
	nconst		varchar(255),
	category	varchar(255),
	job		varchar(255),
	characters 	varchar(255)
)";

if (mysqli_query($conn, $sql)) {
    echo "New table principals created successfully";
} else {
   echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}
'<br />';

$conn->close();
?>