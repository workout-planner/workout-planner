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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
	<div class="h-100 d-flex align-items-center justify-content-center">
		<form class="col-md-4 col-md-offset-4" action="PlanilhaExercicioServelet" method="post">
			<h1 class="text-center"> Cadastrar Planilha </h1>
			<div class="form-outline mb-4">
				<label class="form-label">Nome</label>
				<input class="form-control" id="text" type="text" name="nome">
			</div>
			<div class="form-outline mb-4">
				<label class="form-label">Data Inicio</label>
				<input class="form-control" id="date" type="date" name="dataInicio">
			</div>
			<div class="form-outline mb-4">
				<label class="form-label">Data Fim</label>
				<input class="form-control" id="date" type="date" name="dataFim">
			</div>
			<div class="form-outline mb-4">
				<label class="form-label">Aluno</label>
				<select class="form-select" name="alunoId">
				<%
				    for (Aluno aluno : alunos) {
				%>
				  <option value="<%=aluno.getId()%>"><%=aluno.getNome()%></option>
				<%
				    }
				%>
				</select>
			</div>
			<div class="form-outline mb-4">
				<label class="form-label">Personal</label>
				<input class="form-control" type="text" value="<%=personalCadastrandoPlanilha.getNome()%>" disabled="disabled">
				<input type="hidden" value="<%=personalCadastrandoPlanilha.getId()%>" name="personalId">
			</div>
			<div class="border p-4 mb-4">
				<div class="form-outline mb-4">
					<select class="form-select" name="tipoExercicio" id="tipoExercicio">
					<option value="Nenhum">Nenhum</option>
					<%
					    for (TipoExercicio exercicio : TipoExercicio.values()) {
					%>
						
					  <option value="<%= exercicio %>"><%=exercicio%></option>
					<%
					    }
					%>
					</select>
				</div>
				<div id="divFiltro">
				<% 
				for (Exercicio exercicio : exercicios) {
				%>
					<div id="<%=exercicio.getTipoExercicio()%>">
			            <div class="checklist-nivel-1">
			                <div class="form-check form-outline mb-4">
				                <input class="form-check-input" id="check<%=exercicio.getId()%>" onclick="checkClick(<%=exercicio.getId()%>)" name="exercicio" type="checkbox" value="<%=exercicio.getId()%>"/>
				            	<label class="form-check-label"><%=exercicio.getNome() %></label>
			        	    </div>   
			        	    <div class="row"> 
			        	    	<div class="col">
					                <div class="form-outline mb-4">
					        	        <label class="form-label">Repetições</label>
						                <input class="form-control" name="repeticoes" type="text" id="repeticoes<%=exercicio.getId()%>" disabled="disabled"/>
					                </div>
					            </div>
					            <div class="col">
					                <div class="form-outline mb-4">
						                <label class="form-label">Series</label>
						                <input class="form-control" name="series" type="text" id="series<%=exercicio.getId()%>" disabled="disabled"/>
					                </div>
					            </div>
					            <div class="col">
					                <div class="form-outline mb-4">
						                <label class="form-label">Tempo Descanso</label>
						                <input class="form-control" name="tempoDescanso" id="descanso<%=exercicio.getId()%>" type="text" disabled="disabled"/>
					            	</div>
					           	</div>
				            </div>
			            </div>
		            </div>
				<% 
				}
				%>
				</div>
			</div>
			<button class="btn btn-primary btn-block w-100" type="submit" >Salvar</button>
		</form>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>

<script>
	$('#tipoExercicio').on('change', function () {
	   	var tipoExercicio = '#'+$("#tipoExercicio").val();
	   	$("#divFiltro").children('div').hide();
	   	$("#divFiltro").children(tipoExercicio).show();
	   	
	   	if(tipoExercicio == '#Nenhum')
   		{
	   		$("#divFiltro").children('div').show();
   		}
	});

	function checkClick(id)
	{
		var isChecked = $('#check'+id).is(':checked');
		if (isChecked) {
			$("#repeticoes"+id).prop("disabled", false);
			$("#series"+id).prop("disabled", false);
			$("#descanso"+id).prop("disabled", false);	
		}
		else {
			$("#repeticoes"+id).prop("disabled", true);
			$("#series"+id).prop("disabled", true);
			$("#descanso"+id).prop("disabled", true);
			$("#repeticoes"+id).val("");
			$("#series"+id).val("");
			$("#descanso"+id).val("");
		}
	}
</script>