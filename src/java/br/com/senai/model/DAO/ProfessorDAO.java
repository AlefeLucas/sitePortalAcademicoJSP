package br.com.senai.model.DAO;

import br.com.senai.model.bean.AlunoBean;
import br.com.senai.model.bean.ProfessorBean;
import br.com.senai.model.bean.UsuarioBean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProfessorDAO extends UsuarioDAO {

    public ArrayList<AlunoBean> getOwnAlunos(ProfessorBean prof) {

        ArrayList<AlunoBean> listaUser = new ArrayList<AlunoBean>();
        String select = "SELECT aluno.id_aluno, nome_usuario, aluno.id_curso, nota_aluno, faltas_aluno FROM usuario INNER JOIN aluno ON id_usuario = id_aluno INNER JOIN curso ON aluno.id_curso = curso.id_curso INNER JOIN professor ON curso.id_prof = professor.id_prof WHERE professor.id_prof = ?;";

        try {

            PreparedStatement statement = connection.prepareStatement(select);
            statement.setInt(1, prof.getIdUsuario());
            
            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
                listaUser.add(new AlunoBean(
                        resultset.getInt("id_curso"),
                        resultset.getDouble("nota_aluno"),
                        resultset.getDouble("faltas_aluno"),
                        resultset.getInt("id_aluno"),
                        null,
                        null,
                        resultset.getString("nome_usuario"),
                        null,
                        null
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

    public void updateProfessor(ProfessorBean prof) {
        try {
            this.updateUser(prof);

            String insert = "UPDATE portal.professor SET salario_prof = ? WHERE id_prof = ?;";

            PreparedStatement statement = connection.prepareStatement(insert);
            statement.setDouble(1, prof.getSalarioProf());
            statement.setInt(2, prof.getIdUsuario());

            statement.execute();
            statement.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }
    }

    public void insertProfessor(ProfessorBean prof) {
        try {
            prof.setIdUsuario(this.insertUser(prof));

            String insert = "INSERT INTO portal.professor (id_prof, salario_prof) VALUES (?, ?);";

            PreparedStatement statement = connection.prepareStatement(insert);
            statement.setInt(1, prof.getIdUsuario());
            statement.setDouble(2, prof.getSalarioProf());

            statement.execute();
            statement.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }
    }

    public ArrayList<ProfessorBean> selectProfessor() {
        ArrayList<ProfessorBean> listaUser = new ArrayList<ProfessorBean>();
        String select = "SELECT * FROM professor INNER JOIN usuario ON id_prof = id_usuario;";

        try {

            PreparedStatement statement = connection.prepareStatement(select);

            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
                listaUser.add(new ProfessorBean(
                        resultset.getDouble("salario_prof"),
                        resultset.getInt("id_prof"),
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

    public boolean isProf(UsuarioBean user) {
        String select = "SELECT * FROM portal.professor WHERE id_prof = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(select);
            statement.setInt(1, user.getIdUsuario());

            ResultSet resultset = statement.executeQuery();

            if (resultset.next()) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }

    }

    public boolean isProf(int id) {
        String select = "SELECT * FROM portal.professor WHERE id_prof = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(select);
            statement.setInt(1, id);

            ResultSet resultset = statement.executeQuery();

            if (resultset.next()) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }

    }

    public int getIdProf(String nomeProf) {
        String select = "SELECT id_prof FROM professor INNER JOIN usuario ON id_prof = id_usuario WHERE nome_usuario = ?";
        int id;
        try {

            PreparedStatement statement = connection.prepareStatement(select);
            statement.setString(1, nomeProf);

            ResultSet resultset = statement.executeQuery();

            if (resultset.next()) {
                id = resultset.getInt("id_prof");
            } else {
                throw new RuntimeException("PROFESSOR INEXISTE");
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

}
