package persistence;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Dono;

public class DonoDao {
	
	public static void AdicionarDono(String nome, String endereco, String telefone1, String telefone2) throws SQLException{
		Conexao c = new Conexao();
		c.conectar();
		
		String sql = "{CALL p_insere_dono(?,?,?,?,?)}";
		CallableStatement cs = c.conexao.prepareCall(sql);
		
		cs.setString(1, nome);
		cs.setString(2, endereco);
		cs.setString(3, telefone1);
		cs.setString(4, telefone2);
		cs.execute();
	}
	
	public static List<Dono> ConsultarDonos() throws SQLException{
		Conexao c = new Conexao();
		c.conectar();
		
		List<Dono> listaDono = new ArrayList<Dono>();
		String sql = "SELECT nome, endereco, telefone1, telefone2 FROM dono";

		PreparedStatement ps = c.conexao.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Dono d = new Dono();
			d.setNome(rs.getString("nome"));
			d.setEndereco(rs.getString("endereco"));
			d.setTelefone1(rs.getString("telefone1"));
			d.setTelefone2(rs.getString("telefone2"));
			listaDono.add(d);
		}
		
		return listaDono;
	}
	
}