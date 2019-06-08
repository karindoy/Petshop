package persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Agendamento;

public class AgendamentoDao {
	
	public static void AdicionarAgendamento(Agendamento age) throws SQLException{
		Connection conexao = ConexaoFactory.conectar();
		
		String sql = "{CALL p_inserirAgenda(?,?,?,?)}";
		CallableStatement cs = conexao.prepareCall(sql);
		
		cs.setString(1, age.getDia());
		cs.setString(2, age.getHora());
		cs.setInt(3, age.getId_pet());
		cs.setInt(4,age.getServico());
		cs.execute();
		cs.close();
	}
	
	public static List<Agendamento> ConsultarAgendamentos() throws SQLException{
		List<Agendamento> listaAgendamento = new ArrayList<Agendamento>();
		try {
			Connection conexao = ConexaoFactory.conectar();
			

			String sql = "SELECT * FROM agendamento";
			PreparedStatement ps = conexao.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Agendamento a = new Agendamento();
				a.setId_pet(rs.getInt("Pet_id"));
				a.setDia(rs.getString("dia"));
				a.setStatus(rs.getString("estado"));
				a.setHora(rs.getString("hora"));
				a.setServico(rs.getInt("Servicos_id"));
				a.setId(rs.getInt("idAgendamento"));
				listaAgendamento.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listaAgendamento;
	}
	
	public static void ExcluiAgendamento(int id) throws SQLException{
		Connection conexao = ConexaoFactory.conectar();
		

		String sql = "delete from agendamento where idAgendamento = ?";
		PreparedStatement ps = conexao.prepareStatement(sql);
		
		ps.setInt(1, id);
		ps.execute();
		ps.close();
	}
	
	
}