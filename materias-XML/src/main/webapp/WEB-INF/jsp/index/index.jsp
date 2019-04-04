<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Gerenciador de Classes</title>
		<link rel="stylesheet"
			href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" >
	</head>
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
		<div class="row justify-content-md-center">
			<div class="col-md-9">
				<div class="jumbotron" style="margin-top: 66px;">
				  <h3 class="display-4">Gerenciador de Classes</h3>
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

</body>
</html>