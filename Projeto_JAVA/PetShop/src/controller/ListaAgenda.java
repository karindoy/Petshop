package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

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
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String tabela = "<form style='width: 50%;' action='excluiAgenda' method='post' target='_Blank'> "
					+ "<fieldset> "
					+ "<Select name='cboxAgenda'>";
			for (Agendamento age : listaAgenda) {
				tabela+="<option value ='"+age.getId()+"'>"+age.getDia()+","+age.getId_pet()+","+age.getServico()+"</option>";
			}
			tabela+="</select> "
					+ "</fieldset> "
					+ "<input type='submit' style='margin-left:10px' value='Apagar'>";
			out.println(tabela);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
