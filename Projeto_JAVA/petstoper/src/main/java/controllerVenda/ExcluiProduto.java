package controllerVenda;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.ProdutoDao;

@WebServlet("/excluiProd")
public class ExcluiProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExcluiProduto() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idProd = request.getParameter("cboxProd");
		
		try {
			ProdutoDao.ExcluirProduto(Integer.parseInt(idProd));
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}

}
