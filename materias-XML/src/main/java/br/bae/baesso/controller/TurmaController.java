package br.bae.baesso.controller;

import java.util.List;

import javax.inject.Inject;

import br.bae.baesso.model.Turma;
import br.bae.baesso.service.TurmaService;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;

@Path("/turma")
@Controller
public class TurmaController {

	@Inject
	private Result result;

	@Inject
	private TurmaService service;

	@Get("/")
	public List<Turma> lista() {
		return service.listar();
	}

	@Get("/visualizar/{codTurma}")
	public Turma visualizar(Long codTurma) {
		return service.findOne(codTurma);
	}

	@Get("/excluir/{codTurma}")
	public void excluir(Long codTurma) {
		service.excluir(service.findOne(codTurma));
		result.redirectTo(this).lista();
	}
}
