<?php 

$host = "localhost";
$username = "root";
$password = "";
$database = "dw_adventureworks";

$conn = mysqli_connect($host, $username, $password, $database);
if (!$conn) {
    die("<script>alert('Gagal tersambung dengan database.')</script>");
}
?>