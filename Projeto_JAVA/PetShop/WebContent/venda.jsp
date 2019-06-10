<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Vendinha</title>
	<link rel="stylesheet" type="text/css" href="css/aparencia.css" media="screen" />
	<script src="js/scripts.js"></script>
</head>
<body>
	<form action="vendaServlet" method="post" target="_Blank">
		<h2>Venda</h2>
		<label>Produto:</label>
		<%String tabela = (String)request.getAttribute("tabela"); %>
		<%=tabela%>
		<label>Quantidade:</label>
		<input type="text" name="qtd" id="qtd" size="5">
		<label>Dia:</label>
	    <input type="date" id="DiaVenda" name="DiaVenda"></input>
		<br>
		<br>
		<input type="submit" value="Enviar">
	</form>
</body>
</html>