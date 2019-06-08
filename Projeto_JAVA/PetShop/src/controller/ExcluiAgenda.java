package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.AgendamentoDao;

@WebServlet("/excluiAgenda")
public class ExcluiAgenda extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExcluiAgenda() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String idAgendados = request.getParameter("cboxAgenda");
		System.out.println("ID: " +idAgendados);
		try {
			AgendamentoDao.ExcluiAgendamento(Integer.parseInt(idAgendados));
		} catch (NumberFormatException | SQLException e) {
			e.printStackTrace();
		}
	}

}
