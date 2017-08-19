function tipoUsuario() {
    var tipo = document.getElementById("tipo").value;
    var salario = document.getElementById("salario");
    var curso = document.getElementById("curso");

    if (tipo === "adm") {
        salario.disabled = true;
        salario.required = false;
        curso.required = false;
        curso.disabled = true;
    } else if (tipo === "aluno") {
        salario.disabled = true;
        salario.required = false;
        curso.required = true;
        curso.disabled = false;
    } else {
        salario.disabled = false;
        salario.required = true;
        curso.disabled = true;
        curso.required = false;
    }
}

function verifyEmail() {
    var email = document.getElementById("email").value.toString();

    if (email.indexOf("@") > -1 || email.indexOf(" ") > -1) {
        email = email.substring(0, email.length - 1);
        document.getElementById("email").value = email;

    }
}

function storeCurso() {
    var tipo = document.getElementById("curso").value;
    document.getElementById("cursoRescue").value = tipo;
}

function storeProf() {
    var type = document.getElementById("prof").value;
    document.getElementById("profRescue").value = type;
}

function storeTipo() {
    var tipo = document.getElementById("tipo").value;
    document.getElementById("tipoRescue").value = tipo;
}

function verifyPassword() {
    var pass1 = document.getElementById("password").value;
    var pass2 = document.getElementById("passwordconfirm").value;

    if (pass1 !== pass2) {
        document.getElementById("passwordconfirm").style = "background-color: red; width: 24.85em";
        document.getElementById("cadastrar").disabled = true;
    } else {
        document.getElementById("passwordconfirm").style = "background-color: white; width: 24.85em";
        document.getElementById("cadastrar").disabled = false;
    }
}

function verifySalario() {

    var salarioInput = document.getElementById("salario");
    var salario = parseFloat(salarioInput.value);

    salarioInput.value = salario;

    if (salarioInput.value.toString() === "NaN") {
        salarioInput.value = "";
    }


}

function verifyNota() {

    var salarioInput = document.getElementById("nota");
    var salario = parseFloat(salarioInput.value);

    salarioInput.value = salario;

    if (salarioInput.value.toString() === "NaN") {
        salarioInput.value = "";
    }


}

function Aluno(id, nome, email, rg, cpf, curso, nota, faltas) {
    this.id = id;
    this.nome = nome;
    this.email = email;
    this.rg = rg;
    this.cpf = cpf;
    this.curso = curso;
    this.nota = nota;
    this.faltas = faltas;
}

var alunos = [];

function createListaAlunos() {
var ue = false;
var max = parseInt(document.getElementById("count").value);

    for (var x = 0; x < max; x++) {
        var id = document.getElementById("idUsuario" + x).textContent;
        var nome = document.getElementById("nomeUsuario" + x).textContent;
        var email = document.getElementById("loginUsuario" + x).textContent;
        var rg = document.getElementById("rgUsuario" + x).textContent;
        var cpf = document.getElementById("cpfUsuario" + x).textContent;
        var curso = document.getElementById("nomeCurso" + x).textContent;
        var nota = document.getElementById("notaAluno" + x).textContent;
        var faltas = document.getElementById("faltasAluno" + x).textContent;

        alunos.push(new Aluno(id, nome, email, rg, cpf, curso, nota, faltas));
       
        
    }
}

function setAluno() {

    var id = document.getElementById("id").value;
    document.getElementById("idRescue").value = id;

    var x = -1;

    for (x = 0; x < alunos.length; x++) {
        if (alunos[x].id === id) {
            var last = alunos[x].email.indexOf("@");
            var email = alunos[x].email.substring(0, last);
            document.getElementById("email").value = email;
            document.getElementById("nome").value = alunos[x].nome;
            document.getElementById("rg").value = alunos[x].rg;
            document.getElementById("cpf").value = alunos[x].cpf;
            document.getElementById("nota").value = alunos[x].nota;
            document.getElementById("faltas").value = alunos[x].faltas;
            var curso = alunos[x].curso;
            curso = curso.toLowerCase();
            curso = curso.split(" ").join("_");
            document.getElementById("curso").value = curso;
            break;
        }
    }

    if (x === -1) {
        alert("erro");
    }

    storeCurso();
}












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

    var x = 0;

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

    if (x === 0) {
        alert("erro");
    }

    
}


function changeUpdateProf() {
    document.getElementById("updateProf").action = "ServletUpdateProf";
}

function changeDeleteProf() {
    document.getElementById("updateProf").action = "ServletDeleteProf";
}


function changeUpdate() {
    document.getElementById("updateUser").action = "ServletUpdateUser";
}

function changeDelete() {
    document.getElementById("updateUser").action = "ServletDeleteUser";
}


function verifyFaltas() {

    var salarioInput = document.getElementById("faltas");
    var salario = parseFloat(salarioInput.value);

    salarioInput.value = salario;

    if (salarioInput.value.toString() === "NaN") {
        salarioInput.value = "";
    }


}

function verifyHora() {

    var horaInput = document.getElementById("hora");
    var hora = parseFloat(salarioInput.value);

    horaInput.value = hora;

    if (horaInput.value.toString() === "NaN") {
        horaInput.value = "";
    }


}