package persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import model.Venda;

public class VendaDao {
	
	public static int IdVenda() throws SQLException{
		Connection conexao = ConexaoFactory.conectar();
		
		String sql = "{? = CALL `petshop`.`F_idVenda`()()}";
		CallableStatement cs = conexao.prepareCall(sql);
		cs.registerOutParameter(1, Types.INTEGER);
		int idVenda = cs.getInt(1);
		cs.close();
		return idVenda;
	}
	
	public static void AdicionarVenda(Venda venda) throws SQLException{
		Connection conexao = ConexaoFactory.conectar();
		
		String sql = "{CALL p_inserirVenda(?,?,?,?)}";
		CallableStatement cs = conexao.prepareCall(sql);
		
		cs.setInt(1, venda.getId());
		cs.setString(2, venda.getData());
		cs.setInt(3, venda.getQuantidade());
		cs.setInt(4, venda.getId_produto());
		cs.execute();
		cs.close();
	}
	
	public static List<Venda> ConsultarVendas() throws SQLException{
		Connection conexao = ConexaoFactory.conectar();
		
		List<Venda> listaVenda = new ArrayList<Venda>();
		String sql = "SELECT idvenda, dia, valortotal, quantidade, Produto_id FROM venda";

		PreparedStatement ps = conexao.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Venda v = new Venda();
			v.setId(rs.getInt("idvenda"));
			v.setData(rs.getString("dia"));
			v.setValor_total(rs.getDouble("valortotal"));
			v.setQuantidade(rs.getInt("quantidade"));
			v.setId_produto(rs.getInt("Produto_id"));
			listaVenda.add(v);
		}
		
		return listaVenda;
	}
	
}