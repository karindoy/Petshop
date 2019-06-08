package persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;


public class Conexao {
	public Statement stm;
	public ResultSet rs;
	private String caminho = "jdbc:sqlserver://localhost:1433;databaseName=petshop";
	private String usuario = "karin";
	private String senha = "1024";
	public Connection conexao;
	private String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	public void conectar() throws SQLException{
		System.setProperty("jdbc.Drivers", driver);
		conexao = DriverManager.getConnection(caminho, usuario, senha);
		System.out.println("Conectado com sucesso!");
	}
	
	public void desconectar() throws SQLException{
		conexao.close();
		JOptionPane.showMessageDialog(null, "Conex�o fechada com sucesso!", "Banco de Dados", JOptionPane.INFORMATION_MESSAGE);
	}
}
