/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Professor(id, nome, email, rg, cpf, salario) {
    this.id = id;
    this.nome = nome;
    this.email = email;
    this.rg = rg;
    this.cpf = cpf;
    this.salario = salario;       
}

var profs = [];

function createListaProfs() {
var ue = false;
var max = parseInt(document.getElementById("count").value);

    for (var x = 0; x < max; x++) {
        var id = document.getElementById("idUsuario" + x).textContent;
        var nome = document.getElementById("nomeUsuario" + x).textContent;
        var email = document.getElementById("loginUsuario" + x).textContent;
        var rg = document.getElementById("rgUsuario" + x).textContent;
        var cpf = document.getElementById("cpfUsuario" + x).textContent;
        var salario = document.getElementById("salarioProf" + x).textContent;
        
        

        profs.push(new Professor(id, nome, email, rg, cpf, salario));
       
        
    }
}



function setProf() {

    var id = document.getElementById("id").value;
    document.getElementById("idRescue").value = id;

    var x = -1;

    for (var x = 0; x < profs.length; x++) {
        if (profs[x].id === id) {
            var last = profs[x].email.indexOf("@");
            var email = profs[x].email.substring(0, last);
            document.getElementById("email").value = email;
            document.getElementById("nome").value = profs[x].nome;
            document.getElementById("rg").value = profs[x].rg;
            document.getElementById("cpf").value = profs[x].cpf;
            document.getElementById("salario").value = profs[x].salario;           
            
            break;
        }
    }

    if (x === -1) {
        alert("erro");
    }

    
}


function changeUpdateProf() {
    document.getElementById("updateProf").action = "ServletUpdateProf";
}

function changeDeleteProf() {
    document.getElementById("updateProf").action = "ServletDeleteProf";
}