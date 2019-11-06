<?php 
require("../config.php");
require("../form/common.php");
require("header.php");

(!isset($dbconn, $_SESSION['admin']))? header("Location: index.php") : "";

/*Szűrők paraméterei */
(isset($_GET['f_id']))? $f_id=$_GET['f_id'] : $f_id="";
(isset($_GET['f_nev']))? $f_nev=$_GET['f_nev'] : $f_nev="";
(isset($_GET['f_mail']))? $f_mail=$_GET['f_mail'] : $f_mail="";
//Oszlop szerinti rendezés rejtett input mezők paramétere
(isset($_GET['sort'])) ? $sort = $_GET['sort'] : $sort = "userid";
(isset($_GET['direction'])) ? $direction = $_GET['direction'] : $direction = "ASC";
//Focus beállítása az aktuális mezőre -rejtett input mező paramétere
(isset($_GET['focus']))? $focus=$_GET['focus'] : $focus="";

/*Rendezés oszlopok szerint*/
if(isset($_GET['sortUser'])){
    $sort = "userid";      
}
if(isset($_GET['sortName'])){
    if($sort != "nev")
        $direction="";
    $sort = "nev";            
}
if(isset($_GET['sortMail'])){
    if($sort != "email")
        $direction="";
    $sort = "email";          
}

if(isset($_GET['sortName']) || isset($_GET['sortMail']) || isset($_GET['sortUser'])){
    switch($direction){
        case "": $direction = "ASC"; $img="<img src=items/down.png>";
        break;
        case "ASC": $direction = "DESC"; $img="<img src=items/up.png>"; 
        break;
        case "DESC": $direction = "ASC"; $img="";
                     if(isset($_GET['sortUser'])) $img="<img src=items/down.png>";
                     $sort = "userid";                 
        break;
    }
}

/*Lapozó **********************************************/
$sql="SELECT count(userid) AS db from user
      WHERE userid LIKE '%$f_id%'
      AND nev LIKE '%$f_nev%'
      AND email LIKE '%$f_mail%'";
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
$url="users.php?focus=" . $focus . "&sort=" . $sort . "&direction=" . $direction . 
     "&f_id=" . $f_id . "&f_nev=" . $f_nev . "&f_mail=" . $f_mail;

/*Adatok lekérése ************************************************/      
     
$sql="SELECT userid, nev, email, pkep, tilt, admin,
      count(DISTINCT file) AS db_kep, count(DISTINCT komment) AS db_komm
      FROM user
      LEFT JOIN foto ON userid=artist
      LEFT JOIN kommentek ON userid=ertekelo
      WHERE userid LIKE '%$f_id%'
      AND nev LIKE '%$f_nev%'
      AND email LIKE '%$f_mail%'
      GROUP BY userid 
      ORDER BY $sort $direction
      LIMIT $start, $limit";
$result=mysqli_query($dbconn, $sql);

/*Felhasználó törlése */
if(isset($_POST['delete'])){
    @unlink("../users/" . $_POST['hid'] . ".jpg");
    @unlink("../users/" . $_POST['hid'] . ".png");
    delAllPhotosOfUser($_POST['hid']);
    $sql = "DELETE FROM user 
            WHERE userid='{$_POST['hid']}'"; 
    mysqli_query($dbconn, $sql);
    header("Location: users.php");        
}

(isset($_GET['reset']))? header("Location: users.php") : "";
?>
<main>
<h3>Felhasználók</h3>
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
<table id=users>
    <tr>
        <th rowspan="2"><img src="items/users.png"></th>
        <th><button type=submit name= sortUser form=filter>ID<?php echo (isset($_GET['sortUser']))? $img : "" ?></button></th>
        <th><button type=submit name= sortName form=filter>Név<?php echo (isset($_GET['sortName']))? $img : "" ?></button></th>
        <th class=td4><button type=submit name= sortMail form=filter>E-mail<?php echo (isset($_GET['sortMail']))? $img : "" ?></button></th>
        <th rowspan="2"><img src="items/photos.png"></th>
        <th rowspan="2"><img src="items/chat.png"></th>
        <th rowspan="2"><img src="items/bin.png"></th>
        <th rowspan="2" id="last_th"><img src="items/edit.png">
            <button id=counter type=submit name=reset form=filter onmouseover="onCounter(this, true)" onmouseout="onCounter(this, false)"><?php echo $all ?></button>
        </th>
    </tr>
    <tr id=tr_filter>     
        <td><input class=filter type="text" form=filter name=f_id tabindex=1 value="<?php echo $f_id; ?>">
            <button type=submit form=filter><img src="../items/find.png"></button></td>
        <td><input class=filter type="text" form=filter name=f_nev tabindex=2 value="<?php echo $f_nev; ?>">
            <button type=submit form=filter><img src="../items/find.png"></button></td>
        <td class=td4><input class=filter type="text" form=filter name=f_mail tabindex=3 value="<?php echo $f_mail; ?>">
            <button type=submit form=filter><img src="../items/find.png"></button></td>
    </tr>
    
    <?php 
    while($sor=mysqli_fetch_assoc($result)){
        ($sor['tilt'] > date("Y-m-d"))? $locked="class=locked" :$locked="";
        echo "<tr>\n
                 <td><img class=foto src=\"../users/{$sor['pkep']}\"></td>\n 
                 <td $locked>{$sor['userid']}</td>\n 
                 <td>{$sor['nev']}</td>\n 
                 <td class=td4>{$sor['email']}</td>\n 
                 <td class=icon><a href=\"photos.php?f_user={$sor['userid']}\">{$sor['db_kep']}</a></td>\n 
                 <td class=icon><a href=\"comments.php?f_user={$sor['userid']}\">{$sor['db_komm']}</a></td>\n 
                 <td class=icon>\n";
                 if(!$sor['admin'])
                    echo "<img src=\"items/bin.png\" id=d_{$sor['userid']} onmouseover=\"chgIcon(this, 'bin-red.png')\" onmouseout=\"chgIcon(this, 'bin.png')\" onclick=\"confirm(this)\">\n";
                 else echo "<img src=\"items/bin-grey.png\" id=grey>\n"; 
                    echo "</td>\n 
                 <td class=icon><a href=\"moduser.php?userid={$sor['userid']}\">
                    <img src=\"items/pen.png\" id={$sor['userid']} onmouseover=\"chgIcon(this, 'pen-blue.png')\" onmouseout=\"chgIcon(this, 'pen.png')\">\n
                </a></td>\n 
              </tr>\n";
    }
    ?>

</table>
</main> 
  
    <script src="view/script.js" type="text/javascript"></script> 
</body>
</html>
