<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<title>Cadastrar Personal</title>
</head>
<body>
<%
			String erro = null;
			if (request.getAttribute("message") != null)
			{
				erro = request.getAttribute("message").toString();
			}
		%>
<form action="UsuarioServelet" method="post">
		<h1> Cadastrar Personal</h1>
		<label>Nome</label>
		<input type="text" name="nome"/>
		<label>CBO</label>
		<input type="text" name="cbo"/>
		<label>Data Nascimento</label>
       	<input id="date" type="date" name="dataNascimento">
       	<label>Area</label>
       	<input type="text" name="area"/>
       	<label>Usuario</label>
       	<input type="text" value="Personal" disabled="disabled">
       	<input name="tipoPessoa"  type="hidden" value="PERSONAL"/>
       	<label>Senha</label>
       	<input type="text" name="senha">
		
		<input type="submit" value="Salvar"/>
</form>
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