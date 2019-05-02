/**
 * 
 */

<!--
function subjectMenu(frm){
    if( frm.subject.options.selectedIndex != 0 ){
        if( frm.subject.options[frm.subject.selectedIndex].target  == "_blank" ){ //_blank이면 새창을 띄움
           window.open(frm.subject.options[frm.subject.selectedIndex].value,"new","");
        } else {
           location.href=frm.subject.options[frm.subject.selectedIndex].value;
        }
    }
}

//-->
