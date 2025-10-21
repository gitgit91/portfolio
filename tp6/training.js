function addition(){

    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) + Number(b);
    document.getElementById("resultat").value = c;



}
function multiplication(){

    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) * Number(b);
    document.getElementById("resultat").value = c;



}

function division() {
    var a = Number(document.getElementById("t1").value);
    var b = Number(document.getElementById("t2").value);
    if (b==0) {
        document.getElementById("resultat").value = "Erreur";
   } else {
        document.getElementById("resultat").value = a / b;
    }
}

function soustraction(){

    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) - Number(b);
    document.getElementById("resultat").value = c;



}

function parite()
{
	var x = document.getElementById("resultat").value
	if (x % 2 ==0){
    	document.getElementById("parite").value = " Nombre Pair "
	}
	else{
    	document.getElementById("parite").value = " Nombre Impair "
	}
}

function reset(){

    document.getElementById("t1").value ="";
    document.getElementById("t2").value ="";
    document.getElementById("resultat").value ="";
    document.getElementById("parite").value ="";
}

function permuter() {
    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    document.getElementById("t1").value = b;
    document.getElementById("t2").value = a;
}

