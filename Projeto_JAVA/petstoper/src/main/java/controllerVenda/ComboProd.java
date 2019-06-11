package controllerVenda;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import persistence.ProdutoDao;

@WebServlet("/comboProd")
public class ComboProd extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ComboProd() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Produto> listaProd = ProdutoDao.ConsultarProduto();
			
			StringBuilder tabela = new StringBuilder();
			tabela.append("<Select name='cBoxVenda'>");
			for (Produto p : listaProd) {
				tabela.append("<option value ='"+p.getCod()+"'>"+p.getNome()+"</option>");
			}
			tabela.append("</select> ");
			RequestDispatcher rd = request.getRequestDispatcher("venda.jsp");
			request.setAttribute("tabela", tabela.toString());
			rd.forward(request, response);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
