<%@page import="Models.TipoExercicio"%>
<%@page import="Models.Exercicio"%>
<%@page import="Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar exercicio</title>
</head>
<body>
<%
	int exercicioId = Integer.parseInt(request.getParameter("id"));
	Dao<Exercicio, Integer> daoExercicio = new Dao<Exercicio, Integer>();
	Exercicio exercicio = daoExercicio.findById(Exercicio.class, exercicioId).get();
%>
	<form action="controllerServeleto" method="post">
		<h1> Editar Curso</h1>
		<input type="hidden" name="exercicioId" value="<%= exercicioId %>">
		<label>Nome</label>
		<input type="text" name="nome" value="<%= exercicio.getNome() %>"/>
		<label>Descricao</label>
		<input type="text" name="descricao" value="<%= exercicio.getDesricao() %>"/>
		<label>TipoExercicio</label>
		<select name="tipoExercicio" id="tipoExercicio">
		<%
		    for (TipoExercicio exercicioTipo : TipoExercicio.values()) {
		%>
		  <option value="<%= exercicioTipo %>"><%=exercicioTipo%></option>
		<%
		    }
		%>
		</select>
		
		<input type="submit" value="Salvar"/>
	</form>
</body>
</html>