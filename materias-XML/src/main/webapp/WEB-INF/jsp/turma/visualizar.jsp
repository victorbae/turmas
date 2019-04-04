<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Classes</title>
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" >
	</head>
	<style type="text/css">
		.pega-clique:hover{
			background-color: rgba(0,0,0,.10) !important;
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
				<h2 class="display-4 text-center" style="margin-top: 33px; margin-bottom: 6px;">Classe ${turma.nome}</h2>
			</div>	
			<div class="row justify-content-sm-center">
				<h4 class="h4 text-center" style="margin-top: 6px; margin-bottom: 3px;">Média da turma: ${turma.media}</h4>
			</div>	
			
			<div class="row justify-content-sm-center"  style="margin-top: 6px; margin-bottom: 9px;">
				<div class="col">
				<h3 class="h3 text-center">Disciplinas</h3>
					<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="col-xs-8">Disciplinas</th>
									<th class="col-xs-8">Médias</th>
								</tr>
							</thead>
						<tbody>
							<c:forEach items="${turma.disciplinas}" var="dss" varStatus="index">
								<tr class="pega-clique">
									<td>${dss.nome}</td>
									<td>${dss.media}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>				
				<div class="col">
				<h3 class="h3 text-center">Alunos</h3>
					<c:forEach items="${turma.alunos.alunos}" var="aluno" varStatus="index">
						<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th colspan="3" class="col-xs-8">Aluno / Disciplinas</th>
									</tr>
								</thead>
							<tbody>
								<tr class="pega-clique table-primary">
									<td colspan="2" >${aluno.nome}</td>
									<td>Média: ${aluno.media}</td>
								</tr>
								<c:forEach items="${aluno.disciplinas.disciplina}" var="dsss">
									<tr class="pega-clique" >
										<td colspan="2"  style="padding-left: 42px;" >${dsss.nome}</td>
										<td>Nota: ${dsss.nota}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:forEach>
				</div>				
			</div>	
		</div>
	</body>
</html>