package br.com.senai.model.DAO;

import br.com.senai.model.bean.CursoBean;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CursoDAO extends MainDAO {
    
    public void updateCurso(CursoBean curso) {

        try {
            
            String insert = "UPDATE portal.curso SET nome_curso = ?, id_prof = ?, carga_horaria = ? WHERE id_curso = ?;";

            PreparedStatement statement = connection.prepareStatement(insert);

            statement.setString(1, curso.getNomeCurso());
            statement.setInt(2, curso.getIdProf());
            statement.setDouble(3, curso.getCargaHoraria());
            statement.setInt(4, curso.getIdCurso());

            statement.execute();

            statement.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }
    }

      public void deleteCurso(int id) {
        try {
            String insert = "DELETE FROM portal.curso WHERE id_curso = ?";

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
    
      public boolean cursoExists(String nomeCurso) {
        String select = "SELECT id_curso FROM portal.curso WHERE nome_curso = ?;";

        try {

            PreparedStatement statement = connection.prepareStatement(select);
            statement.setString(1, nomeCurso);           

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
      
    public boolean cursoExists(String nomeCurso, int idCurso) {
        String select = "SELECT id_curso FROM portal.curso WHERE nome_curso = ? AND id_curso != ?;";

        try {

            PreparedStatement statement = connection.prepareStatement(select);
            statement.setString(1, nomeCurso);
            statement.setInt(2, idCurso);

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
    
    public void insertCurso(CursoBean curso) {

        try {
            String insert = "INSERT INTO portal.curso (nome_curso, id_prof, carga_horaria) VALUES (?, ?, ?)";

            PreparedStatement statement = connection.prepareStatement(insert);

            statement.setString(1, curso.getNomeCurso());
            statement.setInt(2, curso.getIdProf());
            statement.setDouble(3, curso.getCargaHoraria());

            statement.execute();
            statement.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }
    }

    public ArrayList<CursoBean> selectCurso() {

        ArrayList<CursoBean> listaUser = new ArrayList<CursoBean>();
        String select = "SELECT * FROM portal.curso";

        try {

            PreparedStatement statement = connection.prepareStatement(select);

            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
                listaUser.add(new CursoBean(
                        resultset.getInt("id_curso"),
                        resultset.getString("nome_curso"),
                        resultset.getInt("id_prof"),
                        resultset.getDouble("carga_horaria")
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

    public int getIdCurso(String nomeCurso) {
        String select = "SELECT id_curso FROM portal.curso WHERE nome_curso = ?";
        int id;
        try {

            PreparedStatement statement = connection.prepareStatement(select);
            statement.setString(1, nomeCurso);
            
            ResultSet resultset = statement.executeQuery();

            if (resultset.next()) {
                id = resultset.getInt("id_curso");
            } else {
                throw new RuntimeException("CURSO INEXISTE 0123");
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
    
    
    public String getNomeCurso(int idCurso) {
        String select = "SELECT nome_curso FROM portal.curso WHERE id_curso = ?";
        String nome;
        try {

            PreparedStatement statement = connection.prepareStatement(select);
            statement.setInt(1, idCurso);
            
            ResultSet resultset = statement.executeQuery();

            if (resultset.next()) {
                nome = resultset.getString("nome_curso");
            } else {
                return "_\\_";
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

}
