<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inserir dono</title>
<link rel="stylesheet" type="text/css" href="css/aparencia.css" media="screen" />
</head>
<body>
	<form style="width: 60%;" action="insereDono" method="post" target="_Self">
		
		<fieldset>
			<legend>Dados do Dono</legend>
			<table cellspacing="10">
				<tr>
					<td>
						<label>Dono j� possui cadastro?</label>
					</td>
					<td align="left">
						<input type="radio" value="sim" name="donoCad">Sim
						<input type="radio" value="nao" name="donoCad" checked="checked">N�o
					</td>
				</tr>
				<tr>
					<td>
						<select name="DonosCad">
							<option value="1">Dono1</option>
							<option value="2">Dono2</option>
							<option value="3">Dono3</option>
							<option value="4">Dono4</option>
							<option value="5">Dono5</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>	
						<label>Nome:</label>
						<input type="text" name="nomeDono" id="nomeDono" size="50">
					</td>
				</tr>
				<tr>
					<td>
						<label>Bairro:</label>
						<input type="text" name="bairro" id="bairro" size="50">
					</td>
				</tr>
				<tr>
					<td>
						<label>Logradouro: </label>
						<input type="text" name="logradouro" id="logradouro">
					</td>
				</tr>
				<tr>
					<td>
						<label>Num: </label>
						<input type="text" name="num" id="num">
					</td>
				</tr>
				<tr>
					<td>
						<label>Complemento:</label>
						<input type="text" name="compli" id="compli">
					</td>
				</tr>
				<tr>
					<td>
						<label>Telefone 1:</label>
						<input type="text" name="telefone" id="telefone">
					</td>
				</tr>
				<tr>
					<td>
						<label>Telefone 2:</label>
						<input type="text" name="telefone2" id="telefone2">
					</td>
				</tr>
				</table>
				</fieldset>
			<input type="submit" value="Enviar">
			<input type="reset" value="Limpar">
	</form>
</body>
</html>