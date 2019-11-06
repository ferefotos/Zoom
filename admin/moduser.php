<?php
require("../config.php");
require("../form/common.php");
require("header.php");

(!isset($dbconn, $_SESSION['admin']))? header("Location: index.php") : "";

if(isset($_GET['userid'])){
    //Adatmódosításhoz az adatok lekérdezése
    $sql="SELECT * FROM user WHERE userid='{$_GET['userid']}'";
    $result = mysqli_query($dbconn, $sql);
    $sor = mysqli_fetch_assoc($result);
    $lock=$sor['tilt'];
    $admin=$sor['admin']; 
    // admin userek száma
    $dbAdmin = mysqli_fetch_assoc(mysqli_query($dbconn, "SELECT count(userid) AS db FROM user WHERE admin=1"))['db'];
    /*Azon input mezők azonosítója kerül bele összefűzve, amelyikekben hiba van 
    a feldolgozás során. Ennak alapján lesznek majd ezek a mezők piros szegéllyel
    megjelölve, jelezve, hol volt hiba*/
    $errorIds="";
}else 
    header("Location: users.php");

if(isset($_POST['update'])){
    //Változók
    $userid = tisztit($_POST['userid']);
    $jelszo = $_POST['jelszo'];
    $jelszo2 = $_POST['jelszo2'];
    $email = strtolower(tisztit($_POST['email']));
    $nev = ucwords(mb_strtolower(tisztit($_POST['nev'])));
    $cam = tisztit($_POST['cam']);
    $lens = tisztit($_POST['lens']);
    $rolam = tisztit($_POST['rolam']);
    (empty($_POST['avatar']))? $pkep = $sor['pkep'] : $pkep="avatar.png";
    (!empty($_POST['lock']))? $lock=$_POST['lock'] : $lock=$sor['tilt'];
    // 1 adminnak mindenképpen lenni kell. Ha csak 1 van, annak nem lehet elvenni az admin jogát 
    (isset($_POST['admin']) || ($dbAdmin<2 && $admin == 1))? $admin=1 : $admin=0;
    /* Vizsgálat ************************************************************/
    if (empty($userid)){
        $errors[] = "Nem adtál meg felhasználónevet!";
        $errorIds ="userid";
    }
    elseif (strlen($userid) < 6){
        $errors[] = "A felhasználónév minimum 6 karakter!";    
        $errorIds .="userid";
    }
    elseif($userid !=$sor['userid']){ 
        $sql = "SELECT COUNT(*) AS db FROM user WHERE userid='{$userid}'";
        $db = mysqli_fetch_assoc(mysqli_query($dbconn, $sql));
        if ($db['db'] != 0){
            $errors[] = "Foglalt felhasználónév!";
            $errorIds .="userid";
        }
    }

    if(!empty($jelszo) && strlen($jelszo)<8){
        $errors[] = "A jelszó minimum 8 karakter!";
        $errorIds .="passw";
    }
    elseif($jelszo2 != $jelszo){
        $errors[] = "Nem egyezik a megismételt jelszó!";    
        $errorIds .="passw2";
    }

    if (empty($email)){
        $errors[] = "Nem adtál meg e-mail címet!";
        $errorIds .="email";
    }
    elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)){
        $errors[] = "Rossz e-mail címet adtál meg!";  
        $errorIds .="email";
    }
    elseif($email != $sor['email']){
        $sql = "SELECT COUNT(*) AS db FROM user WHERE email='{$email}'";
        $db = mysqli_fetch_assoc(mysqli_query($dbconn, $sql));
        if ($db['db'] != 0){
            $errors[] = "Foglalt e-mail cím!";
            $errorIds .="email";
        }
    }

    if (empty($nev)){
        $errors[] = "Nem adtál meg nevet!";
        $errorIds .="nev";
    }
    if (strlen($rolam) > 500){
        $errors[] = "A bemutatkozás max. 500 karakter!"; 
        $errorIds .="rolam";
    }

    //Ha nincs hiba:     
    if (!isset($errors)){
        //jelszó
        if(!empty($jelszo))  //ha lett beírva jelszó
            $jelszo = sha1($jelszo);
        else                //ha nem lett módosítva (üres jelszómező)
            $jelszo =  $sor['jelszo'];    
        
        // Ha változott a username, a fotót is át kell nevezni
        if ($pkep != "avatar.png" && $userid != $sor['userid']) {
            $new_pkep = substr_replace($pkep, $userid, 0, -4);
            rename("../users/" . $pkep, "../users/" . $new_pkep);
            $pkep = $new_pkep;
        }elseif($pkep == "avatar.png" && $sor['pkep'] != "avatar.png")
            @unlink("../users/" . $sor['pkep']); 
        
        $sql = "UPDATE user SET
                userid='{$userid}', jelszo='{$jelszo}', email='{$email}', nev='{$nev}',
                pkep='{$pkep}', rolam='{$rolam}', cam='{$cam}', lens='{$lens}', admin='{$admin}', tilt='{$lock}'
                WHERE userid='{$_GET['userid']}'";
        if (mysqli_query($dbconn, $sql))
            header("Location: users.php");
        else
            $errors[] = "MySqli hiba (" . mysqli_errno($dbconn) . "): " . mysqli_error($dbconn);
    }

}
if(isset($_POST['reset'])) header("Location: users.php");

?>

<main>
    <h2>Felhasználó módosítása</h2>
    <!--Ha hiba van az űrlap feldolgozásnál: hibák kiíratása-->
    <?php if(isset($errors)): ?>
        <div id=alert>
            <h3>Hiba!</h3>
            <ul>
                <?php foreach ($errors as $err) echo "<li>{$err}</li>\n"; ?>
            </ul>
            <button type=button id=hideBtn onclick="hideAlert('alert')">OK</button>
        </div>
    <?php endif ?>
   <!--Az űrlap mezőkbe a lekért adatok kerülnek, illetve ha módosítunk egy mezőt, de a feldolgozásnál hiba van
     akkor a módosított adat ($_POST) íródik vissza. Ilyenkor a módosított mezők tartalma kék színű lesz, jelezve, hogy
     módosítva lett. Azok a mezők amelyek hibásan lettek kitöltve, piros keretet kapnak. 
     Felhasználó tiltása: Az aktuális dátumnál későbbi dátum beállítása. Ekkor piros színűre vált a dátum (JS). -->         
    <fieldset id=moduser>
        <legend><a href="moduser.php?userid=<?php echo $_GET['userid'] ?>"><?php echo $_GET['userid']?></a></legend>
        <form method="POST">
            <div id=topFields>
                <div>
                <img <?php echo (isset($pkep) && $pkep != $sor['pkep'])? "id=pkep-b" : "id=pkep"?> src="../users/<?php echo isset($pkep) ? $pkep : $sor['pkep'] ?>">
                <button type=button id=reset_pkep onclick="chgAvatar()">Kép törlése</button>
                <input type=hidden id=avatar name=avatar value="">
                </div>
                <div>
                    <p>
                        <label for="nev">Név: *</label><br>
                        <input type="text" name="nev" class="<?php if(isset($nev) && $nev != $sor['nev']) echo "blue " ?>
                                <?php if(strpos($errorIds, "nev") !== false) echo "red" ?>" maxlength="64" 
                                value="<?php echo (isset($nev))? $nev : $sor['nev'] ?>" title="név">
                    </p>
                    <p>
                        <label for="email">E-mail cím: *</label><br>
                        <input type="email" name="email" class="<?php if(isset($email) && $email != $sor['email']) echo "blue " ?>
                                <?php if(strpos($errorIds, "email") !== false) echo "red" ?>" maxlength="64" 
                                value="<?php echo (isset($email))? $email : $sor['email'] ?>" title="e-mail cím">
                    </p>
                    <p>
                        <label class="chkbox<?php if($admin != $sor['admin']) echo " blue" ?>"> Admin:
                            <input type=checkbox name=admin id=admin onclick="igenNem(this)" <?php echo ($admin)? "checked": "" ?> 
                                    <?php if($dbAdmin<2 && $admin == 1 && !isset($errors)) echo "disabled" ?>>
                                <span><?php echo ($admin)? "Igen": "Nem" ?></span>
                        </label>
                    </p>
                    <p>
                        <label for="">Tiltás: 
                            <input type="date" name=lock id=lock value="<?php echo ($lock > "0000-00-00")? $lock : "" ?>">
                        </label>
                    </p>
                </div>
                <div>
                    <p>
                        <label for="user">Felhasználónév: *</label><br>
                        <input type="text" name="userid" Class="<?php if(isset($userid) && $userid != $sor['userid']) echo "blue " ?>
                                <?php if(strpos($errorIds, "userid") !== false) echo "red" ?>" maxlength="16" 
                                value="<?php echo (isset($userid))? $userid : $sor['userid'] ?>" 
                                autofocus placeholder="minimum 6 karakter" title="Felhasználónév">
                    </p>
                    <p>
                        <label for="jelszo">Jelszó: </label><br>
                        <input type="password" name="jelszo" class="<?php if(strpos($errorIds, "passw") !== false) echo "red" ?>" 
                                 maxlength="16" value="" placeholder="minimum 8 karakter" title="jelszó">
                    </p>
                    <p>
                        <label for="jelszo2">Jelszó ismét: *</label><br>
                        <input type="password" name="jelszo2" class="<?php if(strpos($errorIds, "passw2") !== false) echo "red" ?>" 
                                 maxlength="16" value="" title="Jelszó megismétlése!">
                    </p>
    
                </div>
            </div>
            
            <div id=bottomFields>
                <div>
                    <p>
                        <label for="rolam">Bemutatkozás:</label><br>
                        <textarea name="rolam" class="<?php if(isset($rolam) && $rolam != $sor['rolam']) echo "blue" ?>
                                    <?php if(strpos($errorIds, "rolam") !== false) echo "red" ?>" 
                                     cols="44" rows="8" placeholder="Felhasználó bemutatkozása"><?php echo (isset($rolam))? $rolam : $sor['rolam'] ?></textarea>
                    </p>
                </div>
                <div>
                    <p>
                        <label for="camera">Fényképezőgép típusa:</label><br>
                        <input type="text" name="cam" <?php if(isset($cam) && $cam != $sor['cam']) echo "class=blue" ?> maxlength="64" value="<?php echo (isset($cam))? $cam : $sor['cam'] ?>" title="A fényképezőgéped típusa">
                    </p>
                    <p>
                        <label for="lens">Objektív típusa:</label><br>
                        <input type="text" name="lens" <?php if(isset($lens) && $lens != $sor['lens']) echo "class=blue" ?> maxlength="64" value="<?php echo (isset($lens))? $lens : $sor['lens'] ?>" title="Az objektív típusa">
                    </p>
                    <p id=gombok>
                        <input class="gomb" type="submit" name="reset" value="Mégsem">
                        <input class="gomb" type="submit" name="update" value="OK">
                    </p>
                </div>
            </div>
        </form>
    </fieldset>

</main>
    <script src="view/script.js" type="text/javascript"></script> 
</body>
</html>