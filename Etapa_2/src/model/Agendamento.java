package model;

import java.sql.Time;
import java.util.Date;

public class Agendamento {

	private String Pet = new String();

	private Date dia;

	public String getPet() {
		return Pet;
	}

	public void setPet(String pet) {
		Pet = pet;
	}

	public Date getDia() {
		return dia;
	}

	public void setDia(Date dia) {
		this.dia = dia;
	}

	public Time getHora() {
		return hora;
	}

	public void setHora(Time hora) {
		this.hora = hora;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	private Time hora;

	private String status;

}
