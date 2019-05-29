package model;

import java.util.Date;

public class Estoque {

	private int id_produto;
	private int quantidade;
	private Date validade;
	
	public int getId_produto() {
		return id_produto;
	}
	public void setId_Produto(int id_produto) {
		this.id_produto = id_produto;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public Date getValidade() {
		return validade;
	}
	public void setValidade(Date validade) {
		this.validade = validade;
	}

}
