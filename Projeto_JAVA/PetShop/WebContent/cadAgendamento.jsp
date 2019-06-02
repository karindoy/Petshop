<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agendar</title>
</head>
<body>
	<form action="insereAgenda" method="post" target="_Blank">
			<h2>Agendamento</h2>
			<select name="cBoxPets" id="cBoxPets">
				<option value="1">Pet1</option>
                <option value="2">Pet2</option>
                <option value="3">Pet3</option>
                <option value="4">Pet4</option>
                <option value="5">Pet5</option>
			</select>
			<br>
			<br>
			<label>Dia:</label>
			<input type="text" name="diaAgenda" id="diaAgenda">
			<label>Hora:</label>
			<input type="text" name="horaAgenda" id="horaAgenda">
			<br>
			<br>
			<input type="submit" value="Enviar">
	</form>
</body>
</html>