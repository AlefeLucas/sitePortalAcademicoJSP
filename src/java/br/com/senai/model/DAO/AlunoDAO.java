package br.com.senai.model.DAO;

import br.com.senai.model.bean.AlunoBean;
import br.com.senai.model.bean.UsuarioBean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AlunoDAO extends UsuarioDAO {

    public void profUpdateAluno(double nota, double faltas, int idAluno) {
        try {

            String insert = "UPDATE portal.aluno SET nota_aluno = ?, faltas_aluno = ? WHERE id_aluno = ?";

            PreparedStatement statement = connection.prepareStatement(insert);
            statement.setDouble(1, nota);
            statement.setDouble(2, faltas);
            statement.setInt(3, idAluno);

            statement.execute();
            statement.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }
    }

    public void updateAluno(AlunoBean aluno) {
        try {
            this.updateUser(aluno);

            String insert = "UPDATE portal.aluno SET id_curso = ?, nota_aluno = ?, faltas_aluno = ? WHERE id_aluno = ?";

            PreparedStatement statement = connection.prepareStatement(insert);
            statement.setInt(1, aluno.getIdCurso());
            statement.setDouble(2, aluno.getNotaAluno());
            statement.setDouble(3, aluno.getFaltasAluno());
            statement.setInt(4, aluno.getIdUsuario());

            statement.execute();
            statement.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }
    }

    public void insertAluno(AlunoBean aluno) {
        try {
            aluno.setIdUsuario(this.insertUser(aluno));

            String insert = "INSERT INTO portal.aluno (id_aluno, id_curso, nota_aluno, faltas_aluno) VALUES (?, ?, ?, ?);";

            PreparedStatement statement = connection.prepareStatement(insert);
            statement.setInt(1, aluno.getIdUsuario());
            statement.setInt(2, aluno.getIdCurso());
            statement.setDouble(3, aluno.getNotaAluno());
            statement.setDouble(4, aluno.getFaltasAluno());

            statement.execute();
            statement.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }
    }

    public ArrayList<AlunoBean> selectAluno() {
        ArrayList<AlunoBean> listaUser = new ArrayList<AlunoBean>();
        String select = "SELECT * FROM aluno INNER JOIN usuario ON id_aluno = id_usuario;";

        try {

            PreparedStatement statement = connection.prepareStatement(select);

            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
                listaUser.add(new AlunoBean(
                        resultset.getInt("id_curso"),
                        resultset.getDouble("nota_aluno"),
                        resultset.getDouble("faltas_aluno"),
                        resultset.getInt("id_aluno"),
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

    public boolean isAluno(UsuarioBean user) {
        String select = "SELECT * FROM portal.aluno WHERE id_aluno = ?";

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

    public boolean isAluno(int id) {
        String select = "SELECT * FROM portal.aluno WHERE id_aluno = ?";

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

}
