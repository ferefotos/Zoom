<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zoom-admin</title>
    <link rel="shortcut icon" type="image/png" href="../items/favico.png" />
    <!--<link rel="stylesheet" href="view/normalize.css" type="text/css">-->
    <link rel="stylesheet" href="view/style.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">
    <script src="../script/jquery-3.3.1.min.js"  type="text/javascript"></script>
</head>
<body>

    <header>
        <div id=logo><a href="../index.php" target="_blank"><img src="../items/logo.png" alt="zoom logo"></a>Admin</div>
        <?php if(isset($_SESSION['admin'])): ?>    
        <menu>
            <ul>
                <li><a href="users.php">Felhasználók</a></li>
                <li><a href="photos.php">Képek</a></li>
                <li><a href="comments.php">Kommentek</a></li>
                <li><a href="categories.php">Kategóriák</a></li>
            </ul>
            <a href="index.php?logout=" id=logout>Kilépés</a>
        </menu>
        <img id=resp-menu src="items/menu.png" onclick="menu()">
        <?php endif?>
    </header>
  
        <!-- Törlés megerősítése ---------->
        <fieldset id=confirmbox>
        <legend></legend>
        <p>Biztos törölni szeretnéd?</p>
        <p id=xid></p>
        <form id="confirm" action="" method="POST">
            <input type=hidden name=hid id=hid value="">
            <div id=confbuttons>
                <input type="submit" name="delete" id="delete" value="Igen">
                <input type="submit" name="cancel" id="cancel" value="Nem">
            </div>
        </form>
        </fieldset>
        <!--Kijelentkezés-->    
        <?php 
            if(isset($_GET['logout'])){
                session_destroy(); 
                header("Location: index.php");
            } 
        ?>   