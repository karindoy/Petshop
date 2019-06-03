package persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoFactory {
	private static final String USUARIO = "root";
	private static final String SENHA = "8704";
	private static final String URL = "jdbc:mysql://localhost:3306/petshop";
	private static Connection conexao;
	private static final String driverName = "com.mysql.cj.jdbc.Driver";

	    public static Connection conectar() {
	        try {
	            Class.forName(driverName);
	            try {
	                conexao = DriverManager.getConnection(URL, USUARIO, SENHA);
	                System.out.println("Conectado com sucesso!!");
	            } catch (SQLException ex) {
	                System.out.println(""); 
	                System.out.printf("Falha de conexão.%n URL: %s %n USUARIO:  %s %n SENHA:  %s %n", URL, USUARIO, SENHA);
	            }
	        } catch (ClassNotFoundException ex) {
	            System.out.println("Driver nao encontrado."); 
	        }
	        return conexao;
	    }
}
