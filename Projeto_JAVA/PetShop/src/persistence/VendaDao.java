package persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Venda;

public class VendaDao {
	
	public static void AdicionarVenda(Venda venda) throws SQLException{
		Connection conexao = ConexaoFactory.conectar();
		
		String sql = "{CALL p_insere_venda(?,?,?,?)}";
		CallableStatement cs = conexao.prepareCall(sql);
		
		cs.setInt(1, venda.getId_Produto());
		cs.setString(2, venda.getData());
		cs.setInt(3, venda.getQuantidade());
		cs.setDouble(4, venda.getValorTotal());
		cs.execute();
	}
	
	public static List<Venda> ConsultarVendas() throws SQLException{
		Connection conexao = ConexaoFactory.conectar();
		
		List<Venda> listaVenda = new ArrayList<Venda>();
		String sql = "SELECT id_produto, data, quantidade, valor_total FROM venda";

		PreparedStatement ps = conexao.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Venda v = new Venda();
			v.setId_Produto(rs.getInt("id_produto"));
			v.setData(rs.getString("data"));
			v.setQuantidade(rs.getInt("quantidade"));
			v.setValorTotal(rs.getDouble("valor_total"));
			listaVenda.add(v);
		}
		
		return listaVenda;
	}
	
}