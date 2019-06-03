package persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
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
		cs.setInt(3, age.getPet());
		cs.setInt(4,age.getServico());
		cs.execute();
	}
	
	public static List<Agendamento> ConsultarAgendamentos(String dia) throws SQLException{
		List<Agendamento> listaAgendamento = new ArrayList<Agendamento>();
		try {
			Connection conexao = ConexaoFactory.conectar();
			

			String sql = "{CALL p_consultaAgenda(?)}";
			CallableStatement cs = conexao.prepareCall(sql);
			cs.setString(1, dia);
			
			ResultSet rs = cs.executeQuery();
			while(rs.next()){
				Agendamento a = new Agendamento();
				a.setPet(rs.getInt("id_pet"));
				a.setDia(rs.getString("dia"));
				a.setStatus(rs.getString("status"));
				listaAgendamento.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listaAgendamento;
	}
	
}