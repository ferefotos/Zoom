<?php 
require("../config.php");
require("../form/common.php");
require("header.php");

(!isset($dbconn, $_SESSION['admin']))? header("Location: index.php") : "";

//Oszlop szerinti rendezés rejtett input mezők paramétere
(isset($_GET['sort'])) ? $sort = $_GET['sort'] : $sort = "kategoria";
(isset($_GET['direction'])) ? $direction = $_GET['direction'] : $direction = "ASC";

/*Rendezés oszlopok szerint*/
if(isset($_GET['sortCatId'])){
    if($sort != "id")
        $direction="";
    $sort = "id";            
}
if(isset($_GET['sortCat'])){
    $sort = "kategoria";      
}
if(isset($_GET['sortDb'])){
    if($sort != "db_kep")
        $direction="";
    $sort = "db_kep";          
}

if(isset($_GET['sortCatId']) || isset($_GET['sortCat']) || isset($_GET['sortDb'])){
    switch($direction){
        case "": $direction = "ASC"; $img="<img src=items/down.png>";  
        break;
        case "ASC": $direction = "DESC"; $img="<img src=items/up.png>";  
        break;
        case "DESC": $direction = "ASC"; $img=""; 
                     if(isset($_GET['sortCat'])) $img="<img src=items/down.png>";
                     $sort = "kategoria";   
        break;
    }
}

/*Lapozó **********************************************/
$sql="SELECT count(id) AS db FROM kategoria";
$all=mysqli_fetch_assoc(mysqli_query($dbconn, $sql))['db']; //osszes találat
$limit=20; //találat/oldal
$pages=ceil($all/$limit); //oldalak száma
$current=(isset($_GET['page'])) ? $_GET['page'] : 1; //aktuális oldal
$start=($current -1 ) * $limit; 
if($current<=4){
    $from=1;
    ($pages>=6)? $to=6 : $to=$pages;
}elseif($current > 4 && $current<$pages-3){
    $from = $current-2;
    $to = $current+3;
}elseif($current>=$pages-3){
    ($pages>=6)? $from=$pages-5 : $from=1;
    $to=$pages;
}
//url összeállítása a lapozóhoz
$url="categories.php?sort=" . $sort . "&direction=" . $direction;

/*Adatok lekérése ************************************************/            

$sql="SELECT id, kategoria, count(file) AS db_kep
      FROM kategoria
      LEFT JOIN foto ON kategoria.id=foto.katid
      GROUP BY id
      ORDER BY $sort $direction
      LIMIT $start, $limit";
$result=mysqli_query($dbconn, $sql); 

//Új kategória
if(isset($_POST['newcat']) && !empty($_POST['newcat'])){
    $sql="INSERT INTO kategoria (kategoria) VALUES('{$_POST['newcat']}')";
    if(mysqli_query($dbconn, $sql)){
        header("Location: categories.php");
    }else
        $error = mysqli_errno($dbconn);
}
//kategória törlése
if(isset($_POST['delete'])){
    $sql = "DELETE FROM kategoria WHERE kategoria='{$_POST['hid']}'"; 
    mysqli_query($dbconn, $sql);
    header("Location: categories.php");
}
//kategória módosítása (átnevezése)
if(isset($_POST['e_kat']) && !empty($_POST['e_kat'])){
    $sql="UPDATE kategoria SET kategoria='{$_POST['e_kat']}'
          WHERE id={$_POST['k_id']}";    
    if(mysqli_query($dbconn, $sql)){
        header("Location: categories.php");
    }else
        $error = mysqli_errno($dbconn); 
}
//Hiba feldolgozása
if(isset($error)){
    if($error == 1062)
        $error="Van már ilyen kategória:";
    (isset($_POST['newcat'])) ? $id=$_POST['newcat'] : $id=$_POST['e_kat'];     
}

?>
<main>
<h3>Kategóriák</h3>
<!--Hiba kiíratás-->
<?php if(isset($error)): ?>
    <div id=alert>
        <h3>Hiba!</h3>
        <ul>
            <li><?php echo $error ?></li>
            <li><?php echo $id ?></li>
        </ul>
        <button type=button id=hideBtn onclick="hideAlert('alert')">OK</button>
    </div>
<?php endif ?>
<!--Szűrő form: rejtett mezők annak tárolására hogy melyik oszlop szerint és milyen irányban rendezünk-->
<form id="filter" method="GET">
    <input id=sort name=sort type=hidden value="<?php echo $sort ?>">
    <input id=direction name=direction type=hidden value="<?php echo $direction ?>">
</form>
<!--Kategória módosítás form: A szerkesztés ikonra klikkelve JS jeleníti meg az input mezőt a módosításhoz.
    A rejtett input mező a szerkesztett táblázat cella azonosítójának tárolására szolgál.-->
<form id="modTxt" method="POST">
    <input type="hidden" name=k_id id=k_id value="">
</form>
<!-- Lapozó-->
<?php if($pages>1):?>
<p class=lapozo><?php echo ($current != 1) ? "<a href=\"" .$url ."&page=1\"><span class=_2arrow>«&nbsp;</span></a>" : "<span class=_2arrow>«&nbsp;</span> " ?>
   <?php echo ($current > 1 && $current <= $pages) ? "<a href=\"" .$url ."&page=" . ($current-1) . "\"><span class=_arrow>< </span></a>" : "<span class=_arrow>< </span> " ?>
   <?php echo ($from>1) ? "..." :""?>
   <?php for($page=$from; $page <= $to; $page++){
        echo ($current != $page) ? "<a href=\"" .$url ."&page={$page}\"><span id=p" . $page. ">  {$page}  </span></a>  " : "<span id=p" . $page. ">" .$page." </span>";  
      }
    ?>
    <?php echo ($to!=$pages) ? "..." :""?>
   <?php echo ($current > 0 && $current < $pages) ? "<a href=\"" .$url ."&page=" . ($current+1) . "\"><span class=_arrow>> </span> </a>" : "<span class=_arrow>> </span> " ?>
   <?php echo ($current != $pages) ? "<a href=\"" .$url ."&page=$pages\"><span class=_2arrow>&nbsp;»</span></a>" : "<span class=_2arrow>&nbsp;»</span>" ?>
</p>
<?php endif?>

<table id=kategoriak>
    <tr>
        <th><button type=submit name= sortCatId form=filter>ID<?php echo (isset($_GET['sortCatId']))? $img : "" ?></button></th>
        <th><button type=submit name= sortCat form=filter>Kategória<?php echo (isset($_GET['sortCat']))? $img : "" ?></button></th>
        <th><button type=submit name= sortDb form=filter>Db<?php echo (isset($_GET['sortDb']))? $img : "" ?></button></th>
        <th rowspan="2"><img src="items/bin.png"></th>
        <th rowspan="2" id="last_th"><img src="items/edit.png">
            <button id=counter2><?php echo $all ?></button>
        </th> 
    </tr>
    <tr>
        <td></td>
        <td><form method="POST">
            <input type="text" name=newcat value="" placeholder="Új kategória" required>
            <button type=submit name=OKbtn>
                <img src="items/OK.png" id=OKimg onmouseover="chgIcon(this, 'OK-blue.png')" onmouseout="chgIcon(this, 'OK.png')">
            </button>
            <input id=focus name=focus type=hidden value="newcat">
            </form>
        </td>
        <td></td>
    </tr>

    <?php 
            while($sor=mysqli_fetch_assoc($result)){
                $del="<img src=\"items/bin-grey.png\" id=grey>\n";
                if($sor['db_kep'] == 0)
                    $del="<img src=\"items/bin.png\" id=d_{$sor['kategoria']} onmouseover=\"chgIcon(this, 'bin-red.png')\" onmouseout=\"chgIcon(this, 'bin.png')\" onclick=\"confirm(this)\">\n";
                echo "<tr>\n
                          <td>{$sor['id']}</td>\n  
                          <td id=k_{$sor['id']}>{$sor['kategoria']}</td>\n  
                          <td><a href=\"photos.php?f_kat={$sor['kategoria']}\">{$sor['db_kep']}</a></td>\n 
                          <td class=icon>\n
                            $del
                          </td>\n 
                          <td class=icon>\n
                            <img src=\"items/pen.png\" id={$sor['id']} onmouseover=\"chgIcon(this, 'pen-blue.png')\" onmouseout=\"chgIcon(this, 'pen.png')\" onclick=\"editTxtFields(this, 'text')\">\n
                          </td>\n
                      </tr>\n";
            }
    ?>


</table>
</main> 
    <script src="view/script.js" type="text/javascript"></script> 
</body>
</html>