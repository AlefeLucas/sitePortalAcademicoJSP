package br.com.senai.model.bean;

public class AlunoBean extends UsuarioBean {

    private int idCurso;
    private double notaAluno;
    private double faltasAluno;

    public AlunoBean(int idCurso, double notaAluno, double faltasAluno, int idUsuario, String loginUsuario, String senhaUsuario, String nomeUsuario, String rgUsuario, String cpfUsuario) {
        super(idUsuario, loginUsuario, senhaUsuario, nomeUsuario, rgUsuario, cpfUsuario);
        this.idCurso = idCurso;
        this.notaAluno = notaAluno;
        this.faltasAluno = faltasAluno;
    }

    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public double getNotaAluno() {
        return notaAluno;
    }

    public void setNotaAluno(double notaAluno) {
        this.notaAluno = notaAluno;
    }

    public double getFaltasAluno() {
        return faltasAluno;
    }

    public void setFaltasAluno(double faltasAluno) {
        this.faltasAluno = faltasAluno;
    }

}
