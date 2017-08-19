package br.com.senai.model.bean;

public class CursoBean {



    private int idCurso;
    private String nomeCurso;
    private int idProf;
    private double cargaHoraria;

    public CursoBean(int idCurso, String nomeCurso, int idProf, double cargaHoraria) {
        this.idCurso = idCurso;
        this.nomeCurso = nomeCurso;
        this.idProf = idProf;
        this.cargaHoraria = cargaHoraria;
    }

    
    
    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public String getNomeCurso() {
        return nomeCurso;
    }

    public void setNomeCurso(String nomeCurso) {
        this.nomeCurso = nomeCurso;
    }

    public int getIdProf() {
        return idProf;
    }

    public void setIdProf(int idProf) {
        this.idProf = idProf;
    }

    public double getCargaHoraria() {
        return cargaHoraria;
    }

    public void setCargaHoraria(double cargaHoraria) {
        this.cargaHoraria = cargaHoraria;
    }
}
