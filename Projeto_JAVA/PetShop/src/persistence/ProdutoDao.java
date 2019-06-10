package persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Produto;

public class ProdutoDao {
	
	public static void AdicionarProduto(Produto prod) throws SQLException, ClassNotFoundException{
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
		cs.close();
	}
	
	public static List<Produto> ConsultarProduto() throws SQLException, ClassNotFoundException{
		Connection conexao = ConexaoFactory.conectar();
		

		String sql = "SELECT * FROM produto";
		PreparedStatement ps = conexao.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Produto> listaProduto = new ArrayList<Produto>();
		
		while(rs.next()){
			Produto p = new Produto();
			p.setCod(rs.getInt("idProduto"));
			p.setNome(rs.getString("nome"));
			p.setPreco(rs.getDouble("preco"));
			p.setCategoria(rs.getString("categoria"));
			p.setQuantidade(rs.getInt("quantidade"));
			p.setDescricao(rs.getString("descricao"));
			p.setValidade(rs.getString("validade"));
			listaProduto.add(p);
		}
		
		return listaProduto;
	}
	
	public static void ExcluirProduto(int idProd) throws SQLException, ClassNotFoundException{
		Connection conexao = ConexaoFactory.conectar();
		
		String sql = "{CALL p_deletarProduto(?)}";
		CallableStatement cs = conexao.prepareCall(sql);
		
		cs.setInt(1, idProd);
		cs.execute();
		cs.close();
	}
	
}