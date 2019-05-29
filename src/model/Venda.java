package model;

import java.util.Date;

public class Venda {

	private int id_produto;
	private Date data;
	private int quantidade;
	private Double valor_total;
	
	public int getId_Produto() {
		return id_produto;
	}
	public void setId_Produto(int id_produto) {
		this.id_produto = id_produto;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public Double getValorTotal() {
		return valor_total;
	}
	public void setValorTotal(Double valor_total) {
		this.valor_total = valor_total;
	}

}
