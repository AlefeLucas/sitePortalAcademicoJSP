
package br.com.senai.model.bean;


public class UsuarioBean {
    private int idUsuario;
    private String loginUsuario;
    private String senhaUsuario;
    private String nomeUsuario;
    private String rgUsuario;
    private String cpfUsuario;

    public UsuarioBean(int idUsuario, String loginUsuario, String senhaUsuario, String nomeUsuario, String rgUsuario, String cpfUsuario) {
        this.idUsuario = idUsuario;
        this.loginUsuario = loginUsuario;
        this.senhaUsuario = senhaUsuario;
        this.nomeUsuario = nomeUsuario;
        this.rgUsuario = rgUsuario;
        this.cpfUsuario = cpfUsuario;
    }

    public UsuarioBean(int idUsuario, String loginUsuario, String senhaUsuario) {
        this.idUsuario = idUsuario;
        this.loginUsuario = loginUsuario;
        this.senhaUsuario = senhaUsuario;
    }
      
    

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getLoginUsuario() {
        return loginUsuario;
    }

    public void setLoginUsuario(String loginUsuario) {
        this.loginUsuario = loginUsuario;
    }

    public String getSenhaUsuario() {
        return senhaUsuario;
    }

    public void setSenhaUsuario(String senhaUsuario) {
        this.senhaUsuario = senhaUsuario;
    }

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    public String getRgUsuario() {
        return rgUsuario;
    }

    public void setRgUsuario(String rgUsuario) {
        this.rgUsuario = rgUsuario;
    }

    public String getCpfUsuario() {
        return cpfUsuario;
    }

    public void setCpfUsuario(String cpfUsuario) {
        this.cpfUsuario = cpfUsuario;
    }
}
