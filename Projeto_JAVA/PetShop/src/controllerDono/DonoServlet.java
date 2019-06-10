package controllerDono;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Dono;
import persistence.DonoDao;

@WebServlet("/insereDono")
public class DonoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DonoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dono d = new Dono();
		
		String valida = request.getParameter("donoCad");
		String idDono;
		
		if(valida.equals("sim")){
			idDono = request.getParameter("DonosCad");
			RequestDispatcher rd = request.getRequestDispatcher("cadPet.jsp");
			request.setAttribute("idDono", idDono);
			rd.forward(request, response);
		}else{
			d.setNome(request.getParameter("nomeDono"));
			d.setBairro(request.getParameter("bairro"));
			d.setLogradouro(request.getParameter("logradouro"));
			d.setNum(request.getParameter("num"));
			d.setComplemento(request.getParameter("compli"));
			d.setTelefone1(request.getParameter("telefone"));
			d.setTelefone2(request.getParameter("telefone2"));
			try {
				idDono = DonoDao.AdicionarDono(d);
				RequestDispatcher rd = request.getRequestDispatcher("cadPet.jsp");
				request.setAttribute("idDono", idDono);
				rd.forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
}
