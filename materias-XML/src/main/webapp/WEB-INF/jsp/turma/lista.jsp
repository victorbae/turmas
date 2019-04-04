<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Classes</title>
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" >
	</head>
	<style type="text/css">
		.pega-clique:hover{
			cursor: pointer;
		}
	</style>
	<script type="text/javascript">
	function bs_input_file() {
		$(".input-file").before(
			function() {
				if ( ! $(this).prev().hasClass('input-ghost') ) {
					var element = $("<input type='file' class='input-ghost' style='visibility:hidden; height:0'>");
					element.attr("name",$(this).attr("name"));
					element.change(function(){
						element.next(element).find('input').val((element.val()).split('\\').pop());
					});
					$(this).find("button.btn-choose").click(function(){
						element.click();
					});
					$(this).find("button.btn-reset").click(function(){
						element.val(null);
						$(this).parents(".input-file").find('input').val('');
					});
					$(this).find('input').css("cursor","pointer");
					$(this).find('input').mousedown(function() {
						$(this).parents('.input-file').prev().click();
						return false;
					});
					return element;
				}
			}
		);
	}
	$(function() {
		bs_input_file();
	});
	</script>
	<body>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" >Diario de Classe <i class="fas fa-tree"></i></a>
		  	<div class="" id="navbarNav">
		    <ul class="navbar-nav">
		      <li class="nav-item">
		        <a  class="nav-item nav-link active" href="<c:url value="/"/>">Home</a>
		      </li>
		      <li class="nav-item">
		        <a  class="nav-item nav-link active" href="<c:url value="/turma/"/>">Classes</a>
		      </li>
		    </ul>
		  </div>
		</nav>
		<div class="container">
			<div class="row justify-content-sm-center">
				<h2 class="display-3 text-center" style="margin-top: 33px; margin-bottom: 33px;">Classes</h2>
			</div>
			<div class="row justify-content-sm-center">
				<div class="col-sm-8 text-left">
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Importar" style="margin-bottom: 12px;">Adicionar Classe</button>
				</div>
			</div>
			<div class="row justify-content-sm-center">
				<div class="col-sm-8 text-center">
					<table class="table table-striped table-bordered  table-hover">
					  <thead>
					    <tr>
					      <th colspan="2">Classes</th>
					    </tr>
					  </thead>
					  <tbody>
						  <c:forEach items="${turmaList}" var="turma">
						    <tr class="pega-clique">
						      <td onclick="location.href='<c:url value="/turma/visualizar/${turma.codigo}"/>'">${turma.nome}</td>
						      <td>
						      	<button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='<c:url value="/turma/excluir/${turma.codigo}"/>'">
						      		Excluir
						      	</button>
						      </td>
						    </tr>
						  </c:forEach>
					  </tbody>
					</table>
				</div>
			</div>
		</div>
		
		
		<div class="modal fade" tabindex="-1" role="dialog" id="Importar">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Importar classe</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p class="lead">Escolha o arquivo XML referente ao diário de classe</p>
					<form method="POST" action="/diario-classe/importar" enctype="multipart/form-data">
						<!-- COMPONENT START -->
						<div class="form-group">
							<div class="input-group input-file" name="arquivoXML">
								<span class="input-group-btn">
									<button class="btn btn-primary btn-choose" type="button">Procurar</button>
								</span> <input type="text" class="form-control"
									placeholder='Escolha um arquivo...' /> <span class="input-group-btn">
									<button class="btn btn-warning btn-reset" type="button">Limpar</button>
								</span>
							</div>
						</div>
						<!-- COMPONENT END -->
						<div class="form-group text-right">
							<button type="reset" class="btn btn-danger">Limpar</button>
							<button type="submit" class="btn btn-success pull-right">Importar</button>
						</div>
					</form>
		      	</div>
		    </div>
		  </div>
		</div>
		
		
		<footer class="text-center" style="margin-top: 33px;">
			<a href="https://www.facebook.com/victhor.baesso" target="_BLANK" class="nav-link">João Victor Baesso®</a>
		</footer>
	</body>
</html>