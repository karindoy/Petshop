<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Produtos</title>
</head>
<body>
	<form action="insereProd" method="post" target="_Blank">
		<h2>Cadastro de Produto</h2>
		<label>Categoria:</label>
		<select name="cBoxCat">
			<option value="Ração">Ração</option>
			<option value="Comida">Comida</option>
			<option value="Brinquedo">Brinquedo</option>
			<option value="Higiene">Higiene</option>
			<option value="Roupas">Roupas</option>
		</select>
		<br>
		<br>
		<label>Nome:</label>
		<input type="text" name="nomeProd" id="nomeProd">
		<br>
		<br>
		<label>Valor:</label>
		<input type="text" name="valorProd" id="valorProd">
		<br>
		<br>
		<label>Quantidade:</label>
		<input type="text" name="quantProd" id="quantProd">
		<br>
		<br>
		<label>Data de Validade:</label>
		<input type="text" name="valiProd" id="valiProd" placeholder="Não perecivel">
		<br>
		<br>
		<input type="submit" value="Enviar">
	</form>
</body>
</html>