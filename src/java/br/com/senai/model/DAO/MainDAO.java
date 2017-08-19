
package br.com.senai.model.DAO;

import br.com.senai.model.factory.ConnectionFactory;
import java.sql.Connection;

public class MainDAO {
    protected Connection connection;

    public MainDAO() {
        try {
            this.connection = new ConnectionFactory().getConnection();
        } catch (ClassNotFoundException ex) {
            System.out.println("Deu errado");
            ex.printStackTrace();
        }
    }
}
