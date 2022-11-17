<%@page import="Models.TipoExercicio"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro Exercicio</title>
</head>
<body>
	<form action="controllerServelet" method="post">
		<h1> Cadastro Exercicio</h1>
		<label>Nome</label>
		<input type="text" name="nome"/>
		<label>Descricao</label>
		<input type="text" name="descricao"/>
		<label>TipoExercicio</label>
		<select name="tipoExercicio" id="tipoExercicio">
		<%
		    for (TipoExercicio exercicio : TipoExercicio.values()) {
		%>
		  <option value="<%= exercicio %>"><%=exercicio%></option>
		<%
		    }
		%>
		</select>
		
		<input type="submit" value="Salvar"/>
	</form>
</body>
</html>