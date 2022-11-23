<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastrar aluno</title>
</head>
<body>
<form action="UsuarioServelet" method="post">
		<h1> Cadastrar aluno</h1>
		<label>Nome</label>
		<input type="text" name="nome"/>
		<label>Matricula</label>
		<input type="text" name="matricula"/>
		<label>Data Nascimento</label>
       	<input id="date" type="date" name="dataNascimento">
       	<label>Plano</label>
       	<input type="text" name="plano"/>
       	<label>Usuario</label>
       	<input type="text" name="tipoPessoa" value="ALUNO" disabled="disabled"/>
       	
		
		<input type="submit" value="Salvar"/>
</form>
</body>
</html>

<script>
//fazer script para tirar o disabled antes do post.
</script>