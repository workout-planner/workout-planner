<%@page import="Models.Exercicio"%>
<%@page import="Models.TipoExercicio"%>
<%@page import="Models.Pessoa"%>
<%@page import="Models.UsuarioLogado"%>
<%@page import="Models.Personal"%>
<%@page import="java.util.List"%>
<%@page import="Models.Aluno"%>
<%@page import="Dao.Dao"%>
<%@page import="Models.TipoExercicio"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<%
	Dao<Aluno, Integer> daoAluno = new Dao<Aluno, Integer>();
	Dao<Exercicio, Integer> daoExercicio = new Dao<Exercicio, Integer>();
	
	Pessoa personalCadastrandoPlanilha = UsuarioLogado.getUsuarioLogado();
	
	List<Exercicio> exercicios = daoExercicio.findAll(Exercicio.class);
	List<Aluno> alunos = daoAluno.findAll(Aluno.class);
%>
	<form action="PlanilhaExercicioServelet" method="post">
		<label>Data Inicio</label>
		<input id="date" type="date" name="dataInicio">
		<label>Data Fim</label>
		<input id="date" type="date" name="dataFim">
		<label>Aluno</label>
		<select name="alunoId">
		<%
		    for (Aluno aluno : alunos) {
		%>
		  <option value="<%=aluno.getId()%>"><%=aluno.getNome()%></option>
		<%
		    }
		%>
		</select>
		<label>Personal</label>
		<input type="text" value="<%=personalCadastrandoPlanilha.getNome()%>" disabled="disabled">
		<input type="hidden" value="<%=personalCadastrandoPlanilha.getId()%>" name="personalId">
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
	                <input onclick="checkClick(<%=exercicio.getId()%>)" name="exercicio" type="checkbox" value="<%=exercicio.getId()%>"/>
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
		<input type="submit" value="Salvar"/>
	</form>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>

<script>
	function checkClick(id)
	{
		$("#repeticoes"+id).prop("disabled", false);
		$("#series"+id).prop("disabled", false);
		$("#descanso"+id).prop("disabled", false);
	}
</script>