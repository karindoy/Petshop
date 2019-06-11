<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Petstop</title>
<link rel="stylesheet" type="text/css" href="css/aparencia.css"
	media="screen" />
<script src="js/scripts.js"></script>
</head>

<body>
	<div class="cabecalho">
		<h1 style="color: white">Petstop</h1>
	</div>
	<div style="margin-top:5px; color:"white";">
		<%String user = (String) request.getAttribute("user");%>
		<%=user%>
	</div>
	<button id="defaultOpen" class="tablink"
		onclick="openPage('Home', this, 'blue');">Agenda</button>
	<button class="tablink" onclick="openPage('Pet', this, 'orange')">Pets</button>
	<button class="tablink" onclick="openPage('Produtos', this, 'green')">Produtos</button>
	<button class="tablink" onclick="openPage('Loja', this, 'red')">Loja</button>
	
	<div id="Home" class="tabcontent">
		<fieldset>
			<legend style="color: white;">Agendamentos Cadastrados</legend>
			<form action='excluiAgenda' method='post' target='_Self'>
				<table style="width: 100%">
					<thead>
						<tr>
							<th>ID</th>
							<th>Dia</th>
							<th>Hora</th>
							<th>Pet ID</th>
							<th>Estado</th>
							<th>Servico ID</th>
							<th>Apagar</th>
						</tr>
					</thead>
					<%
						String tabelaAgenda = (String) request.getAttribute("tabelaAgenda");
					%>
					<%=tabelaAgenda%>
				</table>
				<input type="submit" style="margin-left: 10px" value="Apagar">
			</form>
		</fieldset>
		<br />



		<form action="comboPet" target="_Self" method="post">
			<input type="submit" value="Agendar">
		</form>
		<form action="listaAgenda" target="_Self" method="post">
			<input type="submit" value="Listar">
		</form>
	</div>



	<div id="Pet" class="tabcontent">
		<fieldset>
			<legend style="color: white;">Pets Cadastrados</legend>
			<form action='excluiPet' method='post' target='_Self'>
				<table style="width: 100%">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nome</th>
							<th>Animal</th>
							<th>Raça</th>
							<th>Sexo</th>
							<th>Peso</th>
							<th>Nascimento</th>
							<th>Tamanho</th>
							<th>ID Dono</th>
							<th>Apagar</th>
						</tr>
					</thead>
					<%
						String tabelaPet = (String) request.getAttribute("tabelaPet");
					%>
					<%=tabelaPet%>
				</table>
				<input type="submit" style="margin-left: 10px" value="Apagar">
			</form>
		</fieldset>

		<form action="comboDono" target="_Self" method="post">
			<input type="submit" value="Cadastrar Pet">
		</form>

		<form action="listaPet" target="_Self" method="post">
			<input type="submit" value="Listar">
		</form>
	</div>

	<div id="Produtos" class="tabcontent">
		<fieldset>
			<legend style="color: white;">Produtos Cadastrados</legend>
			<form action='excluiProd' method='post' target='_Self'>
				<table style="width: 100%">
					<thead>
						<tr>
							<th>Codigo</th>
							<th>Nome</th>
							<th>Preço</th>
							<th>Quantidade</th>
							<th>Descrição</th>
							<th>Validade</th>
							<th>Apagar</th>
						</tr>
					</thead>
					<%
						String tabelaProd = (String) request.getAttribute("tabelaProd");
					%>
					<%=tabelaProd%>
				</table>
				<input type="submit" style="margin-left: 10px" value="Apagar">
			</form>
		</fieldset>
		<br />

		<form action="listaProd" target="_Self" method="post">
			<button id="BtnCadPro"
				onclick="window.open('cadProduto.jsp','Produtos','height=350,width=800'); return false;"
				style="margin-left: 10px">Cadastrar Produto</button>

			<input type="submit" value="Listar">
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

