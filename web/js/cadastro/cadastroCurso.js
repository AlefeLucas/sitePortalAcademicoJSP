
function storeProf(){
    var type = document.getElementById("prof").value;
    document.getElementById("profRescue").value = type;
}

function verifyHora() {
    
    var horaInput = document.getElementById("hora");
    var hora = parseFloat(horaInput.value);
    
    horaInput.value = hora;
    
    if (horaInput.value.toString() === "NaN"){
        horaInput.value = "";
    }
   

}