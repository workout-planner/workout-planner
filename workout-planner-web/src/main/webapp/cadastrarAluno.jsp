<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<title>Cadastrar aluno</title>
</head>
<body>
<%
	String erro = null;
	if (request.getAttribute("message") != null)
	{
		erro = request.getAttribute("message").toString();
	}
%>
	<div class="h-100 d-flex align-items-center justify-content-center">
		<form class="col-md-4 col-md-offset-4" action="UsuarioServelet" method="post" id="formUsuario">
			<h1 class="text-center"> Cadastrar aluno</h1>
			<div class="form-outline mb-4">
				<label class="form-label">Nome</label>
				<input class="form-control" type="text" name="nome"/>
			</div>
			<div class="form-outline mb-4">
				<label class="form-label">Matricula</label>
				<input class="form-control" type="text" name="matricula"/>
			</div>
			<div class="form-outline mb-4">
				<label class="form-label">Data Nascimento</label>
	       		<input class="form-control" id="date" type="date" name="dataNascimento">
	       	</div>
	       	<div class="form-outline mb-4">
		       	<label class="form-label">Plano</label>
		       	<input class="form-control" type="text" name="plano"/>
	       	</div>
	       	<div class="form-outline mb-4">
		       	<label class="form-label">Usuario</label>
		       	<input class="form-control" value="ALUNO" disabled="disabled">
	       	</div>
	       	<input id="tipoPessoaUsuario"  type="hidden" name="tipoPessoa" value="ALUNO"/>
	       	<div class="form-outline mb-4">
		       	<label class="form-label">Senha</label>
		       	<input class="form-control" type="text" name="senha">
	       	</div>
			
			<button class="btn btn-primary btn-block w-100" type="submit" id="salvar">Salvar</button>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>

<!-- Modal -->
		<div class="modal fade" id="modalErro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">ERRO</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body .text-danger">
		       	<label><%=erro %></label>
		      </div>
		      <div class="modal-footer">
			      <div class="col-md-12">
	                <div class="col-md-12">
	                <button class="btn btn-danger form-control" data-dismiss="modal">Entendi</button>
	                </div>
            	   </div>
		      </div>
		    </div>
		  </div>
		</div>

<script>
$(document).ready(function() { 
	if (<%=erro != null%>)
	{		
		$('#modalErro').modal('show');
	}
});
</script>