package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Agendamento;
import persistence.AgendamentoDao;

@WebServlet("/insereAgenda")
public class AgendaSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AgendaSerlvet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Agendamento age = new Agendamento();
		
		String id = request.getParameter("cBoxPets");
		age.setPet(Integer.parseInt(id));
		age.setDia(request.getParameter("diaAgenda"));
		age.setHora(request.getParameter("horaAgenda"));
		age.setStatus("Em Espera");
		
		try {
			AgendamentoDao.AdicionarAgendamento(age);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
