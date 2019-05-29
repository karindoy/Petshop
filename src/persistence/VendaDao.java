package persistence;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import model.Venda;

public class VendaDao {
	
	public static void AdicionarVenda(int id_produto, Date data, int quantidade, Double valor_Total) throws SQLException{
		Conexao c = new Conexao();
		c.conectar();
		
		String sql = "{CALL p_insere_venda(?,?,?,?)}";
		CallableStatement cs = c.conexao.prepareCall(sql);
		
		cs.setInt(1, id_produto);
		cs.setDate(2, data);
		cs.setInt(3, quantidade);
		cs.setDouble(4, valor_Total);
		cs.execute();
	}
	
	public static List<Venda> ConsultarVendas() throws SQLException{
		Conexao c = new Conexao();
		c.conectar();
		
		List<Venda> listaVenda = new ArrayList<Venda>();
		String sql = "SELECT id_produto, data, quantidade, valor_total FROM venda";

		PreparedStatement ps = c.conexao.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Venda v = new Venda();
			v.setId_Produto(rs.getInt("id_produto"));
			v.setData(rs.getDate("data"));
			v.setQuantidade(rs.getInt("quantidade"));
			v.setValorTotal(rs.getDouble("valor_total"));
			listaVenda.add(v);
		}
		
		return listaVenda;
	}
	
}