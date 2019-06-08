package persistence;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Pet;

public class PetDao {
	
	public static void AdicionarPet(String nome, String raca, String sexo, String nascimento, int peso, int id_dono) throws SQLException{
		Conexao c = new Conexao();
		c.conectar();
		
		String sql = "{CALL p_insere_pet(?,?,?,?,?,?)}";
		CallableStatement cs = c.conexao.prepareCall(sql);
		
		cs.setString(1, nome);
		cs.setString(2, raca);
		cs.setString(3, sexo);
		cs.setString(4, nascimento);
		cs.setInt(5, peso);
		cs.setInt(6, id_dono);
		cs.execute();
	}
	
	public static List<Pet> ConsultarPets() throws SQLException{
		Conexao c = new Conexao();
		c.conectar();
		
		List<Pet> listaPets = new ArrayList<Pet>();
		String sql = "SELECT nome, raca, sexo, nascimento, peso, dono FROM pets";

		PreparedStatement ps = c.conexao.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Pet p = new Pet();
			p.setNome(rs.getString("nome"));
			p.setRaca(rs.getString("raca"));
			p.setSexo(rs.getString("sexo"));
			p.setNascimento(rs.getString("nascimento"));
			p.setPeso(rs.getInt("peso"));
			p.setId_dono(rs.getInt("dono"));
			listaPets.add(p);
		}
		
		return listaPets;
	}
	
}