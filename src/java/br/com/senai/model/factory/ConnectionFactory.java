package br.com.senai.model.factory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionFactory {

    public Connection getConnection() throws ClassNotFoundException {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            return DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "admin");
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }

    }

}
