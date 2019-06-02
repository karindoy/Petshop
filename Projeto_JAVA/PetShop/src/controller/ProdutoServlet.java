package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import persistence.ProdutoDao;


@WebServlet("/insereProd")
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProdutoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Produto p = new Produto();
		p.setCategoria(request.getParameter("cBoxCat"));
		p.setNome(request.getParameter("nomeProd"));
		p.setPreco(Double.parseDouble(request.getParameter("valorProd")));
		p.setQuantidade(Integer.parseInt(request.getParameter("quantProd")));
		p.setValidade(request.getParameter("valiProd"));
		
		try {
			ProdutoDao.AdicionarProduto(p);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}