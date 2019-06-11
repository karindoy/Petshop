package security;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Usuario;
import persistence.UserDao;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("usuario");
		String senha = request.getParameter("password");
		
		Usuario us = new Usuario();
		us.setNome(nome);
		us.setSenha(senha);
		
		try {
			UserDao.ConsultaLogin(us);
			if(us.getEstado()!=null) {
				RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
				request.setAttribute("user", us.getEstado());
				rd.forward(request, response);
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("Error_page.jsp");
				rd.forward(request, response);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
