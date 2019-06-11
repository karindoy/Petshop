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
		cs.close();
	}
	
	public static List<Pet> ConsultarPets() throws SQLException, ClassNotFoundException{
		Connection conexao = ConexaoFactory.conectar();
		
		List<Pet> listaPets = new ArrayList<Pet>();
		String sql = "SELECT * FROM pet";

		PreparedStatement ps = conexao.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Pet p = new Pet();
			p.setId(rs.getInt("idPet"));
			p.setNome(rs.getString("nome"));
			p.setAnimal(rs.getString("animal"));
			p.setRaca(rs.getString("raca"));
			p.setSexo(rs.getString("sexo"));
			p.setPeso(rs.getDouble("peso"));
			p.setTamanho(rs.getDouble("tamanho"));
			p.setId_dono(rs.getInt("Dono_id"));
			p.setNascimento(rs.getString("nascimento"));
			listaPets.add(p);
		}
		
		return listaPets;
	}
	
	public static void ExcluiPet(int idPet) throws SQLException, ClassNotFoundException{
		Connection conexao = ConexaoFactory.conectar();
		
		String sql = "{CALL p_deletarPet(?)}";
		CallableStatement cs = conexao.prepareCall(sql);
		
		cs.setInt(1, idPet);
		cs.execute();
		cs.close();
	}
	
}