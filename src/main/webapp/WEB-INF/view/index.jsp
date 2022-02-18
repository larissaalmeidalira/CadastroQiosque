<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>

    <style>
        body{   
            font-family: sans-serif;
            margin:auto;
            width: 40%;
            background-image: url(imagens/imgcadastro.jpg);
            background-repeat: no-repeat;
        }
        nav{
            margin-bottom: 80px;
            left: 30px;
            text-align: center;
        }
        nav a{
            color: White;
            float: left;
            display: block;
            text-align: center;
            padding: 20px;
            text-decoration: none;
            transition: all 0.5s;
            cursor: pointer;
            
        }

            
        a span {
            cursor: pointer;
            display: inline-block;
            position: relative;
            transition: 0.5s;
        }

        a span:after {
            content: '\00bb';
            position: absolute;
            opacity: 0;
            top: 0;
            right: -25px;
            transition: 0.5s;
            
        }

        a:hover span:after {
            opacity: 1;
            right: 0;
        }


        nav a:hover span {
            color: #F0F2F0;
            padding-right: 15px;
            
        }
        .container{
        margin-top: 10px;
        display: flex;
        flex-direction: column;
        }
        header{
            display: block;
        }
        fieldset{
            background: rgb(19, 13, 6, 0.7);
            border: none;
            border-radius: 5px;
            margin-top: 5px;
            height: 370px;
        }

        input{
            border-radius: 5px;
            border: none;
            margin-bottom: 25px;
            margin-right: 15px;
        }
        input:hover {
            box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.295), 0 17px 50px 0 rgba(0,0,0,0.295);
        }

        legend{
            color: white;
            border-radius: 15px;
            margin-bottom: 5px;
            padding-bottom: 25px;
        }
        p{
            color: white;
            margin-top: 5px;
        }
        label{
            color:white;
        }
        
        .botao{
            background-color: white;
            color: #023859;
            border-radius: 5px;
            border: none;
            display: inline;
            margin-top: 5px;
            width: 10%;
            height: 20px;
        }

        .botao:hover {
            box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.295), 0 17px 50px 0 rgba(0,0,0,0.295);
        }

        .texto{
            text-align:justify;
            margin-right: 20px;
        }
       
        .nome{
            width: 30%;
            height: 17px;
        }
        .sobrenome{
            width: 35%;
            height: 17px;
        }
        .email{
            width: 40%;
            height: 17px;
        }
        .data{
            width: 20%;
            height: 17px;
        }
        .endereco{
            width: 65%;
            height: 17px;
        }
        img{
            width: 100%;
            height: 100%;
        }
        select{
            width: 120px;
            margin-bottom: 25px;
            text-align: center;
            border: none;
            border-radius: 5px;
            height: 19px;
        }
    
    </style>
</head>

    <body>
    
        <div class="container">
            <header>
                <nav>
                    <a href="cadastro.html"><b>Cadastre-se</b></a>
                    <a href="estatisticas.html" style="vertical-align:middle" ><span><b>Estatísticas</b></span></a>
                    
                </nav>
            </header>

            <form action="salvarCadastrado" >
                <fieldset>
                    <legend><b>Cadastro</b></legend>
                    <label for="nome"><b>Nome:</b></label>
                    <input class="nome" type="text" name="nome" required value="${cliente.nome }">

                    <label for="email"><b>E-mail</b></label>
                    <input class="email" type="email" name="email" required value="${cliente.email }">
                        
                    <label for="telefone"><b>Telefone</b></label>
                    <input class="telefone" type="text" name="telefone" value="${cliente.telefone }">
                    <br>
                    <label for="data"><b>Data de Nascimento</b></label>
                    <input class="data" type="date" min="1900-01-01" max="2022-01-01" name="datanascimento">
                    <br>

                    <p><b>Gênero:</b>
                        <input type="radio" name="genero" value="M" required value="${cliente.genero }">
                        <label>Masculino</label>
                        <input type="radio" name="genero" value="F" required value="${cliente.genero}">
                        <label>Feminino</label>
                    </p>

                    <label><b>Endereço</b></label>
                    <input class="endereco" type="text" name="endereco" value="${cliente.endereco}" >


                    <br>
                    <label><b>Produto: </b></label>
                    <select name="produto">
						<c:forEach items="${tipos }" var="t">
					
							<option value="${t }">${t.toString() }</option>
			
						</c:forEach>
					</select>
			
                    
                    <br>
                    <input class="botao" type="submit" value="Enviar">
                    <input class="botao" type="submit" value="Limpar">
                
                </fieldset>
            </form>  
        </div> 
        
    </body>
</html>