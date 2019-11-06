<?php 
require("../config.php");
require("../form/common.php");
require("header.php");

(!isset($dbconn, $_SESSION['admin']))? header("Location: index.php") : "";

/*Szűrők paraméterei */
(isset($_GET['f_cim']))? $f_cim=$_GET['f_cim'] : $f_cim="";
(isset($_GET['f_story']))? $f_story=$_GET['f_story'] : $f_story="";
(isset($_GET['f_kat']))? $f_kat=$_GET['f_kat'] : $f_kat="";
(isset($_GET['f_file']))? $f_file=$_GET['f_file'] : $f_file="";
(isset($_GET['f_user']))? $f_user=$_GET['f_user'] : $f_user="";
//Oszlop szerinti rendezés rejtett input mezők paramétere
(isset($_GET['sort'])) ? $sort = $_GET['sort'] : $sort = "file ";
(isset($_GET['direction'])) ? $direction = $_GET['direction'] : $direction = "DESC";
//Focus beállítása az aktuális mezőre -rejtett input mező paramétere
(isset($_GET['focus']))? $focus=$_GET['focus'] : $focus="";

/*Rendezés oszlopok szerint*/
if(isset($_GET['sortTitle'])){
    if($sort != "cim")
        $direction="";
    $sort = "cim";            
}
if(isset($_GET['sortStory'])){
    if($sort != "story")
        $direction="";
    $sort = "story";          
}
if(isset($_GET['sortCat'])){
    if($sort != "kategoria")
        $direction="";
    $sort = "kategoria";          
}
if(isset($_GET['sortFile'])){
    $sort = "file";     
}
if(isset($_GET['sortUser'])){
    if($sort != "artist")
        $direction="";
    $sort = "artist";          
}

if(isset($_GET['sortTitle']) || isset($_GET['sortStory']) || isset($_GET['sortCat'])
     || isset($_GET['sortFile']) || isset($_GET['sortUser'])){
    switch($direction){
        case "": $direction = "ASC"; $img="<img src=items/down.png>";  
        break;
        case "ASC": $direction = "DESC"; $img="<img src=items/up.png>"; 
        break;
        case "DESC": $direction = "DESC"; $img="";
                     if(isset($_GET['sortFile'])){
                        $direction = "ASC"; 
                        $img="<img src=items/down.png>";
                     } 
                     $sort = "file";
        break;
    }
}

/*Lapozó **********************************************/
$sql="SELECT count(file) AS db FROM foto
      JOIN kategoria ON katid=id
      WHERE cim LIKE '%$f_cim%'
      AND story LIKE '%$f_story%'
      AND kategoria LIKE '%$f_kat%'
      AND file LIKE '%$f_file%'
      AND artist LIKE '%$f_user%'";
$all=mysqli_fetch_assoc(mysqli_query($dbconn, $sql))['db']; //osszes találat
$limit=20; //sor/oldal -a lekérdezendő sorok száma
$pages=ceil($all/$limit); //oldalak száma
$current=(isset($_GET['page'])) ? $_GET['page'] : 1; //aktuális oldal
$start=($current -1 ) * $limit; //az sql lekérdezés melyik rekordtól kezdődjön
/*Ha sok oldal van, csak 6 oldalt mutat a lapozó: « < ... 3 4 5 6 7 8 ... > » 
 * Az aktuális oldal előtti 2-t és az azt követő 3-at.*/
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
$url="photos.php?focus=" . $focus . "&sort=" . $sort . "&direction=" . $direction . "&f_cim=" . $f_cim . "&f_story=" . $f_story . 
      "&f_kat=" . $f_kat . "&f_file=" . $f_file . "&f_user=" . $f_user;

/*Adatok lekérése ************************************************/
$sql="SELECT file, artist, kategoria, cim, story, 
      count(DISTINCT komment) AS db_komm
      FROM foto
      JOIN kategoria ON katid=id
      LEFT JOIN kommentek ON file=kep
      WHERE cim LIKE '%$f_cim%'
      AND story LIKE '%$f_story%'
      AND kategoria LIKE '%$f_kat%'
      AND file LIKE '%$f_file%'
      AND artist LIKE '%$f_user%'
      GROUP BY file
      ORDER BY $sort $direction 
      LIMIT $start, $limit";

$result=mysqli_query($dbconn, $sql);
/* Kategóriák lekérdezése a kategória szűrőhöz (SELECT /OPTION) */
$sql="SELECT kategoria FROM kategoria
      JOIN foto ON foto.katid=kategoria.id
      GROUP BY kategoria ORDER BY kategoria";
$kategoriak=mysqli_query($dbconn, $sql);

/* Kép törlése */
if(isset($_POST['delete'])){
    $sql = "DELETE FROM foto 
            WHERE file='{$_POST['hid']}'"; 
    mysqli_query($dbconn, $sql);
    unlink("../photos/thumbs/" . $_POST['hid']);
    unlink("../photos/" . $_POST['hid']);
    header("Location: photos.php");        
}
(isset($_GET['reset']))? header("Location: photos.php") : "";
?>
<main>
<h3>Képek</h3>  
<form id="filter" method="GET">
    <input id=focus name=focus type=hidden value="<?php echo (isset($_GET['focus']))? $_GET['focus'] : "" ?>">
    <input id=sort name=sort type=hidden value="<?php echo $sort ?>">
    <input id=direction name=direction type=hidden value="<?php echo $direction ?>">
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
<table id=photos>
    <tr>
        <th rowspan="2"><img src="items/photos.png"></th>
        <th><button type=submit name= sortTitle form=filter>Cím<?php echo (isset($_GET['sortTitle']))? $img : "" ?></button></th>
        <th class=td3 ><button type=submit name= sortStory form=filter>Leírás<?php echo (isset($_GET['sortStory']))? $img : "" ?></button></th>
        <th class=td4><button type=submit name= sortCat form=filter>Kategória<?php echo (isset($_GET['sortCat']))? $img : "" ?></button></th>
        <th><button type=submit name= sortFile form=filter>File<?php echo (isset($_GET['sortFile']))? $img : "" ?></button></th>
        <th><button type=submit name= sortUser form=filter>userid<?php echo (isset($_GET['sortUser']))? $img : "" ?></button></th>
        <th rowspan="2" class=td7><img src="items/calendar.png"></th>
        <th rowspan="2" class=td8><img src="items/chat.png"></th>
        <th rowspan="2"><img src="items/bin.png"></th>
        <th rowspan="2" id="last_th"><img src="items/edit.png">
           <button id=counter type=submit name=reset form=filter onmouseover="onCounter(this, true)" onmouseout="onCounter(this, false)"><?php echo $all ?></button>
        </th>
    </tr>
    <tr id=tr_filter>     
        <td><input class="filter" type="text" form=filter name=f_cim tabindex=1 value="<?php echo $f_cim; ?>"> 
            <button type=submit form=filter><img src="../items/find.png"></button></td>
        <td class=td3><input class="filter" type="text" form=filter name=f_story tabindex=2 value="<?php echo $f_story; ?>">
            <button type=submit form=filter><img src="../items/find.png"></button></td>
        <td class=td4>
            <select name=f_kat id=kat form=filter onchange="this.form.submit()" tabindex=3>
            <option value=""></option>
                <?php while ($kategoria = mysqli_fetch_assoc($kategoriak)): ?>
                <?php if($kategoria['kategoria'] == $f_kat): ?>
                <option selected value="<?php echo $kategoria['kategoria']?>"><?php echo $kategoria['kategoria']?></option>
                <?php else: ?>
                <option value="<?php echo $kategoria['kategoria']?>"><?php echo $kategoria['kategoria']?></option>
                <?php endif; ?>
                <?php endwhile ?>
            </select>    
        </td>
        <td><input  class=filter type="text" form=filter name=f_file tabindex=4 value="<?php echo $f_file; ?>">
            <button type=submit form=filter><img src="../items/find.png"></button></td>
           
        <td><input  class=filter type="text" form=filter name=f_user tabindex=5 value="<?php echo $f_user; ?>">
            <button type=submit form=filter><img src="../items/find.png"></button></td>
    </tr>

    <?php 
        while($sor=mysqli_fetch_assoc($result)){
            $fname=strtok($sor['file'], ".");
            $date=date("Y.m.d.", substr($fname, 0, -3));
            echo "<tr>\n
                     <td class=td1><img class=foto src=\"../photos/thumbs/{$sor['file']}\"></td>\n 
                     <td class=td2>{$sor['cim']}</td>\n 
                     <td class=td3>{$sor['story']}</td>\n 
                     <td class=td4>{$sor['kategoria']}</td>\n 
                     <td class=td5>$fname</td>\n 
                     <td class=td6><a href=\"moduser.php?userid={$sor['artist']}\">{$sor['artist']}</a></td>\n 
                     <td class=td7>$date</td>\n 
                     <td class=\"icon td8\"><a href=\"comments.php?f_file={$sor['file']}\">{$sor['db_komm']}</a></td>\n 
                     <td class=icon>
                        <img src=\"items/bin.png\" id=d_{$sor['file']} onmouseover=\"chgIcon(this, 'bin-red.png')\" onmouseout=\"chgIcon(this, 'bin.png')\" onclick=\"confirm(this)\">\n
                     </td>\n 
                     <td class=icon><a href=\"modphoto.php?file={$sor['file']}&date=$date\">
                        <img src=\"items/pen.png\" id={$sor['file']} onmouseover=\"chgIcon(this, 'pen-blue.png')\" onmouseout=\"chgIcon(this, 'pen.png')\">\n
                    </a></td>\n 
                  </tr>";
        }
    ?>
                            
</table>
</main> 
    <script src="view/script.js" type="text/javascript"></script> 
</body>
</html>
