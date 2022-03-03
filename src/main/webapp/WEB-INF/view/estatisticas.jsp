<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	body{
		font-family: -apple-system, BlinkMacSystemFont, 
            'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans',
             'Helvetica Neue', sans-serif;
        background-color: #80A6F2;
             
             
	}
	
	   .Principal {

            display: flex;

            position: absolute;

            top: 8%;

            left: 10%;

            border: solid 2px #fff;

            background-color: #fff;

            padding: 40px;

        }

        h1{

            margin-left: 10em;

            color: #fff;

        }

        .estatisticas{

            margin-left: 5em;

        }

        img{

            margin-left: 5em;

            margin-top: 10em;

        }



        a{

           color: #000;

            background-color: #fff;

            border: 1px solid #80A6F2;

            padding: 1em;

            border-radius: 0.8em;

            text-decoration: none;

        }



        a:hover{

            background-color: #80A6F2;

            color: #fff;

        }
	
</style>
</head>
<body>

	<h1>Estatisticas</h1>
	
	<div class="Principal">
	
	<div class="estatisticas">
	
	<h2>Quantidade de cadastros do genero Feminino: ${dados.qtdFeminino}</h2>
    <h2>Quantidade de cadastros do genero Masculino: ${dados.qtdMasculino}</h2>
	
	<h2>Quantidade de clientes Jovens:: ${dados.jovem }</h2>

    <h2>Quantidade de clientes Adultos: ${dados.adulto }</h2>

    <h2>Quantidade de clientes Idosos: ${dados.idoso }</h2>
	   <br>

     <h2>Cadastros Realizados na Segunda-Feira: ${dados.seg }</h2>

     <h2>Cadastros Realizados na Terça-Feira: ${dados.ter }</h2>

      <h2>Cadastros Realizados na Quarta-Feira: ${dados.qua }</h2>

      <h2>Cadastros Realizados na Quinta-Feira: ${dados.qui }</h2>

      <h2>Cadastros Realizados na Sexta-Feira: ${dados.sex }</h2>

       <br>



     <h2>Cadastros realizados no período da Manhã: ${dados.manha }</h2>

      <h2>Cadastros realizados no período da Tarde: ${dados.tarde }</h2>

      <h2>Cadastros realizados no período da Noite: ${dados.noite }</h2>



        </div>

	<div class="image">



    <img src="3556940-removebg-preview.png">



    <a href="listarCadastrados">Voltar á página de listagem</a>



     </div>
        
	</div>
	
	

	

	
	
</body>
</html>