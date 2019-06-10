package controllerPet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pet;
import persistence.PetDao;

@WebServlet("/comboPet")
public class ComboPet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ComboPet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Pet> listaPets = PetDao.ConsultarPets();
			
			StringBuilder tabela = new StringBuilder();
			tabela.append("<Select name='cBoxPet'>");
			for (Pet pet : listaPets) {
				tabela.append("<option value ='"+pet.getId()+"'>"+pet.getNome()+"</option>");
			}
			tabela.append("</select> ");
			RequestDispatcher rd = request.getRequestDispatcher("Agendar.jsp");
			request.setAttribute("tabela", tabela.toString());
			rd.forward(request, response);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
