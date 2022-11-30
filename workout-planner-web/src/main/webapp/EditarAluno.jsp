<%@page import="Models.Pessoa"%>
<%@page import="Models.Aluno"%>
<%@page import="Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<%
	int alunoId = Integer.parseInt(request.getParameter("id"));
	Dao<Aluno, Integer> daoAluno = new Dao<Aluno, Integer>();
	Pessoa pessoa = daoAluno.findById(Aluno.class, alunoId).get();
	Aluno aluno = (Aluno) pessoa;
%>
	<div class="h-100 d-flex align-items-center justify-content-center">
		<form class="col-md-4 col-md-offset-4" action="UsuarioServelet" method="post">
			<h1 class="text-center"> Editar aluno</h1>
			<input type="hidden" name="alunoId" value="<%= alunoId %>">
			<div class="form-outline mb-4">
				<label class="form-label">Nome</label>
				<input class="form-control" type="text" name="nome" value="<%=aluno.getNome() %>"> 
			</div>
			<div class="form-outline mb-4">
				<label class="form-label">Matricula</label>
				<input class="form-control" type="text" name="matricula" value="<%= aluno.getMatricula() %>"/>
			</div>
			<div class="form-outline mb-4">
				<label class="form-label">Data Nascimento</label>
	       		<input class="form-control" id="date" type="date" name="dataNascimento" value="<%= aluno.getDataNascimento() %>">
	       	</div>
	       	<div class="form-outline mb-4">
		       	<label class="form-label">Plano</label>
		       	<input class="form-control" type="text" name="plano" value="<%= aluno.getPlano() %>">
	       	</div>
	       	<div class="form-outline mb-4">
		       	<label class="form-label">Usuario</label>
		       	<input class="form-control" value="ALUNO" disabled="disabled">
	       	</div>
	       	<input id="tipoPessoaUsuario"  type="hidden" name="tipoPessoa" value="ALUNO"/>
	       	<div class="form-outline mb-4">
		       	<label class="form-label">Senha</label>
		       	<input class="form-control" type="text" name="senha" value="<%= aluno.getSenha() %>">
	       	</div>
			
			<button class="btn btn-primary btn-block w-100" type="submit" id="salvar">Salvar</button>
		</form>
	</div>
</body>
</html>