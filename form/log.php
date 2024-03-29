<?php
require("../config.php");
/*********************************************
 *   Felhasználó be- és kijelentkeztetése    *
 *********************************************/

if (isset($_POST['login'])) {
    $userid = mysqli_real_escape_string($dbconn, strip_tags(trim($_POST['userid'])));
    $jelszo = sha1($_POST['jelszo']);

    $sql = "SELECT userid, nev, pkep, email, tilt
            FROM user
            WHERE userid = '{$userid}'
            AND jelszo = '{$jelszo}'
            LIMIT 2";
    $eredmeny = mysqli_query($dbconn, $sql);
    $sor = mysqli_fetch_assoc($eredmeny);
    // Sikeres

    if (mysqli_num_rows($eredmeny) == 1) {
        if($sor['tilt'] <= date("Y-m-d")){
            $_SESSION['userid'] = $userid;       
            $_SESSION['nev'] = $sor['nev'];
            $_SESSION['keresztnev'] = mb_substr($sor['nev'], mb_strpos($sor['nev'], " "));
            $_SESSION['pkep'] = $sor['pkep'];
            $_SESSION['email'] = $sor['email'];
        }else
            $hiba="Hozzáférés megtagadva!";
    }
	// Sikertelen
    else {
        $hiba = "Hibás felhasználónevet vagy jelszót adtál meg!";
    }
    
//Kijelentkezés        
} elseif (isset($_POST['logout'])) {
    session_destroy();
}
mysqli_close($dbconn);

// Válasz az AJAX-nak
echo json_encode(
    array(
        "status" => isset($hiba) ? "ERR" : "OK",
        "error" => isset($hiba) ? $hiba : ""
    )
);
?>