package persistence;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import model.Estoque;

public class EstoqueDao {
	
	public static void AdicionarEstoque(int id_produto, int quantidade, Date validade) throws SQLException{
		Conexao c = new Conexao();
		c.conectar();
		
		String sql = "{CALL p_insere_estoque(?,?,?,?)}";
		CallableStatement cs = c.conexao.prepareCall(sql);
		
		cs.setInt(1, id_produto);
		cs.setInt(2, quantidade);
		cs.setDate(3, validade);
		cs.execute();
	}
	
	public static List<Estoque> ConsultarEstoque() throws SQLException{
		Conexao c = new Conexao();
		c.conectar();
		
		List<Estoque> listaAgendamento = new ArrayList<Estoque>();
		String sql = "SELECT id_produto, quantidade, validade FROM agendamento";

		PreparedStatement ps = c.conexao.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Estoque e = new Estoque();
			e.setId_Produto(rs.getInt("id_produto"));
			e.setQuantidade(rs.getInt("quantidade"));
			e.setValidade(rs.getDate("validade"));
			listaAgendamento.add(e);
		}
		
		return listaAgendamento;
	}
	
}