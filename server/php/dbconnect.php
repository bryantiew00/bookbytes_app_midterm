<?php
$servername = "localhost";
$username   = "tbl_user";
$password   = "";
$dbname     = "bookbyte database";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>