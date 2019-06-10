<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Inserir dono</title>
	<link rel="stylesheet" type="text/css" href="css/aparencia.css" media="screen" />
	<script src="js/scripts.js"></script>
	<script src="js/valida.js"></script>
</head>
<body>

	<form name="formpet" action="inserePet" method="post" target="_Blank" onsubmit="return validaCampoPet()">
		<fieldset>
			<legend>Dados do Pet</legend>
				<table cellspacing="10">
					<tr>
						<td>
							<label>Nome:</label>
							<input type="text" name="nomePet" id="nomePet" size="50">
						</td>
					</tr>
					<tr>
						<td>
							<label>Raça:</label>
							<input type="text" name="raca" id="raca" size="30">
						</td>
					</tr>
					<tr>
						<td>
							<label>Animal:</label>
							<select name="cboxPet">
								<option value="Gato">Gato</option>
								<option value="Cachorro">Cachorro</option>
								<option value="Roedor">Roedor</option>
								<option value="Passaro">Passaro</option>
								<option value="Outros">Outros</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<label>Sexo:</label>
							<select name="sexo">
								<option value="Femea">Femea</option>
								<option value="Macho">Macho</option>
							</select>
							<label>Peso:</label>
							<input type="text" name="peso" id="peso" size="10" placeholder="00.00">
							<label>Tamanho:</label>
							<input type="text" name="tamanho" id="tamanho" size="10">
							<label>Nascimento:</label>
							<input type="date" name="nasci" id="nasci" size="10" placeholder="dd/mm/aaaa">
						</td>
					</tr>
					<tr>
						<td>
							<label>ID Dono:</label>
							<%String id = (String)request.getAttribute("idDono"); %>
							<input type="text" name="Dono" id="Dono" value="<%=id%>" size="5">
						</td>
					</tr>
				</table>
			</fieldset>
		<input type="submit" style="margin-left:10px" value="Enviar">
		<input type="reset" style="margin-left:10px" value="Limpar">
	</form>
</body>
</html>