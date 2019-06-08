<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Produto</title>
</head>
<link rel="stylesheet" type="text/css" href="css/aparencia.css" media="screen" />
<body>
	<form action="insereProd" method="post" target="_Blank">
		<fieldset>
				<legend>Edição de Produto</legend>
				<table cellspacing="10">

					<tr>
						<td>
							<label>Nome:</label>
						</td>
						<td align="left">
							<input type="text" name="nomeProd" id="NomeDono" style="width: 100%;">
						</td>
					</tr>
					<tr>
						<td>
							<label>Categoria:</label>
						</td>
						<td align="left">
                            <select id="CatPro" name="cBoxCat" style="width: 100%;">
                                <option id="Alimentos">Alimentos</option>
                                <option id="Higiene">Higiene</option>
                                <option id="Acessorios">Acessórios</option>
                                <option id="Roupas">Roupas</option>
                                <option id="Etc">Etc</option></select>
						</td>
					</tr>
					<tr>
						<td>
							<label>Valor:</label></td>
						<td><input type="text" name="valorProd" id="ValorPro" style="width: 100%;"></td>
					</tr>
					
					<tr>
						<td>
							<label>Quantidade:</label></td>
						<td><input type="text" name="quantProd" id="quantProd" style="width: 100%;"></td>
					</tr>
					
					<tr>
						<td>
							<label>Data de Validade:</label></td>
						<td><input type="text" name="valiProd" id="valiProd" style="width: 100%;" placeholder="Não perecivel"></td>
					</tr>
					
					<tr>
						<td>
							<label>Descrição:</label></td>
						<td><input type="text" name="descricao" id="descricao" style="width: 100%;"></td>
					</tr>

				</table>
			</fieldset>
		<input type="submit" value="Enviar">
	</form>
</body>
</html>