/*Táblázatban törlés és módosítás ikonok cseréje onmouseover-re*/
function chgIcon(e, img){
    document.getElementById(e.id).src="items/"+img;   
}
/*Törlés megerősítés ablak megjelenítése*/
function confirm(e){
    console.log(e.id.substring(2));
    document.getElementById("confirmbox").style.display="block";
    document.getElementById("hid").value=e.id.substring(2);
    document.getElementById("xid").innerHTML=e.id.substring(2);
}

/* Események kezelése: */
var t;
document.addEventListener("DOMContentLoaded", function(event) { 
    /*űrlapmező click-re törlés*/
    var filter=document.getElementsByClassName("filter");   
    for(var i = 0; i < filter.length; i++){
        filter[i].addEventListener("click", function() {
            document.getElementById("focus").value=this.name;
            if(this.value !=""){
                this.value="";
                document.getElementById("filter").submit();              
            }
        });
    }
    /*Szűrő mezőbe íráskor auto submit*/
    for(var i = 0; i < filter.length; i++){
        filter[i].addEventListener("keyup", function(event) {
            var key=event.key;
            if(key != "Tab" && key != "Shift" && key != "Alt")
                t= setTimeout(function(){
                    document.getElementById("filter").submit();
                    }, 600);
        });
        filter[i].addEventListener("keydown", function() {
            clearTimeout(t);
        });
    }
 
    /* Bélyegképek nagyítása*/
    var foto=document.getElementsByClassName("foto");
    var on=false;
    for(var i = 0; i < foto.length; i++){
        /*foto[i].addEventListener("mouseover", function() {
            this.style.position="absolute";
            this.style.width="max-content";
            this.style.height="max-content";
            on=true;
        });*/
        foto[i].addEventListener("mouseout", function() {
            this.style.width="50px";
            this.style.height="50px";
            this.style.position="unset";
            on=false;
        });
        foto[i].addEventListener("click", function() {
            if(!on){
                this.style.position="absolute";
                this.style.width="max-content";
                this.style.height="max-content";
                on=true;
                return;
            }
            if(on){
                this.style.width="50px";
                this.style.height="50px";
                this.style.position="unset";
                on=false;
                return;
            }
        });
    }   

});

/*focus beállítása ***********************************************************************/
//hogy azon a szűrő mezőn maradjon a fókusz, melybe utoljára írtunk.
//rejtett input mező, ahol annak a mezőnek a nevét tároljuk, amelybe írtunk
var focus= document.getElementById("focus"); 
if(focus != null){
    if(focus.value == ""){ //Alap állapotban az első szűrő mezőn van a fókusz
        document.getElementsByClassName("filter")[0].focus();
        document.getElementsByClassName("filter")[0].select();
    }
    else if(focus.value != "newcat"){ //ha nem üres a mező, de nem "newcat" (új kategória hozzáadása mező)
        //A "filter" osztály megadott nevű mezője. (name=f_xxxx) >> .namedItem(focus.value)
        document.getElementsByClassName("filter").namedItem(focus.value).focus(); 
        document.getElementsByClassName("filter").namedItem(focus.value).select();
    }else{ //Új kategória hozzáadása mezőnél
        document.getElementsByName("newcat")[0].focus();
    }
}

/* Komment és kategória módosításához mezők cseréje **************************************/
var kid=""; //Annak a cellának az azonosítója, amit szerkeszteni akarunk
function editTxtFields(e, fieldType){
    if(kid == ""){ //Azért, hogy egyszerre csak 1 cella legyen szerkeszthető
        kid="k_" + e.id; // a cella azonosítója: K_+ gomb azonosítója
        var txt= document.getElementById(kid).innerHTML;
        if(fieldType == "textarea"){ //komment szerkesztéséhez textarea
            document.getElementById(kid).innerHTML=" <textarea name=e_komm form=modTxt " +
                "cols=75 rows=3>" + txt + "</textarea>" ;
        }
        if(fieldType == "text"){ //kategória szerkesztéséhez text input
            document.getElementById(kid).innerHTML="<input type=text name=e_kat form=modTxt value=" + txt + " required>";
        }
        //A szerkesztés gomb cseréje jóváhagyás (pipa) gombra  
        document.getElementById(e.id).parentElement.innerHTML=
            "<button type=submit form=modTxt>"+
                "<img src=\"items/OK.png\" id=" + e.id + 
                " onmouseover=\"chgIcon(this, 'OK-blue.png')\" onmouseout=\"chgIcon(this, 'OK.png')\">" +
            "</button>";
        //A gomb id-ja azonos a kategória id-val. Ezt vissza kell írni a rejtett input mezőbe     
        document.getElementById("k_id").value=e.id; 
    }
}
/**alert ablak elrejtése ***************************************************************/
function hideAlert(alert){
    document.getElementById(alert).style.display="none";
}
/**Lapozó aktuális oldal számának jelölése**********************************************/
/*Lekérdezi az url-ből az oldal számát. A lapozóban az oldalak <span>tag-ben vannak, 
  p+oldalszám azonosítóval. A lekért aktuális oldalszám stílusát módosítjuk. */
$.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null) {
       return 1;
    }
    return decodeURI(results[1]) || 0;
}
var page = $.urlParam('page');
var span=document.getElementById("p" + page);
if(span!=null){
    span.style.color="#fff";
    span.style.fontWeight="bold";
    span.style.fontSize="1.2em";
} 
/****************************************************************************************/
//találatszámlóló
/*A törlést szimbolizáló X jelenik meg a találatok száma helyett, ha felette van az egér*/
var content;
function onCounter(e, on){
    if(on){
        content=document.getElementById(e.id).innerHTML;
        document.getElementById(e.id).innerHTML="X";
    }
    if(!on){
        document.getElementById(e.id).innerHTML=content;
    }
}
/*Avatar kép törlése ********************************************************************/
function chgAvatar(){
    document.getElementById("pkep").src="../users/avatar.png";
    document.getElementById("avatar").value="avatar.png";    
}
/*****************************************************************************************/
//Checkboxok ha be vannak jelölve, akkor mellette "Igen", ha nem, akkor "Nem" jelenik meg, segítve annak értelmezését
function igenNem(e){
    var chk=document.getElementById(e.id).parentElement.lastElementChild;
    if(chk.innerHTML == "Igen")
        chk.innerHTML="Nem";
    else
        chk.innerHTML="Igen";  
}
/***************************************************************************************/
//Felhasználó felfüggesztésénél a dátum pirosra váltása....
/*Ha az aktuálisnál későbbi dátumot állítunk be, akkor fel van függesztve, és 
  a dátum piros lesz*/ 

var lock=document.getElementById("lock"); //a dátum input mező
if(lock !=null){
    lockStyle();
    //ha változtatjuk a dátumot, azonnal a megfelelő színűre fog váltani
    lock.addEventListener("change", function(){ 
       lockStyle();
    });
}
function lockStyle(){
    //A dátumokból eltávolítunk minden nem szám karaktert (. és -) hogy összehasonlítható legyen
    var now = new Date().toLocaleDateString().replace(/. /g,"").replace(".", "");
    if(lock.value.replace(/-/g,"") > now){ //a beállított dátum későbbi mint az aktuális
        lock.style.color="#ff0000";
        lock.style.fontWeight="bold";
    }else{
        lock.style.color="#000000";
        lock.style.fontWeight="normal";
    }
}

/*Responsive drop-down menu ************************************************************/
var down=false; //menü állapota
var rmenu=false; //a menü ikonjára klikkeltek éppen
function menu(){
    if(!down){
        document.getElementsByTagName("menu")[0].style.display="flex";
        down=true;
        rmenu=true;
        setTimeout(() => {rmenu=false;}, 60);
        return;
    }
    if(down){
        document.getElementsByTagName("menu")[0].style.display="none";
        down=false;
    }
}

document.getElementsByTagName("body")[0].addEventListener("click", function(){
    setTimeout(() => {
       if(!rmenu && down)
           menu();
    }, 50);
});

window.addEventListener("orientationchange", function(){
    if(screen.width>1000)
        document.getElementsByTagName("menu")[0].style.display="flex";
    else    
        document.getElementsByTagName("menu")[0].style.display="none";
})
