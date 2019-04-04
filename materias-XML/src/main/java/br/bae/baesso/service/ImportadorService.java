package br.bae.baesso.service;

import java.io.IOException;
import java.io.StringReader;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;

import br.bae.baesso.conversor.ConversorXML;
import br.bae.baesso.model.Turma;
import br.com.caelum.vraptor.observer.upload.UploadedFile;

@ApplicationScoped
public class ImportadorService {

	@Inject
	private TurmaService turmaService;

	ConversorXML<Turma> conversorUmaTurma = new ConversorXML<>(Turma.class);

	public void importa(UploadedFile arquivo) throws IOException {

		String xmlS = IOUtils.toString(arquivo.getFile());

		Turma turma = conversorUmaTurma.geraObj(new StringReader(xmlS));

		turmaService.salvar(turma);
	}
}
