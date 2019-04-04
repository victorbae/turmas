package br.bae.baesso.controller;

import java.io.IOException;

import javax.inject.Inject;

import br.bae.baesso.service.ImportadorService;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.caelum.vraptor.validator.Validator;

@Path("/")
@Controller
public class IndexController {

	@Inject
	private Result result;

	@Inject
	private Validator validator;

	@Inject
	private ImportadorService service;

	@Get("/")
	public void index() {
		// Mapeado para jsp
	}

	@Post("/importar")
	public void importar(UploadedFile arquivoXML) throws IOException {

		service.importa(arquivoXML);

		result.redirectTo(TurmaController.class).lista();
		validator.onErrorRedirectTo(this).index();
	}
}
