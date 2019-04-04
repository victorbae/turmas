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
					<button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/"/>'" style="margin-bottom: 12px;">Adicionar Classe</button>
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
						    <tr onclick="location.href='<c:url value="/turma/visualizar/${turma.codigo}"/>'" class="pega-clique">
						      <td>${turma.nome}</td>
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
		<footer class="text-center" style="margin-top: 33px;">
			<a href="https://www.facebook.com/victhor.baesso" target="_BLANK" class="nav-link">João Victor Baesso®</a>
		</footer>
	</body>
</html>