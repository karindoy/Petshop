<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="stylesheet" type="text/css" href="css/aparencia.css"
	media="screen" />
<body>


	<form style=" width: 50%;" action="insereAgenda" method="post" target="_Blank">

		<!-- TABELA DE CADASTRADOS-->
		<fieldset>
			<legend>Pets</legend>
			<table style="width: 100%">
				<tr>
					<th>Nome (PET)</th>
					<th>Dono</th>
					<th>Telefone</th>
				</tr>
				<tr>
					<td>Kitnelson</td>
					<td>Thomas</td>
					<td>(11)9593-2212</td>
				</tr>
				<tr>
					<td>Eve</td>
					<td>Ash</td>
					<td>(11)92531721</td>
				</tr>


			</table>
		</fieldset>
		<fieldset>
			<label>Pet:</label>
			<select name="cBoxPets">
				<option value="1">Pet1</option>
				<option value="2">Pet2</option>
				<option value="3">Pet3</option>
				<option value="4">Pet4</option>
				<option value="5">Pet5</option>
			</select>
			<br>
			<label>Dia:</label>
	        <input type="text" id="DiaAgenda" name="DiaAgenda" style="width:100%" placeholder="aaaa/mm/dd"></input>
	        <label>Hora:</label>
	        <input type="text" id="HoraAgenda" name="HoraAgenda" style="width:100%" placeholder="00:00"></input>
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
<script>
	function fechar() {
		window.close();
	}
</script>