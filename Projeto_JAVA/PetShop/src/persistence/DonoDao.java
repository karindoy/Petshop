package persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Dono;

public class DonoDao {
	private static Connection conexao = ConexaoFactory.conectar();
	
	public static void AdicionarDono(Dono dono) throws SQLException{
		
		String sql = "{CALL p_inserirDono(?,?,?,?,?,?,?)}";
		CallableStatement cs = conexao.prepareCall(sql);
		
		cs.setString(1, dono.getNome());
		cs.setString(6, dono.getTelefone1());
		cs.setString(7, dono.getTelefone2());
		cs.setString(2, dono.getBairro());
		cs.setString(3, dono.getLogradouro());
		cs.setString(4, dono.getNum());
		cs.setString(5, dono.getComplemento());
		cs.execute();
		cs.close();
	}
	
	public List<Dono> ConsultarDonos() throws SQLException{
		
		List<Dono> listaDono = new ArrayList<Dono>();
		String sql = "SELECT nome, bairro, telefone1, telefone2 FROM dono";

		PreparedStatement ps = conexao.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Dono d = new Dono();
			d.setNome(rs.getString("nome"));
			d.setBairro(rs.getString("bairro"));
			d.setTelefone1(rs.getString("telefone1"));
			d.setTelefone2(rs.getString("telefone2"));
			listaDono.add(d);
		}
		
		return listaDono;
	}
	
}