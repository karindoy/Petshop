//JavaScript da página */
function openPage(pageName, elmnt, color) {
	// Esconde todos os elementos da classe class="tabcontent" por padrão */
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}

	// Remove a cor de fundo de todos os links / botões
	tablinks = document.getElementsByClassName("tablink");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].style.backgroundColor = "";
	}

	// Mostra o conteúdo da guia específica
	document.getElementById(pageName).style.display = "block";

	// Adiciona a cor específica ao botão usado para abrir o conteúdo da guia
	elmnt.style.backgroundColor = color;
}

function fechar() {
	window.close();
}

