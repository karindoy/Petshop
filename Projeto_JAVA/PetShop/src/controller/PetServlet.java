package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Dono;
import model.Pet;
import persistence.DonoDao;


@WebServlet("/inserePet")
public class PetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PetServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Pet p = new Pet();
		Dono d = new Dono();
		
		p.setNome(request.getParameter("nomePet"));
		p.setRaca(request.getParameter("raca"));
		p.setSexo(request.getParameter("sexo"));
		p.setPeso(Double.parseDouble(request.getParameter("peso")));
		p.setNascimento(request.getParameter("nasci"));
		
		d.setNome(request.getParameter("nomeDono"));
		d.setBairro(request.getParameter("bairro"));
		d.setLogradouro(request.getParameter("logradouro"));
		d.setNum(request.getParameter("num"));
		d.setComplemento(request.getParameter("compli"));
		d.setTelefone1(request.getParameter("telefone"));
		d.setTelefone2(request.getParameter("telefone2"));
		
	
			try {
				DonoDao.AdicionarDono(d);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}

}