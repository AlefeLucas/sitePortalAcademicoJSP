package br.com.senai.model.DAO;

import br.com.senai.model.bean.UsuarioBean;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UsuarioDAO extends MainDAO {

    public void deleteUser(int id) {
        try {
            String insert = "DELETE FROM portal.usuario WHERE id_usuario = ?";

            PreparedStatement statement = connection.prepareStatement(insert);

            statement.setInt(1, id);

            statement.execute();

            statement.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }
    }

    private String getSenhaUser(int id) {
        String select = "SELECT senha_usuario FROM portal.usuario WHERE id_usuario = ?";
        String senha;
        try {

            PreparedStatement statement = connection.prepareStatement(select);
            statement.setInt(1, id);

            ResultSet resultset = statement.executeQuery();

            if (resultset.next()) {
                senha = resultset.getString(1);
            } else {
                throw new RuntimeException("USUÁRIO INEXISTE");
            }

            resultset.close();
            statement.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }

        return senha;
    }

    public void updateUser(UsuarioBean user) {

        try {
            String senha;
            if (user.getSenhaUsuario() == null || user.getSenhaUsuario().isEmpty()) {
                senha = this.getSenhaUser(user.getIdUsuario());
            } else {                
                senha = user.getSenhaUsuario();
            }

            String insert = "UPDATE portal.usuario SET login_usuario = ?, senha_usuario = ?, nome_usuario = ?, rg_usuario = ?, cpf_usuario = ? WHERE id_usuario = ?";

            PreparedStatement statement = connection.prepareStatement(insert);

            statement.setString(1, user.getLoginUsuario().toLowerCase());
            statement.setString(2, senha);
            statement.setString(3, user.getNomeUsuario());
            statement.setString(4, user.getRgUsuario());
            statement.setString(5, user.getCpfUsuario());
            statement.setInt(6, user.getIdUsuario());

            statement.execute();

            statement.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }
    }

     public String getNomeUsuario(int idUsuario) {
        String select = "SELECT nome_usuario FROM portal.usuario WHERE id_usuario = ?";
        String nome;
        try {

            PreparedStatement statement = connection.prepareStatement(select);
            statement.setInt(1, idUsuario);
            
            ResultSet resultset = statement.executeQuery();

            if (resultset.next()) {
                nome = resultset.getString("nome_usuario");
            } else {
                return "-\\-";
            }

            resultset.close();
            statement.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }

        return nome;
    }
    
    public int insertUser(UsuarioBean user) {
        int x;
        try {
            String insert = "INSERT INTO portal.usuario (login_usuario, senha_usuario, nome_usuario, rg_usuario, cpf_usuario) VALUES (?, ?, ?, ?, ?);";

            PreparedStatement statement = connection.prepareStatement(insert);

            statement.setString(1, user.getLoginUsuario().toLowerCase());
            statement.setString(2, user.getSenhaUsuario());
            statement.setString(3, user.getNomeUsuario());
            statement.setString(4, user.getRgUsuario());
            statement.setString(5, user.getCpfUsuario());

            statement.execute();

            x = this.getUserId(user.getLoginUsuario());
            user.setIdUsuario(x);

            statement.close();
            return x;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }

    }

    public ArrayList<UsuarioBean> selectUser() {

        ArrayList<UsuarioBean> listaUser = new ArrayList<UsuarioBean>();
        String select = "SELECT * FROM portal.usuario";

        try {

            PreparedStatement statement = connection.prepareStatement(select);

            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
                listaUser.add(new UsuarioBean(
                        resultset.getInt("id_usuario"),
                        resultset.getString("login_usuario"),
                        resultset.getString("senha_usuario"),
                        resultset.getString("nome_usuario"),
                        resultset.getString("rg_usuario"),
                        resultset.getString("cpf_usuario")
                ));
            }

            resultset.close();
            statement.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }

        return listaUser;

    }

    public boolean cpfExists(String cpf) {
        String select = "SELECT id_usuario FROM portal.usuario WHERE cpf_usuario = ?;";

        try {

            PreparedStatement statement = connection.prepareStatement(select);
            statement.setString(1, cpf);

            ResultSet resultset = statement.executeQuery();

            if (resultset.next()) {
                resultset.close();
                statement.close();
                return true;
            } else {
                resultset.close();
                statement.close();
                return false;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }
    }

    public boolean rgExists(String rg) {
        String select = "SELECT id_usuario FROM portal.usuario WHERE rg_usuario = ?;";

        try {

            PreparedStatement statement = connection.prepareStatement(select);
            statement.setString(1, rg);

            ResultSet resultset = statement.executeQuery();

            if (resultset.next()) {
                resultset.close();
                statement.close();
                return true;
            } else {
                resultset.close();
                statement.close();
                return false;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }
    }

    public boolean emailExists(String loginUsuario) {
        String select = "SELECT id_usuario FROM portal.usuario WHERE login_usuario = ?;";

        try {

            PreparedStatement statement = connection.prepareStatement(select);
            statement.setString(1, loginUsuario);

            ResultSet resultset = statement.executeQuery();

            if (resultset.next()) {
                resultset.close();
                statement.close();
                return true;
            } else {
                resultset.close();
                statement.close();
                return false;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }

    }

    public boolean emailExists(String loginUsuario, int id) {
        String select = "SELECT id_usuario FROM portal.usuario WHERE login_usuario = ? AND id_usuario != ?;";

        try {

            PreparedStatement statement = connection.prepareStatement(select);
            statement.setString(1, loginUsuario);
            statement.setInt(2, id);

            ResultSet resultset = statement.executeQuery();

            if (resultset.next()) {
                resultset.close();
                statement.close();
                return true;
            } else {
                resultset.close();
                statement.close();
                return false;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }

    }

    public boolean rgExists(String rgUsuario, int id) {
        String select = "SELECT id_usuario FROM portal.usuario WHERE rg_usuario = ? AND id_usuario != ?;";

        try {

            PreparedStatement statement = connection.prepareStatement(select);
            statement.setString(1, rgUsuario);
            statement.setInt(2, id);

            ResultSet resultset = statement.executeQuery();

            if (resultset.next()) {
                resultset.close();
                statement.close();
                return true;
            } else {
                resultset.close();
                statement.close();
                return false;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }

    }

    public boolean cpfExists(String cpfUsuario, int id) {
        String select = "SELECT id_usuario FROM portal.usuario WHERE cpf_usuario = ? AND id_usuario != ?;";

        try {

            PreparedStatement statement = connection.prepareStatement(select);
            statement.setString(1, cpfUsuario);
            statement.setInt(2, id);

            ResultSet resultset = statement.executeQuery();

            if (resultset.next()) {
                resultset.close();
                statement.close();
                return true;
            } else {
                resultset.close();
                statement.close();
                return false;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }

    }

    public boolean recuperarSenha(String novaSenha, String cpf, String email) {
        int x;
        try {

            String insert = "UPDATE usuario SET senha_usuario = ? WHERE cpf_usuario = ? AND login_usuario = ?";

            PreparedStatement statement = connection.prepareStatement(insert);
            statement.setString(1, novaSenha);
            statement.setString(2, cpf);
            statement.setString(3, email);

            x = statement.executeUpdate();
            statement.close();

            if (x > 1) {
                throw new SQLException("Ue");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }

        return (x == 1 ? true : false);
    }

    public int getUserId(String loginUsuario) {

        String select = "SELECT id_usuario FROM portal.usuario WHERE login_usuario = ?;";
        int id;
        try {

            PreparedStatement statement = connection.prepareStatement(select);
            statement.setString(1, loginUsuario);

            ResultSet resultset = statement.executeQuery();

            if (resultset.next()) {
                id = resultset.getInt(1);
            } else {
                throw new RuntimeException("USUÁRIO INEXISTE");
            }

            resultset.close();
            statement.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }

        return id;
    }

    public boolean logIn(String loginUsuario, String senhaUsuario) {
        String select = "SELECT id_usuario FROM portal.usuario WHERE login_usuario = ? AND senha_usuario = ?;";

        try {

            PreparedStatement statement = connection.prepareStatement(select);
            statement.setString(1, loginUsuario);
            statement.setString(2, senhaUsuario);

            ResultSet resultset = statement.executeQuery();

            if (resultset.next()) {
                resultset.close();
                statement.close();
                return true;
            } else {
                resultset.close();
                statement.close();
                return false;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }

    }

}
