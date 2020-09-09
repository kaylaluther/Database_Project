<?php
include_once 'pageheader.php';
?>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>IMDb Database Project-XXX Adult Movies XXX</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/maincss.css" rel="stylesheet">

</head>

<body>
<?php
  require "database.php";
  require "users.php";
  $users = new Users();
?>
<table>
	<tr>
		<th>XXX Primary Title XXX</th>
		<th>Primary Name</th>
		<th>Death Year</th>
       </tr>
<?php
foreach ($users->get() as $row) {
?>
	<tr>
		<td><?php echo $u["primaryTitle"]; ?></td>
		<td><?php echo $u["primaryName"]; ?></td>
		<td><?php echo $u["deathYear"]; ?></td>

       </tr>
<?php
}
?>
</table>

<?php

include_once 'pagefooter.php';
?>
</body>
</html>