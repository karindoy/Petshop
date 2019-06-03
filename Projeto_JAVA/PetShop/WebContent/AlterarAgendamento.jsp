<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <link rel="stylesheet" type="text/css" href="css/aparencia.css" media="screen" />

<body>


    <form style="width: 50%;">

        <!-- TABELA DE CADASTRADOS-->
        <fieldset>
            <legend>Pets</legend>
            <table style="width:100%">
                <thead>
                    <tr>

                        <th>Nome (PET)</th>
                        <th>Dia</th>
                        <th>Hora</th>
                    </tr>
                </thead>
                <tr>
                    <td>Kitnelson</td>
                    <td>Thomas</td>
                    <td>(11)9593-2212</td>
                </tr>
                <tr>
                    <td>Eve</td>
                    <td>Ash</td>
                    <td>(11)92531721</td>
                </tr>

            </table>
        </fieldset>
<legend style="color: white"></legend>
        
        <fieldset>
        <label>Pet:</label>
			<select name="cBoxPets">
				<option value="1">Pet1</option>
				<option value="2">Pet2</option>
				<option value="3">Pet3</option>
				<option value="4">Pet4</option>
				<option value="5">Pet5</option>
			</select>
			<br>
			<label>Dia:</label>
	        <input type="text" id="DiaAgenda" style="width:100%" placeholder="aaaa/mm/dd"></input>
	        <label>Hora:</label>
	        <input type="text" id="HoraAgenda"style="width:100%" placeholder="00:00"></input>
	        <label>Serviço:</label>
	        <select name="cBoxServico" id="TipoServico"style="width:100%">
	            <option id="1">Banho</option>
	            <option id="2">Banho e Unhas</option>
	            <option id="3">Tosa</option>
	            <option id="4">Tosa e Unhas</option>
	            <option id="5">Banho e Tosa</option>
	            <option id="6">Corte de Unhas</option>
	            <option id="7">Completo</option>
	        </select>
		<br>
    </fieldset>
</br>
        <button id="BtnAlterarAgendamento" onclick="alert('Alterado com sucesso'),fechar()" style="margin-left: 10px">Salvar</button>
</form>
</body>
</head>

</html>
<script>
    function fechar() {
        window.close();
    }
</script>