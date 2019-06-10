package controllerPet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.PetDao;


@WebServlet("/excluiPet")
public class ExcluiPet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ExcluiPet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idPet = request.getParameter("cboxPet");
		try {
			PetDao.ExcluiPet(Integer.parseInt(idPet));
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
