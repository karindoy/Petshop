<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Venda</title>
<link rel="stylesheet" type="text/css" href="css/aparencia.css" media="screen" />
</head>
<body>
	
	<form action="vendaServlet" method="post" target="_Blank">
		<h2>Venda</h2>
		<label>Produto:</label>
		<select name="cBoxVenda">
			<option value="10">Ração</option>
			<option value="5">Comida</option>
			<option value="15">Brinquedo</option>
			<option value="25">Sabonete</option>
			<option value="30">Roupa</option>
		</select>
		
		<br>
		<br>
		<input type="submit" value="Enviar">
	</form>
</body>
</html>