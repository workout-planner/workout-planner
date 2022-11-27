<%@page import="Models.ItensPlanilha"%>
<%@page import="Repository.ItensPlanilhaRepository"%>
<%@page import="Models.TipoExercicio"%>
<%@page import="java.util.List"%>
<%@page import="Models.PlanilhaExercicio"%>
<%@page import="Models.Exercicio"%>
<%@page import="Models.Aluno"%>
<%@page import="Models.TipoExercicio"%>
<%@page import="Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Dao<PlanilhaExercicio, Integer> daoPlanilha = new Dao<PlanilhaExercicio, Integer>();
	Dao<Exercicio, Integer> daoExercicio = new Dao<Exercicio, Integer>();
	ItensPlanilhaRepository _repositorio = new ItensPlanilhaRepository();
	
	int planilhaId = Integer.parseInt(request.getParameter("id"));
	PlanilhaExercicio planilha = daoPlanilha.findById(PlanilhaExercicio.class, planilhaId).get();
	
	List<ItensPlanilha> itens = _repositorio.BuscarPorPlanilha(planilha);
	
	List<Exercicio> exercicios = daoExercicio.findAll(Exercicio.class);
%>
	<form action="PlanilhaExercicioServelet" method="post">
		<input name="planilhaId" type="hidden" value="<%=planilha.getId()%>">
		<label>Data Inicio</label>
		<input id="date" type="date" name="dataInicio" value="<%=planilha.getDataInicio()%>">
		<label>Data Fim</label>
		<input id="date" type="date" name="dataFim" value="<%=planilha.getDataFim()%>">
		<label>Aluno</label>
		<input type="text" value="<%=planilha.getAluno().getNome() %>" disabled="disabled">
		<input type="hidden" value="<%=planilha.getAluno().getNome() %>" name="aluno">
		<label>Personal</label>
		<input type="text" value="<%=planilha.getPersonal().getNome()%>" disabled="disabled">
		<input type="hidden" value="<%=planilha.getPersonal().getNome()%>%>" name="personalId">
		<div>
			<select name="tipoExercicio" id="tipoExercicio">
			<%
			    for (TipoExercicio exercicio : TipoExercicio.values()) {
			%>
			  <option value="<%= exercicio %>"><%=exercicio%></option>
			<%
			    }
			%>
			</select>
			<% 
			
			for (Exercicio exercicio : exercicios) {
			%>
	            <div class="checklist-nivel-1">
	                <input id="check<%=exercicio.getId()%>" onclick="checkClick(<%=exercicio.getId()%>)" name="exercicio" type="checkbox" value="<%=exercicio.getId()%>"/>
	                <label><%=exercicio.getNome() %></label>
        	        <label>Repetições</label>
	                <input name="repeticoes" type="text" id="repeticoes<%=exercicio.getId()%>" disabled="disabled"/>
	                <label>Series</label>
	                <input name="series" type="text" id="series<%=exercicio.getId()%>" disabled="disabled"/>
	                <label>Tempo Descanso</label>
	                <input name="tempoDescanso" id="descanso<%=exercicio.getId()%>" type="text" disabled="disabled"/>
	            </div>
			<% 
			}
			%>
		</div>
		<input id="btnSalvar" type="submit" value="Salvar" disabled="disabled"/>
	</form>
</body>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>

<script>
$(document).ready(function() { 
	$(<%=itens%>).each(function(index, element) {
		$('#check'+element.id).checked = true;
		$("#repeticoes"+element.id) = element.
	});
});
</script>