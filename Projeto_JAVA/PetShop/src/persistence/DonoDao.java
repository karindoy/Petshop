package persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import model.Dono;

public class DonoDao {
	
	public static String AdicionarDono(Dono dono) throws SQLException, ClassNotFoundException{
		Connection conexao = ConexaoFactory.conectar();
		
		String sql = "{CALL p_inserirDono(?,?,?,?,?,?,?,?)}";
		CallableStatement cs = conexao.prepareCall(sql);
		
		cs.setString(1, dono.getNome());
		cs.setString(2, dono.getTelefone1());
		cs.setString(3, dono.getTelefone2());
		cs.setString(4, dono.getBairro());
		cs.setString(5, dono.getLogradouro());
		cs.setString(6, dono.getNum());
		cs.setString(7, dono.getComplemento());
		cs.registerOutParameter(8, Types.VARCHAR);
		cs.execute();
		String id = cs.getString(8);
		cs.close();
		return id;
	}
	
	public static List<Dono> ConsultarDonos() throws SQLException, ClassNotFoundException{
		Connection conexao = ConexaoFactory.conectar();
		
		List<Dono> listaDono = new ArrayList<Dono>();
		String sql = "SELECT nome, bairro, telefone1, telefone2 FROM dono";

		PreparedStatement ps = conexao.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Dono d = new Dono();
			d.setNome(rs.getString("nome"));
			d.setTelefone1(rs.getString("telefone1"));
			d.setTelefone2(rs.getString("telefone2"));
			d.setBairro(rs.getString("bairro"));
			listaDono.add(d);
		}
		
		return listaDono;
	}
	
}