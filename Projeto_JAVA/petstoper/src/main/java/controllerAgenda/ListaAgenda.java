package controllerAgenda;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Agendamento;
import persistence.AgendamentoDao;

@WebServlet("/listaAgenda")
public class ListaAgenda extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListaAgenda() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Agendamento> listaAgenda;
		try {
			listaAgenda = AgendamentoDao.ConsultarAgendamentos();
			StringBuilder tabela = new StringBuilder();
			
			for (Agendamento age : listaAgenda) {
				tabela.append("<tr> <td>"+age.getId()+"</td>");
				tabela.append("<td>"+age.getDia()+"</td>");
				tabela.append("<td>"+age.getHora()+"</td>");
				tabela.append("<td>"+age.getId_pet()+"</td>");
				tabela.append("<td>"+age.getStatus()+"</td>");
				tabela.append("<td>"+age.getServico()+"</td>");
				tabela.append("<td><input type='radio' value="+age.getId()+" name='cboxAgenda'></td></tr>");
			}
			RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
			request.setAttribute("tabelaAgenda", tabela.toString());
			rd.forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
