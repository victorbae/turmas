package br.bae.baesso.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;

import br.bae.baesso.banco.TurmaMongo;
import br.bae.baesso.model.Aluno;
import br.bae.baesso.model.Alunos;
import br.bae.baesso.model.Disciplina;
import br.bae.baesso.model.Turma;

@ApplicationScoped
public class TurmaService {

	@Inject
	private TurmaMongo repository;

	public List<Turma> listar() {
		return repository.listar();
	}

	public void salvar(Turma turma) {
		Turma turmaPunkRock = atualizaMediasTurma(turma);

		turmaPunkRock.setCodigo(this.geraCodigo());

		repository.inserir(turmaPunkRock);

	}

	public void excluir(Turma turma) {
		repository.excluir(turma);
	}

	public Turma findOne(Long codigoTurma) {
		return repository.findOne(codigoTurma);
	}

	public Turma atualizaMediasTurma(Turma turma) {
		Turma turmaPunk = new Turma();

		turmaPunk = calculaMediaTurma(turma);
		turmaPunk.setAlunos(calculaMediaCadaAluno(turma.getAlunos()));
//	TODO	turmaPunk.calculaMediaDisciplina(turma.getAlunos());
		return turmaPunk;
	}

	private Turma calculaMediaTurma(Turma turma) {
		Turma turmaCommediaCalcualda = turma;

		Double somaMedia = 0.0;
		Integer countaMedia = 0;

		for (Aluno aluno : turma.getAlunos().getAlunos()) {
			somaMedia += aluno.getMedia() != null ? aluno.getMedia() : 0.0;
			countaMedia++;
		}
		turmaCommediaCalcualda.setMedia(Double.valueOf(new DecimalFormat("#,##0.00").format(somaMedia / countaMedia)));
		return turmaCommediaCalcualda;
	}

	private Alunos calculaMediaCadaAluno(Alunos alunos) {
		List<Aluno> alunosComMediaCalculada = new ArrayList<>();

		Double somaMedia = 0.0;
		Integer countaMedia = 0;

		for (Aluno aluno : alunos.getAlunos()) {
			somaMedia = 0.0;
			countaMedia = 0;
			for (Disciplina dss : aluno.getDisciplinas().getDisciplina()) {
				somaMedia += dss.getNota() != null ? dss.getNota() : 0.0;
				countaMedia++;
			}
			aluno.setMedia(Double.valueOf(new DecimalFormat("#,##0.00").format(somaMedia / countaMedia)));
			alunosComMediaCalculada.add(aluno);
		}

		return new Alunos(alunosComMediaCalculada);
	}

//	private Disciplinas calculaMediaDisciplina(Alunos alunos) {
//		List<Disciplina> disciplinasComMediaCalculada = new ArrayList<>();
//		List<DisciplinaAux> listaAux = new ArrayList<>();
//
//		boolean jaCalculada = false;
//
//		for (Aluno aluno : alunos.getAlunos()) {
//			for (Disciplina dss : aluno.getDisciplinas().getDisciplina()) {
//				jaCalculada = false;
//				DisciplinaAux novaAuxiliar = new DisciplinaAux();
//
//				novaAuxiliar.setCodDisciplina(dss.getCodigo());
//
//				for (DisciplinaAux dssAux : listaAux) {
//					if (dssAux.getCodDisciplina().equals(dss.getCodigo())) {
//						dssAux.setSomaNotas(dssAux.getSomaNotas() + dss.getNota());
//						dssAux.setCountNotas(dssAux.getCountNotas() + 1);
//					}
//					if (!jaCalculada) {
//						novaAuxiliar.setSomaNotas(dss.getNota());
//						novaAuxiliar.setCountNotas(1);
//						listaAux.add(novaAuxiliar);
//					}
//				}
//			}
//		}
//
//		return new Disciplinas(disciplinasComMediaCalculada);
//	}

	private Long geraCodigo() {
		Random rd = new Random();
		Long cod = Long.valueOf((rd.nextInt((333 - 0) + 1) + 0) * 6);

		if (repository.findOne(cod) != null) {
			Long.valueOf((rd.nextInt((333 - 0) + 1) + 0) * 6);
		}

		return cod;
	}

}
