<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Inserir dono</title>
	<link rel="stylesheet" type="text/css" href="css/aparencia.css" media="screen" />
	<script src="js/scripts.js"></script>
</head>
<body>


	<form style=" width: 50%;" action="insereAgenda" method="post" target="_Blank">

		<fieldset>
			<label>Pet:</label>
			<%String tabela = (String)request.getAttribute("tabela"); %>
			<%=tabela%>
			<br>
			<label>Dia:</label>
	        <input type="date" id="DiaAgenda" name="DiaAgenda" style="width:100%" placeholder="dd/mm/aaaa"></input>
	        <label>Hora:</label>
	        <input type="time" id="HoraAgenda" name="HoraAgenda" style="width:100%" placeholder="00:00"></input>
	        <label>Serviço:</label>
	        <select name="cBoxServico" id="TipoServico"style="width:100%">
	            <option value="1" id="Banho">Banho</option>
	            <option value="2" id="Banho e Unhas">Banho e Unhas</option>
	            <option value="3" id="Tosa">Tosa</option>
	            <option value="4" id="Tosa e Unhas">Tosa e Unhas</option>
	            <option value="5" id="Banho e Tosa">Banho e Tosa</option>
	            <option value="6" id="Corte de Unhas">Corte de Unhas</option>
	            <option value="7" id="Completo">Completo</option>
	        </select>
		<br>
		</fieldset>
		<input type="submit" value="Agendar">
	</form>
</body>
</head>
</html>
