package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Usuario;

public class UserDao {
	public static Usuario ConsultaLogin(Usuario us) throws SQLException{
		Connection conexao = ConexaoFactory.conectar();
		
		String sql = "SELECT estado from usuarios where login = ? and senha = ?";
		
		PreparedStatement ps = conexao.prepareStatement(sql);
		ps.setString(1, us.getNome());
		ps.setString(2, us.getSenha());
		
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			us.setEstado(rs.getString("estado"));
		}
		
		return us;
	}
}
