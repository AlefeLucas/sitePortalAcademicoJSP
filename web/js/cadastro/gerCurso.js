function Curso(id, nome, hora, professor) {
    this.id = id;
    this.nome = nome;
    this.hora = hora;
    this.professor = professor;
}

var cursos = [];

function createListaCursos() {
    var ue = false;
    var max = parseInt(document.getElementById("count").value);

    for (var x = 0; x < max; x++) {

        var id = document.getElementById("idCurso" + x).textContent;
        var nome = document.getElementById("nomeCurso" + x).textContent;
        var hora = document.getElementById("cargaHoraria" + x).textContent;
        var professor = document.getElementById("professor" + x).textContent;

        cursos.push(new Curso(id, nome, hora, professor));


    }
}

function setCurso() {

    var id = document.getElementById("id").value;
    document.getElementById("idRescue").value = id;

    var x = -1;

    for (x = 0; x < cursos.length; x++) {
        if (cursos[x].id === id) {

            document.getElementById("nome").value = cursos[x].nome;
            document.getElementById("prof").value = cursos[x].professor;
            document.getElementById("hora").value = cursos[x].hora;

            break;
        }
    }

    if (x === -1) {
        alert("erro");
    }

    
}

function changeUpdateCurso() {
    document.getElementById("updateCurso").action = "ServletUpdateCurso";
}

function changeDeleteCurso() {
    document.getElementById("updateCurso").action = "ServletDeleteCurso";
}