package persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Pet;

public class PetDao {
	private static Connection conexao = ConexaoFactory.conectar();
	
	public void AdicionarPet(Pet pet) throws SQLException {
			
		String sql = "{CALL p_insere_pet(?,?,?,?,?)}";
		CallableStatement cs = conexao.prepareCall(sql);
		
		cs.setString(1, pet.getNome());
		cs.setString(2, pet.getRaca());
		cs.setString(3, pet.getSexo());
		cs.setString(4, pet.getNascimento());
		cs.setDouble(5, pet.getPeso());
		cs.execute();
		cs.close();
	}
	
	public  List<Pet> ConsultarPets() throws SQLException{

		List<Pet> listaPets = new ArrayList<Pet>();
		String sql = "SELECT nome, raca, sexo, nascimento, peso, dono FROM pets";

		PreparedStatement ps = conexao.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Pet p = new Pet();
			p.setNome(rs.getString("nome"));
			p.setRaca(rs.getString("raca"));
			p.setSexo(rs.getString("sexo"));
			p.setNascimento(rs.getString("nascimento"));
			p.setPeso(rs.getDouble("peso"));
			p.setId_dono(rs.getInt("dono"));
			listaPets.add(p);
		}
		
		return listaPets;
	}
	
}