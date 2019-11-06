<?php 
require("../config.php");
require("../form/common.php");

if(isset($_POST['login'])){
    $username=tisztit($_POST['username']);
    $password = sha1($_POST['password']);

    $sql = "SELECT userid, nev, pkep, email, admin
            FROM user
            WHERE userid = '{$username}'
            AND jelszo = '{$password}'
            LIMIT 2";
    $result = mysqli_query($dbconn, $sql);
    if(mysqli_num_rows($result) == 1){
        $sor=mysqli_fetch_assoc($result);
        if($sor['admin']){ //Admin jogosultság vizsgálata
            $_SESSION['userid'] = $username;
            $_SESSION['nev'] = $sor['nev'];
            $_SESSION['keresztnev'] = mb_substr($sor['nev'], mb_strpos($sor['nev'], " "));
            $_SESSION['pkep'] = $sor['pkep'];
            $_SESSION['email'] = $sor['email'];
            $_SESSION['admin'] = $sor['admin'];
        }else
            header("Location: ../index.php");

    }else
        $error="Hibás felhasználónév vagy jelszó!";  

}
require("header.php");
?>
     
<!----------------------------------->
    <main> 
      <?php if(!isset($_SESSION['userid'])): ?>
        <fieldset>
            <legend>Bejelentkezés</legend>
            <form id="adminlog" method="POST">
                <p>
                    <label for="username">Felhasználónév:</label>
                    <input type="text" name=username required value=<?php echo (isset($username))? $username : "" ?>>
                </p>
                <p>
                    <label for="password">Jelszó: </label>
                    <input type="password" name=password required>
                </p><br>
                <p>
                    <input type="submit" name="login" id="login" value="Belépés">
                </p>
            </form>
            <p class=error><?php if(isset($error)) echo($error); ?></p>
        </fieldset>  
      <?php elseif(isset($_SESSION['admin'])): header("Location: users.php");?>       
      <!--A galériában bejelentkezett, de nem admin jogú felhasználó próbál az admin oldalra jutni-->
      <?php else: header("Location: ../index.php"); endif; ?> 
    </main> 
</body>
</html>