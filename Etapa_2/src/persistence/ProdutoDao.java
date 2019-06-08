package persistence;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Produto;

public class ProdutoDao {
	
	public static void AdicionarProduto(int cod, String nome, Double preco, String categoria) throws SQLException{
		Conexao c = new Conexao();
		c.conectar();
		
		String sql = "{CALL p_insere_produto(?,?,?,?,?,?)}";
		CallableStatement cs = c.conexao.prepareCall(sql);
		
		cs.setInt(1, cod);
		cs.setString(2, nome);
		cs.setDouble(3, preco);
		cs.setString(4, categoria);
		cs.execute();
	}
	
	public static List<Produto> ConsultarProduto() throws SQLException{
		Conexao c = new Conexao();
		c.conectar();
		
		List<Produto> listaProduto = new ArrayList<Produto>();
		String sql = "SELECT cod, nome, preco, categoria FROM produto";

		PreparedStatement ps = c.conexao.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
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