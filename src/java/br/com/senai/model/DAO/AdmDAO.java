package br.com.senai.model.DAO;

import br.com.senai.model.bean.AdmBean;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdmDAO extends UsuarioDAO {

    public ArrayList<Integer> getAdmIds() {
        ArrayList<Integer> listaAdmIds = new ArrayList<Integer>();

        String select = "SELECT id_adm FROM portal.adm;";

        try {

            PreparedStatement statement = connection.prepareStatement(select);
            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
                listaAdmIds.add(resultset.getInt(1));
            }

            resultset.close();
            statement.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }

        return listaAdmIds;

    }

    public boolean isAdm(int id) {
        ArrayList<Integer> listaAdmIds = this.getAdmIds();
        return listaAdmIds.contains(id);
    }

    public void insertAdm(AdmBean adm) {

       try {
            adm.setIdUsuario(this.insertUser(adm));

            String insert = "INSERT INTO portal.adm (id_adm) VALUES (?);";

            PreparedStatement statement = connection.prepareStatement(insert);
            statement.setInt(1, adm.getIdUsuario());         
            
            statement.execute();
            statement.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Deu errado");
            throw new RuntimeException(ex);
        }
    }
}
