package br.bae.baesso.controller;

import javax.inject.Inject;

import br.bae.baesso.service.ImportadorService;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;

@Path("/")
@Controller
public class IndexController {

	@Inject
	private Result result;

	@Inject
	private ImportadorService service;

	@Get("/")
	public void index() {
		// Mapeado para jsp
	}

	@Post("/importar")
	public void importar(UploadedFile arquivoXML) {

		try {
			service.importa(arquivoXML);
			result.redirectTo(TurmaController.class).lista();
		} catch (Exception e) {
			e.printStackTrace();

			result.include("erro", "Arquivo inválido");
			result.redirectTo(this).index();
		}

	}
}
