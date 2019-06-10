<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>excluir Produto</title>
	<link rel="stylesheet" type="text/css" href="css/aparencia.css" media="screen" />
	<script src="js/scripts.js"></script>
</head>
<body>


    <form style='width: 50%;' action='excluiProd' method='post' target='_Self'>
           <fieldset>
					<legend>Produtos Cadastrados</legend>
            <table style="width:100%">
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
                <%String tabela = (String)request.getAttribute("tabela"); %>
				<%=tabela%>
				</table>
				<input type="submit" style="margin-left:10px" value="Apagar">
			</fieldset>
        </form> 
</body>
</head>

</html>
