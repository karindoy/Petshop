
function validaCampoPet(){
	  var nome = document.forms["formpet"]["nomePet"].value;
	  if (nome == "") {
	    alert("Preencha o nome do pet");
	    return false;
	  }
	  
	  var animal = document.forms["formpet"]["cboxPet"].value;
	  if (animal == "") {
	    alert("Preencha o o tipo de animal");
	    return false;
	  }
	  
	  var peso = document.forms["formpet"]["peso"].value;
	  if (peso == "") {
	    alert("Preencha o peso do pet");
	    return false;
	  }
	  
	  var tamanho = document.forms["formpet"]["tamanho"].value;
	  if (tamanho == "") {
	    alert("Preencha o tamanho em metros do pet");
	    return false;
	  }
	
	  var nascimento = document.forms["formpet"]["nasci"].value;
	  if (nascimento == "") {
	    alert("Preencha a data de nascimento do pet");
	    return false;
	  }
}


function validaCampoDono(){
	  var nome = document.forms["formdono"]["nomeDono"].value;
	  if (nome == "") {
	    alert("Preencha o nome");
	    return false;
	  }
	  
	  var logradouro = document.forms["formdono"]["logradouro"].value;
	  if (logradouro == "") {
	    alert("Preencha o logradouro");
	    return false;
	  }
	  
	  var telefone = document.forms["formdono"]["telefone"].value;
	  if (telefone == "") {
	    alert("Preencha o primeiro telefone");
	    return false;
	  }

}

