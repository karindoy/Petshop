<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Petstop</title>
	<link rel="stylesheet" type="text/css" href="css/aparencia.css" media="screen" />
	<script src="js/scripts.js"></script>
</head>

<body>
	<div class="cabecalho">
		<h1>Petstop</h1>
	</div>
	<button id="defaultOpen" class="tablink"
		onclick="openPage('Home', this, 'blue')">Agenda</button>
	<button class="tablink" onclick="openPage('Pet', this, 'orange')">Pets</button>
	<button class="tablink" onclick="openPage('Produtos', this, 'green')">Produtos</button>
	<button class="tablink" onclick="openPage('Loja', this, 'red')">Loja</button>

	<div id="Home" class="tabcontent">
		<fieldset>
			<legend>Agenda</legend>
			<table>
				<thead>
					<tr>
						<th>Nome (PET)</th>
						<th>Serviço</th>
						<th>Dia</th>
						<th>Hora</th>
					</tr>
				</thead>

				<tr>
					<td>Kitnelson</td>
					<td>Banho</td>
					<td>13/03/2019</td>
					<td>22:00</td>
				</tr>
				<tr>
					<td>Eve</td>
					<td>Tosa</td>
					<td>16/05/2019</td>
					<td>14:00</td>
				</tr>
			</table>
		</fieldset>
		<br />

		<form action="comboPet" target="_Self" method="post">
			<input type="submit" value="Agendar">
		</form>
		<form action="listaAgenda" target="_Self" method="post">
			<input type="submit" value="Opção">
		</form>
	</div>



	<div id="Pet" class="tabcontent">
		<fieldset>
			<legend>Pets Cadastrados</legend>
			<table>
				<thead>
					<tr>

						<th>Nome</th>
						<th>Raça</th>
						<th>Sexo</th>
						<th>Tipo</th>
						<th>Dono</th>
					</tr>
				</thead>
				<tr>
					<td>Kitnelson</td>
					<td>Vira-lata</td>
					<td>Masculino</td>
					<td>Gato</td>
					<td>Thomas</td>
				</tr>

			</table>
		</fieldset>

		<form action="comboDono" target="_Self" method="post">
			<input type="submit" value="Cadastrar Pet">
		</form>

		<form action="listaPet" target="_Self" method="post">
			<input type="submit" value="Opção">
		</form>
	</div>

	<div id="Produtos" class="tabcontent">
		<fieldset>
			<legend>Produtos Cadastrados</legend>
			<table>
				<thead>
					<tr>

						<th>Nome</th>
						<th>Categoria</th>
						<th>Valor</th>
					</tr>
				</thead>
				<tr>
					<td>Wiskas Sachê 100gr</td>
					<td>Alimentos</td>
					<td>R$7,00</td>
				</tr>
				<tr>
					<td>Ossinho pequeno</td>
					<td>Etc</td>
					<td>R$2,50</td>
				</tr>
				<tr>
					<td>Bolinha</td>
					<td>Brinquedos</td>
					<td>R$7,00</td>
				</tr>
			</table>
		</fieldset>
		<br />

		<form action="listaProd" target="_Self" method="post">
			<button id="BtnCadPro"
				onclick="window.open('cadProduto.jsp','Produtos','height=350,width=800'); return false;"
				style="margin-left: 10px">Cadastrar Produto</button>

			<input type="submit" value="Opção">
		</form>

	</div>

	<div id="Loja" class="tabcontent">
		<h3>Loja</h3>
		<form action="comboProd" target="_Self" method="post">
			<input type="submit" value="Vender">
		</form>
	</div>
</body>
<script>
	document.getElementById("defaultOpen").click();
</script>
</html>

