<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inserir Pet</title>
</head>
<body>
	<form action="inserePet" method="post" target="_Blank">
			<h2>Dados do Pet</h2>
			<label>Nome:</label>
			<input type="text" name="nomePet" id="nomePet" size="60">
			<br>
			<br>
			<label>Raça:</label>
			<input type="text" name="raca" id="raca" size="50">
			<br>
			<br>
			<label>Sexo:</label>
			<input type="text" name="sexo" id="sexo" size="10">
			<label>Peso:</label>
			<input type="text" name="peso" id="peso" size="10">
			<label>Nascimento:</label>
			<input type="text" name="nasci" id="nasci" size="10">
		
		<h2>Dados do Dono</h2>
		
			<label>Nome:</label>
			<input type="text" name="nomeDono" id="nomeDono" size="50">
			<br>
			<br>
			<label>Bairro:</label>
			<input type="text" name="bairro" id="bairro" size="50">
			<br>
			<br>
			<label>Logradouro:</label>
			<input type="text" name="logradouro" id="logradouro">
			<br>
			<br>
			<label>Num:</label>
			<input type="text" name="num" id="num">
			<br>
			<br>
			<label>Complemento:</label>
			<input type="text" name="compli" id="compli">
			<br>
			<br>
			<label>Telefone 1:</label>
			<input type="text" name="telefone" id="telefone">
			<br>
			<br>
			<label>Telefone 2:</label>
			<input type="text" name="telefone2" id="telefone2">
			<br>
			<br>
		<input type="submit" value="Enviar">
	</form>
	
	<p class="saida">
</body>
</html>