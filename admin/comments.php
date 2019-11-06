<?php 
require("../config.php");
require("../form/common.php");
require("header.php");

(!isset($dbconn, $_SESSION['admin']))? header("Location: index.php") : "";

/*Szűrők paraméterei */
(isset($_GET['f_file']))? $f_file=$_GET['f_file'] : $f_file="";
(isset($_GET['f_komment']))? $f_komment=$_GET['f_komment'] : $f_komment="";
(isset($_GET['f_date']))? $f_date=$_GET['f_date'] : $f_date="";
(isset($_GET['f_user']))? $f_user=$_GET['f_user'] : $f_user="";
//Oszlop szerinti rendezés rejtett input mezők paramétere
(isset($_GET['sort'])) ? $sort = $_GET['sort'] : $sort = "datum ";
(isset($_GET['direction'])) ? $direction = $_GET['direction'] : $direction = "DESC";
//Focus beállítása az aktuális mezőre -rejtett input mező paramétere
(isset($_GET['focus']))? $focus=$_GET['focus'] : $focus="";

/*Rendezés oszlopok szerint*/
if(isset($_GET['sortFile'])){
    if($sort != "kep")
        $direction="";
    $sort = "kep";            
}
if(isset($_GET['sortComment'])){
    if($sort != "komment")
        $direction="";
    $sort = "komment";          
}
if(isset($_GET['sortUser'])){
    if($sort != "ertekelo")
        $direction="";
    $sort = "ertekelo";          
}
if(isset($_GET['sortDate'])){
    $sort = "datum";          
}

if(isset($_GET['sortFile']) || isset($_GET['sortComment'])
     || isset($_GET['sortUser']) || isset($_GET['sortDate'])){
    switch($direction){
        case "": $direction = "ASC"; $img="<img src=items/down.png>"; 
        break;
        case "ASC": $direction = "DESC"; $img="<img src=items/up.png>"; 
        break;
        case "DESC": $direction = "DESC"; $img="";
                     if(isset($_GET['sortDate'])){
                         $direction = "ASC";
                         $img="<img src=items/down.png>";
                     } 
                     $sort = "datum";  
        break;
    }
}

/*Lapozó **********************************************/
$sql="SELECT count(id) AS db FROM kommentek
      WHERE kep LIKE '%$f_file%'
      AND komment LIKE '%$f_komment%'
      AND ertekelo LIKE '%$f_user%' 
      AND datum LIKE '%$f_date%'";

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
$url="comments.php?focus=" . $focus . "&sort=" . $sort . "&direction=" . $direction . 
     "&f_file=" . $f_file . "&f_komment=" . $f_komment . "&f_date=" . $f_date . "&f_user=" . $f_user;

/*Adatok lekérése ************************************************/            
$sql="SELECT id, ertekelo, kep, komment, datum
      FROM kommentek
      WHERE kep LIKE '%$f_file%'
      AND komment LIKE '%$f_komment%'
      AND ertekelo LIKE '%$f_user%' 
      AND datum LIKE '%$f_date%' 
      ORDER BY $sort $direction
      LIMIT $start, $limit";
$result=mysqli_query($dbconn, $sql);

/* Hozzászólás törlése */
if(isset($_POST['delete'])){
    $sql = "DELETE FROM kommentek 
            WHERE id='{$_POST['hid']}'"; 
    mysqli_query($dbconn, $sql);
    header("Location: comments.php");        
}
/* Hozzászólás módosítása */
if(isset($_POST['e_komm'])){
    $sql="UPDATE kommentek SET komment='{$_POST['e_komm']}'
          WHERE id={$_POST['k_id']}";
    mysqli_query($dbconn, $sql);  
    header("Location: comments.php");    
}
(isset($_GET['reset']))? header("Location: comments.php") : "";
?>
<main>
<h3>Hozzászólások</h3>  
<form id="filter" method="GET">
    <input id=focus name=focus type=hidden value="<?php echo (isset($_GET['focus']))? $_GET['focus'] : "" ?>">
    <input id=sort name=sort type=hidden value="<?php echo $sort ?>">
    <input id=direction name=direction type=hidden value="<?php echo $direction ?>">
</form>
<!--Hozzászólás módosítás form: A szerkesztés ikonra klikkelve JS jeleníti meg a textarea mezőt a módosításhoz.
    A rejtett input mező a szerkesztett cella azonosítójának tárolására szolgál.-->
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

<table id=comments>
<tr>
    <th rowspan="2"><img src="items/photos.png"></th>
    <th><button type=submit name= sortFile form=filter>File<?php echo (isset($_GET['sortFile']))? $img : "" ?></button></th>
    <th class=td3><button type=submit name= sortComment form=filter>Hozzászólás<?php echo (isset($_GET['sortComment']))? $img : "" ?></button></th>
    <th><button type=submit name= sortUser form=filter>userid<?php echo (isset($_GET['sortUser']))? $img : "" ?></button></th>
    <th><button type=submit name= sortDate form=filter>Dátum/idő<?php echo (isset($_GET['sortDate']))? $img : "" ?></button></th>
    <th rowspan="2"><img src="items/bin.png"></th>
    <th rowspan="2" id="last_th"><img src="items/edit.png">
        <button id=counter type=submit name=reset form=filter onmouseover="onCounter(this, true)" onmouseout="onCounter(this, false)"><?php echo $all ?></button>
    </th>    
</tr>
<tr id=tr_filter>
    <td><input  class=filter type="text" form=filter name=f_file tabindex=1 value="<?php echo $f_file; ?>">
        <button type=submit form=filter><img src="../items/find.png"></button></td>
    <td class=td3><input  class=filter type="text" form=filter name=f_komment tabindex=2 value="<?php echo $f_komment; ?>">
        <button type=submit form=filter><img src="../items/find.png"></button></td>
    <td><input  class=filter type="text" form=filter name=f_user tabindex=3 value="<?php echo $f_user; ?>">
        <button type=submit form=filter><img src="../items/find.png"></button></td>
    <td><input  class=filter type="text" form=filter name=f_date tabindex=4 value="<?php echo $f_date; ?>">
        <button type=submit form=filter><img src="../items/find.png"></button></td>
    </td>        
</tr>

<?php 
        while($sor=mysqli_fetch_assoc($result)){
            $fname=strtok($sor['kep'], ".");          
            echo "<tr>\n
                     <td><img class=foto src=\"../photos/thumbs/{$sor['kep']}\"></td>\n 
                     <td class=td2>$fname</td>\n 
                     <td class=td3 id=k_{$sor['id']}>{$sor['komment']}</td>\n 
                     <td class=td4><a href=\"moduser.php?userid={$sor['ertekelo']}\">{$sor['ertekelo']}</a></td>\n 
                     <td class=td5>{$sor['datum']}</td>\n 
                     <td class=icon>
                        <img src=\"items/bin.png\" id=d_{$sor['id']} onmouseover=\"chgIcon(this, 'bin-red.png')\" onmouseout=\"chgIcon(this, 'bin.png')\" onclick=\"confirm(this)\">\n
                     </td>\n 
                     <td class=icon>
                        <img src=\"items/pen.png\" id={$sor['id']} onmouseover=\"chgIcon(this, 'pen-blue.png')\" onmouseout=\"chgIcon(this, 'pen.png')\" onclick=\"editTxtFields(this, 'textarea')\">\n
                     </td>\n 
                  </tr>";
        }
    ?>

</table>
</main> 
    <script src="view/script.js" type="text/javascript"></script> 
</body>
</html>