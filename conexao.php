<?php
    // Acess Information
    $driver = 'mysql';
    $server = 'localhost';
    $database = 'db_summer';
    $user = 'root';
    $password = 'root';

    // Connection
    $link = mysqli_connect($server, $user, $password, $database);

    // Error Checking
    if(!$link) {
        echo ("Erro interno do servidor");
    }
?>
