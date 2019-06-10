
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
