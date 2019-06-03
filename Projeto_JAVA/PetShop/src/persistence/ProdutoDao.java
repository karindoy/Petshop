package persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Produto;

public class ProdutoDao {
	
	public static void AdicionarProduto(Produto prod) throws SQLException{
		Connection conexao = ConexaoFactory.conectar();
		
		String sql = "{CALL p_inserirProduto(?,?,?,?,?,?)}";
		CallableStatement cs = conexao.prepareCall(sql);
		
		cs.setString(1, prod.getNome());
		cs.setDouble(2, prod.getPreco());
		cs.setString(3, prod.getCategoria());
		cs.setInt(4, prod.getQuantidade());
		cs.setString(5, prod.getDescricao());
		cs.setString(6, prod.getValidade());
		cs.execute();		
	}
	
	public static List<Produto> ConsultarProduto(String categoria) throws SQLException{
		Connection conexao = ConexaoFactory.conectar();
		
		List<Produto> listaProduto = new ArrayList<Produto>();
		String sql = "{CALL consultaTodosProduto(?)}";

		CallableStatement cs = conexao.prepareCall(sql);
		cs.setString(1, categoria);
		ResultSet rs = cs.executeQuery();
		while(rs.next()){
			Produto p = new Produto();
			p.setCod(rs.getInt("cod"));
			p.setNome(rs.getString("nome"));
			p.setPreco(rs.getDouble("preco"));
			p.setCategoria(rs.getString("categoria"));
			listaProduto.add(p);
		}
		
		return listaProduto;
	}
	
}