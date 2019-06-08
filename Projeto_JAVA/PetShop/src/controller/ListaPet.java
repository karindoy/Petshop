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
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String tabela = "<form style='width: 50%;' action='excluiPet' method='post' target='_Blank'> "
					      + "<fieldset> "
					      + "<Select name='cboxPet'>";
			for (Pet pet : listaPets) {
				tabela+="<option value ='"+pet.getId()+"'>"+pet.getNome()+"</option>";
			}
			tabela+="</select> "
					+ "</fieldset> "
					+ "<input type='submit' style='margin-left:10px' value='Apagar'>";
			out.println(tabela);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
