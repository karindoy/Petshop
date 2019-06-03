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
	
	public static void AdicionarPet(Pet pet) throws SQLException, ClassNotFoundException{
		Connection conexao = ConexaoFactory.conectar();
		
		String sql = "{CALL p_inserirPet(?,?,?,?,?,?,?,?)}";
		CallableStatement cs = conexao.prepareCall(sql);
		
		cs.setString(1, pet.getNome());
		cs.setString(2, pet.getAnimal());
		cs.setString(3, pet.getRaca());
		cs.setString(4, pet.getSexo());
		cs.setDouble(5, pet.getPeso());
		cs.setDouble(6, pet.getTamanho());
		cs.setDouble(7, pet.getId_dono());
		cs.setString(8, pet.getNascimento());
		cs.execute();
	}
	
	public static List<Pet> ConsultarPets() throws SQLException, ClassNotFoundException{
		Connection conexao = ConexaoFactory.conectar();
		
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