package persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoFactory {
    private static final String url = "jdbc:mysql://localhost:3306/petshop";    
    private static final String driverName = "com.mysql.cj.jdbc.Driver";   
    private static final String usuario = "root";   
    private static final String senha = "1024";
    private static Connection conexao;
    

    public static Connection conectar() {
        try {
            Class.forName(driverName);
            try {
                conexao = DriverManager.getConnection(url, usuario, senha);
                System.out.println("Conectado com sucesso!!");
            } catch (SQLException ex) {
                System.out.println(""); 
                System.out.printf("Falha de conexão.%n URL: %s %n USUARIO:  %s %n SENHA:  %s %n", url, usuario, senha);
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("Driver nao encontrado."); 
        }
        return conexao;
    }
}
