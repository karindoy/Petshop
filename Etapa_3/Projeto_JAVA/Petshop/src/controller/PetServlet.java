package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pet;
import persistence.PetDao;

@WebServlet("/inserePet")
public class PetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PetServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Pet p = new Pet();

		p.setNome(request.getParameter("nomePet"));
		p.setRaca(request.getParameter("raca"));
		p.setSexo(request.getParameter("sexo"));
		p.setPeso(Double.parseDouble(request.getParameter("peso")));
		p.setNascimento(request.getParameter("nasci"));
		p.setAnimal(request.getParameter("cboxPet"));
		p.setTamanho(Double.parseDouble(request.getParameter("tamanho")));

		String idDono = request.getParameter("Dono");
		p.setId_dono(Integer.parseInt(idDono));

		try {
			PetDao.AdicionarPet(p);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}

}