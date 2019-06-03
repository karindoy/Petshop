<html>

<head>
	<link rel="stylesheet" type="text/css" href="css/aparencia.css" media="screen" />
</head>

<body>
	<button class="tablink" onclick="openPage('Home', this, 'blue')" id="defaultOpen">Agenda</button>
	<button class="tablink" onclick="openPage('Pet', this, 'orange')">Pets</button>
	<button class="tablink" onclick="openPage('Produtos', this, 'green')"> Produtos</button>
	<button class="tablink" onclick="openPage('Loja', this, 'red')">Loja</button>

	<div id="Home" class="tabcontent">
		<fieldset>
			<legend>Agenda</legend>
			<table style="width:100%">
				<thead>
					<tr>

						<th>Nome (PET)</th>
						<th>Servi�o</th>
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
				<tr>
						<td>Eve</td>
						<td>Banho e Tosa</td>
						<td>16/05/2019</td>
						<td>14:00</td>
					</tr>
			</table>
		</fieldset>
		</br>
		<button id="BtnNovoAgendamento"
			onclick="window.open('Agendar.jsp','Agendar','resizable,height=600,width=800'); return false;" style="margin-left:10px ">Agendar</a></button>
		<button id="BtnAltrAgendados"onclick="window.open('AlterarAgendamento.jsp','Alterar Agenda','resizable,height=600,width=800'); return false;" style="margin-left:10px ">Alterar Agendamento</button>
	</div>



	<div id="Pet" class="tabcontent">
			<fieldset>
					<legend>Pets Cadastrados</legend>
					<table style="width:100%">
							<thead>
									<tr>
									  
									  <th>Nome</th>
									  <th>Ra�a</th>
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
				
				<button id="BtnCadPet" onclick="window.open('cadDono.jsp','Pets','height=600,width=1024'); return false;" style="margin-left:10px ">Cadastrar Pet</button>
				<button id="EdtCadPet" onclick="window.open('EditarPet.jsp','Editar Cadastro Pet','height=600,width=1024'); return false;" style="margin-left:10px ">Editar</button>
	</div>

	<div id="Produtos" class="tabcontent">
			<fieldset>
					<legend>Produtos Cadastrados</legend>
					<table style="width:100%">
							<thead>
									<tr>
									  
									  <th>Nome</th>
									  <th>Categoria</th>
									  <th>Valor</th>
									</tr>
								  </thead>
						<tr>
							<td>Wiskas Sach� 100gr</td>
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
				</fieldset></br>
				
				<button id="BtnCadPro" onclick="window.open('cadProduto.jsp','Produtos','height=350,width=800'); return false;" style="margin-left:10px ">Cadastrar Produto</button>
				<button id="EdtCadPro" onclick="window.open('EditarProduto.jsp','Editar Produto','height=350,width=800'); return false;" style="margin-left:10px ">Editar</button>
				
			</div>

	<div id="Loja" class="tabcontent">
		<h3>Loja</h3>
		<p>BEM VINDO A �REA DE GASTO AT�MICO</p>
	</div>
</body>

</html>


<script>
	//JavaScript da p�gina */
	function openPage(pageName, elmnt, color) {
		// Esconde todos os elementos da classe class="tabcontent" por padr�o */
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}

		// Remove a cor de fundo de todos os links / bot�es
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].style.backgroundColor = "";
		}

		// Mostra o conte�do da guia espec�fica
		document.getElementById(pageName).style.display = "block";

		// Adiciona a cor espec�fica ao bot�o usado para abrir o conte�do da guia
		elmnt.style.backgroundColor = color;
	}

	// Obt�m o elemento com id = "defaultOpen" e clique nele
	document.getElementById("defaultOpen").click();</script>