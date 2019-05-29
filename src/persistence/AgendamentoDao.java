package persistence;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import model.Agendamento;

public class AgendamentoDao {
	
	public static void AdicionarAgendamento(String pet_nome, Date dia, Time hora, String status) throws SQLException{
		Conexao c = new Conexao();
		c.conectar();
		
		String sql = "{CALL p_insere_agendamento(?,?,?,?)}";
		CallableStatement cs = c.conexao.prepareCall(sql);
		
		cs.setString(1, pet_nome);
		cs.setDate(2, dia);
		cs.setTime(3, hora);
		cs.setString(4, status);
		cs.execute();
	}
	
	public static List<Agendamento> ConsultarAgendamentos() throws DAOException{
		List<Agendamento> listaAgendamento = new ArrayList<Agendamento>();
		try {
			Conexao c = new Conexao();
			c.conectar();
			

			String sql = "SELECT pet_nome, dia, hora, status FROM agendamento";

			PreparedStatement ps = c.conexao.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Agendamento a = new Agendamento();
				a.setPet(rs.getString("pet_nome"));
				a.setDia(rs.getDate("dia"));
				a.setHora(rs.getTime("hora"));
				a.setStatus(rs.getString("status"));
				listaAgendamento.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
		
		return listaAgendamento;
	}
	
}