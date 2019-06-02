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
		
		String sql = "{CALL p_insere_agendamento(?,?,?,?)}";
		CallableStatement cs = conexao.prepareCall(sql);
		
		cs.setInt(1, age.getPet());
		cs.setString(2, age.getDia());
		cs.setString(3, age.getHora());
		cs.setString(4, age.getStatus());
		cs.execute();
	}
	
	public static List<Agendamento> ConsultarAgendamentos() throws SQLException{
		List<Agendamento> listaAgendamento = new ArrayList<Agendamento>();
		try {
			Connection conexao = ConexaoFactory.conectar();
			

			String sql = "SELECT id_pet, dia, hora, status FROM agendamento";

			PreparedStatement ps = conexao.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
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