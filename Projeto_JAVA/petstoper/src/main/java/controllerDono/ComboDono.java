package controllerDono;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Dono;
import persistence.DonoDao;


@WebServlet("/comboDono")
public class ComboDono extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ComboDono() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Dono> listaDonos = DonoDao.ConsultarDonos();
			StringBuilder tabela = new StringBuilder();
			tabela.append("<select name='DonosCad'>");
			
			for (Dono dono : listaDonos) {
				tabela.append("<option value='"+dono.getId()+"'>"+dono.getNome()+"</option>");
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("cadDono.jsp");
			request.setAttribute("tabela", tabela.toString());
			rd.forward(request, response);			 
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
