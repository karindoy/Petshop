package model;

public class Agendamento {

	private int id_pet;
	private String hora;
	private String status;
	private String dia;
	private int servico;

	public int getId_pet() {
		return id_pet;
	}

	public void setId_pet(int id_pet) {
		this.id_pet = id_pet;
	}

	public int getServico() {
		return servico;
	}

	public void setServico(int servico) {
		this.servico = servico;
	}

	public int getPet() {
		return id_pet;
	}

	public void setPet(int id_pet) {
		this.id_pet = id_pet;
	}

	public String getDia() {
		return dia;
	}

	public void setDia(String dia) {
		this.dia = dia;
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
}
