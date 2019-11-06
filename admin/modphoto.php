<?php 
require("../config.php");
require("../form/common.php");
require("header.php");

(!isset($dbconn, $_SESSION['admin']))? header("Location: index.php") : "";

if(isset($_GET['file'])){
    $file=$_GET['file'];
    // Kategóriák lekérdezése a select-hez
    $kategoriak = kategoriak();
    // Képadatok lekérdezése
    $sql = "SELECT artist, katid, cim, story, blende, zarido, iso, 
                   focus, kamera, obi, date, public, kategoria
            FROM foto JOIN kategoria on foto.katid=kategoria.id
            WHERE file='$file'";
    $sor = mysqli_fetch_assoc(mysqli_query($dbconn, $sql));
    $public=$sor['public'];
}else
    header("Location: photos.php");

if(isset($_POST['update'])){
    //Változók 
    $cim = tisztit($_POST['cim']);
    $katid = $_POST['kategoria'];
    $kamera = tisztit($_POST['kamera']);
    $obi = tisztit($_POST['obi']);
    $zarido = tisztit($_POST['zarido']);
    $blende = tisztit($_POST['blende']);
    $iso = tisztit($_POST['iso']);
    $focus = tisztit($_POST['focus']);
    $story = tisztit($_POST['story']);
    (isset($_POST['public']))? $public=1 : $public=0;
    //integer típusú mezők csak akkor kerülhetnek a lekérdezésbe, ha van bennük adat
    (empty($iso) || $iso == 0)? $iso=" " : $iso="iso=".$iso.", ";
    (empty($focus) || $focus == 0)? $focus=" " : $focus="focus=".$focus.", ";

    $sql = "UPDATE foto SET katid=$katid, cim='$cim', story='$story',
            kamera='$kamera', obi='$obi', zarido='$zarido', blende='$blende',
            $iso $focus public=$public 
            WHERE file='$file'";
    if (mysqli_query($dbconn, $sql))
        header("Location: photos.php");
    else
        $error = "MySqli hiba (" . mysqli_errno($dbconn) . "): " . mysqli_error($dbconn);        
}
if(isset($_POST['reset'])) header("Location: photos.php");

?>

<main>
    <h2>Képadatok módosítása</h2>
    <!--Hiba kiírása -->
    <?php if(isset($error)): ?>
        <div id=alert>
            <h3>Hiba!</h3>
            <ul>
                <li><?php echo $error ?></li>
            </ul>
            <button type=button id=hideBtn onclick="hideAlert('alert')">OK</button>
        </div>
    <?php endif ?>

    <fieldset id=photomod>
        <legend><a href="modphoto.php?file=<?php echo $_GET['file'] ?>&date=<?php echo $_GET['date'] ?>"><?php echo $_GET['file']?></a></legend>
        <form method="POST">
            <div id=top>    
                <img id=photo src="../photos/thumbs/<?php if(isset($file)) echo $file ?>" alt="foto">
                <div id=p-datas>
                    <div>
                        <label for=cim> Kép címe:<br> 
                            <input type=text name=cim id=cim title="A kép címe" maxlength=32 value="<?php echo (isset($cim))? $cim : $sor['cim'] ?>">
                        </label>
                        <label for=kategoria>Kategória *:<br>
                            <select name=kategoria id=kategoria title="Kategória választás">
                                <?php while ($kategoria = mysqli_fetch_assoc($kategoriak)): ?>
                                    <?php if ($kategoria['id'] == $sor['katid']): ?>
                                    <option selected value="<?php echo $kategoria['id'] ?>"><?php echo $kategoria['kategoria'] ?></option>    
                                    <?php else: ?>
                                    <option value="<?php echo $kategoria['id'] ?>"><?php echo $kategoria['kategoria'] ?></option>    
                                    <?php endif ?> 
                                <?php endwhile ?>
                            </select>
                        </label>
                    </div>
                    <div>
                        <p>Készült: <?php echo strtr($sor['date'], "-", ".") ?></p>
                        <p>Feltöltő: <a href="moduser.php?userid=<?php echo $sor['artist'] ?>"><?php echo $sor['artist']?></a></p>
                        <p>Feltöltve: <?php echo $_GET['date'] ?></p>
                        <label class=chkbox >Publikus? 
                            <input type=checkbox name=public id=public onclick="igenNem(this)"<?php if ($public) echo "checked" ?>>
                            <span><?php echo ($public)? "Igen" :"Nem"?></span></label>
                    </div>
                </div>
            </div>

            <div id=exif>
                <div id=device>
                    <p><label for=cam>Kamera:</label><br>
                    <input type=text name=kamera title="A gép típusa:" maxlength=64 value="<?php echo (isset($_POST['kamera']))? $_POST['kamera'] : $sor['kamera']?>"></p>
                    <p><label for=obi>Objektív:</label><br>
                    <input type=text name=obi title="Az objektív típusa:" maxlength=64 value="<?php echo (isset($_POST['obi']))? $_POST['obi'] : $sor['obi']?>"></p>
                </div>
                <div id=made>
                    <div>
                        <p><label for=zarido>Záridő (s):</label><br>
                            <input type=text name=zarido title="Zársebesség" maxlength=10 value="<?php echo (isset($_POST['zarido']))? $_POST['zarido'] : $sor['zarido']?>"></p>
                        <p><label for=blende>Rekesz:</label><br>
                            <input type=text name=blende title="Rekeszérték" maxlength=10 value="<?php echo (isset($_POST['blende']))? $_POST['blende'] : $sor['blende']?>"></p>
                    </div>
                    <div>
                        <p><label for=iso>ISO:</label><br>
                            <input type=number name=iso title="ISO érték" min=25 max=9999995 step=5 value="<?php echo (isset($_POST['iso']))? $_POST['iso'] : $sor['iso']?>"></p>
                        <p><label for=focus>Fókusz:</label><br>
                            <input type=number name=focus title="Fókusztávolság" min=1 max=5000 value="<?php echo (isset($_POST['focus']))? $_POST['focus'] : $sor['focus']?>"></p>
                    </div>
                </div>
            </div>
            <div id=bottom>
                <div>
                    <label for=story>Leírás a képről: </label><br>
                    <textarea name=story id=story cols=30 rows=8 maxlength="500" placeholder=" Max. 500 karakter!"><?php echo (isset($story))? $story : $sor['story'] ?></textarea>
                </div>
                <p id=gombok>
                    <input class=gomb type=submit name=reset value="Mégsem">
                    <input class=gomb type=submit name=update value="OK">
                </p>
            </div>
        </form>
    </fieldset>

    <script src="view/script.js" type="text/javascript"></script> 
</main>