<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
     <link rel="stylesheet" href="https://cdn.es.gov.br/fonts/font-awesome/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>

    <style>
       *{



   		 padding: 0;

    	margin: 0;

   		 box-sizing: border-box;

	}



body{

    background-color: #80A6F2;

    
    
    font-family: -apple-system, BlinkMacSystemFont, 
            'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans',
             'Helvetica Neue', sans-serif;

}



.container{



    display: flex;

    display: flex;

    position: absolute;

    top: 20%;

    left: 20%;

    border: solid 2px #fff;

    background-color: #fff;

    padding: 40px;

}

        nav a{
            color: white;
            float: left;
            display: block;
            text-align: center;
            margin-left:15em;
            padding: 150px;
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
       
       .image{

    		background-color: #C9D7F2;
    		height: 50vh;

		}



		.form{

    		margin-left: 5em;

    		width: 30em;

    		padding: 1em;

		}




		form{

    		padding: 2em;
	
		}
		
       	input{

    	margin-bottom: 1em;

		}



		input.nome, .email, .telefone, .select, .endereco{



    	padding: 0.3em;

    	width: 95%;

    	margin: 0.5em;

	}




	fieldset{

    border:  2px solid #80A6F2;

	}



	.botao{

    border: none;

    background-color: #80A6F2;

    color: #fff;

    border-radius: 6px;

    padding: 0.8em;
    
    margin-top:2em;
    
    width: 100px;
    
	}



	.endereco{



    	margin-top: 1em;

   	 margin-bottom: 1em;

	}



		.select{



    margin-top: 1em;

    margin-bottom: 1em;

   

}



.box{



    padding: 0.5em;

}



.end,.genero, .produto {

    margin-top: 1em;

}
    </style>
</head>

    <body>
    
     <header>
               
            </header>
            	 <nav>
          			
                    <a  href="listarCadastrados" style="vertical-align:middle" ><span><b>Clientes cadastrados</b></span></a>
                    <a  href="Estatisticas" style="vertical-align:middle" ><span><b>Estatísticas</b></span></a>
    			 </nav>
    
        <div class="container">
           
            
            <div class="image">

            <img src="Mar-Business_1-removebg-preview.png">


	
        </div>
        
        



        <div class=" form">
        
        	<h1>Cadastre-se</h1>

            <form action="salvarCadastrado" >
            <input type="hidden" name="id" value="${dados.id }">
                <fieldset>
                	<div class="box">
                	<i class="fa fa-user"></i>
                    <label for="nome"><b>Nome:</b></label>
                    <input class="nome" type="text" name="nome" required value="${dados.nome }">
					<br>
					<i class="fa fa-envelope"></i>
                    <label for="email"><b>E-mail</b></label>
                    <input class="email" type="email" name="email" required value="${dados.email }">
                     <i class="fa fa-phone"></i>   
                    <label for="telefone"><b>Telefone</b></label>
                    <input class="telefone" type="text" name="telefone" required value="${dados.telefone }">
                    <br>
                    
                    <label for="data"><b>Data de Nascimento</b></label>
                    <input class="data" type="date" min="1900-01-01" max="2022-01-01" name="dataNascimento" required value='<fmt:formatDate pattern="yyyy-MM-dd" value="${dados.dataNascimento.time }"/>'>
                    <br>
				
                    <p><b>Gênero:</b>
                        <input type="radio" name="genero" value="Masculino" required value="${dados.genero }">
                        <label>Masculino</label>
                        <input type="radio" name="genero" value="Feminino" required value="${dados.genero}">
                        <label>Feminino</label>
                    </p>
					<i class="fa-solid fa-location-dot"></i>
                    <label><b>Endereço</b></label>
                    <input class="endereco" type="text" name="endereco" required value="${dados.endereco}" >


                    <br>
                    <label><b>Produto: </b></label>
                    <select name="produto">
						<c:forEach items="${tipos }" var="t">
					
							<option <c:if test="${dados.produtos == t }">selected</c:if> value="${t }">${t.toString() }</option>
			
						</c:forEach>
					</select>
			
                    
                    <br>
                    <input class="botao" type="submit" value="Enviar">
                </div>
                </fieldset>
            </form>  
        </div> 
        </div>
    </body>
</html>