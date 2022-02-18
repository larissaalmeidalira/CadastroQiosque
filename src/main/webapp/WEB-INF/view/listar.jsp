<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h1>Lista de Produtos</h1>

	<fieldset>
	
	<table border="1">
	
	<tr>
	<th>Id:</th>
	<th>Nome:</th>
	<th>Email:</th>
	<th>Telefone:</th>
	<th>Data Nascimento:</th>
	<th>Genero:</th>
	<th>Endereço:</th>
	
	
	</tr>
	
	<c:forEach items="${dados }" var="c">
	
	<tr>
	<td>${c.id }</td>
	<td>${c.nome }</td>
	<td>${c.email }</td>
	<td>${c.telefone }</td>
	<td></td>
	<td>${c.genero }</td>
	<td>${c.endereco }</td>
	
	
	</tr>
	
	
	
	</c:forEach>
	
	</table>
	
	
	
	</fieldset>
	
</body>
</html>