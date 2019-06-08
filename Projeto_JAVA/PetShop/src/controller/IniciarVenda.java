package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.VendaDao;


@WebServlet("/IniciarVenda")
public class IniciarVenda extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public IniciarVenda() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = VendaDao.IdVenda();
			System.out.println(id);
			RequestDispatcher rd = request.getRequestDispatcher("venda.jsp");
			request.setAttribute("id", id);
			rd.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
