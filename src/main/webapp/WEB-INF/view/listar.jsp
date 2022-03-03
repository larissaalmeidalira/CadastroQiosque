<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>



        body{

            background-color: #80A6F2;
            font-family: -apple-system, BlinkMacSystemFont, 
            'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans',
             'Helvetica Neue', sans-serif;

        }

        .Principal {

            display: flex;

            position: absolute;

            top: 20%;

            left: 5%;

            border: solid 2px #fff;

            background-color: #fff;

            padding: 40px;

        }



        h1{

            margin-left: 4em;
            color: white;

        }



        img{

            margin-left: 5em;

            margin-top: 2em;

            width: 60%;

        }
        
        td{
        	text-align: center;
        }
	
	
	 .aa{

           color: #000;

            background-color: #fff;

            border: 1px solid #80A6F2;

            padding: 0.5em;

            border-radius: 0.8em;

            text-decoration: none;

        }



       .aa:hover{

            background-color: #80A6F2;

            color: #fff;

        }
        nav .estatistica{
        	color: white;
        	margin-left: 100px;
        	margin-top: 100px;
        	text-decoration: none;
        }
            
       
       
    </style>

</head>

<body>

	<h1>Lista de Produtos</h1>
	
	 <nav>
          <a class="estatistica" href="Estatisticas" style="vertical-align:middle" ><b>Estatísticas</b></a>
                    
     </nav>
	
	 <div class="Principal">
	 
	 	  <div class="listagem">

	<fieldset>
	
	
	
	<table border="1">
	
	<tr>
	<th>ID:</th>
	<th>Nome</th>
	<th>Email</th>
	<th>Telefone</th>
	<th>Data Nascimento</th>
	<th>Genero</th>
	<th>Endereço</th>
	<th>Data Cadastro</th>
	<th>Alterar</th>
	<th>Excluir</th>
	
	
	
	</tr>
	
	<c:forEach items="${dados }" var="c">
	
	<tr>
	<td>${c.id }</td>
	<td>${c.nome }</td>
	<td>${c.email }</td>
	<td>${c.telefone }</td>
	<td> <fmt:formatDate pattern="dd/MM/yyyy" value="${c.dataNascimento.time }"/></td>
	<td>${c.genero }</td>
	<td>${c.endereco }</td>
	<td> <fmt:formatDate pattern="dd/MM/yyyy" value="${c.dataCadastro.time }"/></td>
	<td><a href="alterarCadastro?id=${c.id }" onclick="return confirm('Deseja alterar?')"><button>Alterar</button></a></td>
	<td><a href="excluirCadastro?id=${c.id }" onclick="return confirm('Deseja excluir?')"><button>Excluir</button></a></td>
	<td>
	
	
	</tr>
	
	
	
	</c:forEach>
	
	</table>
	
	
	
	</fieldset>
	</div>
	
	  <div class="image">
	  	
	  	 <img src="3556960-removebg-preview.png">
	
	 <a class="aa" href="index">Voltar á página de cadastro</a>
	   </div>	
	   
	   
	</div>
</body>
</html>