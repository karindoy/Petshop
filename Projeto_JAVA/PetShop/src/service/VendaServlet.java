package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Venda;
import persistence.VendaDao;


@WebServlet("/vendaServlet")
public class VendaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public VendaServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Venda v = new Venda();
		String idprod = request.getParameter("cBoxVenda");
		String qtd = request.getParameter("qtd");
		v.setId_produto(Integer.parseInt(idprod));
		v.setQuantidade(Integer.parseInt(qtd));
		v.setData(request.getParameter("DiaVenda"));
		try {
			String id = VendaDao.IdVenda();
			v.setId(Integer.parseInt(id));
			VendaDao.AdicionarVenda(v);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
