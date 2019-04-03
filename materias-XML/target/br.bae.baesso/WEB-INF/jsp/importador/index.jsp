<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gerenciador de Turmas</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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

	<div class="container">
		<div class="col-md-8 col-md-offset-2">
			<h3>Escolha o arquivo XML referente ao diário de classe</h3>
			<form method="POST" action="/diario-classe/importar" enctype="multipart/form-data">
				<!-- COMPONENT START -->
				<div class="form-group">
					<div class="input-group input-file" name="arquivoXML">
						<span class="input-group-btn">
							<button class="btn btn-default btn-choose" type="button">Procurar</button>
						</span> <input type="text" class="form-control"
							placeholder='Escolha um arquivo...' /> <span class="input-group-btn">
							<button class="btn btn-warning btn-reset" type="button">Limpar</button>
						</span>
					</div>
				</div>
				<!-- COMPONENT END -->
				<div class="form-group">
					<button type="submit" class="btn btn-primary pull-right">Enviar</button>
					<button type="reset" class="btn btn-danger">Limpar</button>
				</div>
			</form>

		</div>
	</div>

</body>
</html>