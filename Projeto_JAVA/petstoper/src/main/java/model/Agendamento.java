package model;

public class Agendamento {

	private int id;
	private int id_pet;
	private String hora;
	private String status;
	private String dia;
	private int servico;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_pet() {
		return id_pet;
	}
	public void setId_pet(int id_pet) {
		this.id_pet = id_pet;
	}
	public String getHora() {
		return hora;
	}
	public void setHora(String hora) {
		this.hora = hora;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDia() {
		return dia;
	}
	public void setDia(String dia) {
		this.dia = dia;
	}
	public int getServico() {
		return servico;
	}
	public void setServico(int servico) {
		this.servico = servico;
	}

	
}
