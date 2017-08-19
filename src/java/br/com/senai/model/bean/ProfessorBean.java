
package br.com.senai.model.bean;

public class ProfessorBean extends UsuarioBean{

 
    private double salarioProf;

    public ProfessorBean(double salarioProf, int idUsuario, String loginUsuario, String senhaUsuario, String nomeUsuario, String rgUsuario, String cpfUsuario) {
        super(idUsuario, loginUsuario, senhaUsuario, nomeUsuario, rgUsuario, cpfUsuario);
        this.salarioProf = salarioProf;
    }

   

    public double getSalarioProf() {
        return salarioProf;
    }

    public void setSalarioProf(double salarioProf) {
        this.salarioProf = salarioProf;
    }
    
}
