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

@WebServlet("/listaProd")
public class ListaProd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListaProd() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Produto> listaProd = ProdutoDao.ConsultarProduto();
			
			StringBuilder tabela = new StringBuilder();

			for (Produto p : listaProd) {
				tabela.append("<tr> <td>"+p.getCod()+"</td>");
				tabela.append("<td>"+p.getNome()+"</td>");
				tabela.append("<td>"+p.getPreco()+"</td>");
				tabela.append("<td>"+p.getQuantidade()+"</td>");
				tabela.append("<td>"+p.getDescricao()+"</td>");
				tabela.append("<td>"+p.getValidade()+"</td>");
				tabela.append("<td><input type='radio' value="+p.getCod()+" name='cboxProd'><t/d></tr>");
			}
			
			tabela.append("</table>");
			RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
			request.setAttribute("tabelaProd", tabela.toString());
			rd.forward(request, response);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
