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

@WebServlet("/listaPet")
public class ListaPet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListaPet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Pet> listaPets = PetDao.ConsultarPets();
			
			StringBuilder tabela = new StringBuilder();
			
			for (Pet pet : listaPets) {
				tabela.append("<tr> <td>"+pet.getId()+"</td>");
				tabela.append("<td>"+pet.getNome()+"</td>");
				tabela.append("<td>"+pet.getAnimal()+"</td>");
				tabela.append("<td>"+pet.getRaca()+"</td>");
				tabela.append("<td>"+pet.getSexo()+"</td>");
				tabela.append("<td>"+pet.getPeso()+"</td>");
				tabela.append("<td>"+pet.getNascimento()+"</td>");
				tabela.append("<td>"+pet.getTamanho()+"</td>");
				tabela.append("<td>"+pet.getId_dono()+"</td>");
				tabela.append("<td><input type='radio' value="+pet.getId()+" name='cboxPet'><t/d></tr>");
			}
			
			tabela.append("</table>");
			RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
			request.setAttribute("tabelaPet", tabela.toString());
			rd.forward(request, response);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
