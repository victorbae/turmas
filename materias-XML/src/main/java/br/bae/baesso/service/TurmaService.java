package br.bae.baesso.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

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
		Turma turmaPunkRock = buildTurma(turma);

		turmaPunkRock.setCodigo(this.geraCodigo());

		repository.inserir(turmaPunkRock);

	}

	public void excluir(Turma turma) {
		repository.excluir(turma);
	}

	public Turma findOne(Long codigoTurma) {
		return repository.findOne(codigoTurma);
	}

	public Turma buildTurma(Turma turma) {
		Turma turmaPunk = new Turma();

		turmaPunk.setNome(turma.getNome());
		turmaPunk.setAlunos(buildMediaAluno(turma.getAlunos()));
		turmaPunk.setMedia(buildMediaTurma(turmaPunk.getAlunos()));
		turmaPunk.setDisciplinas(buildMediaDisciplina(turma.getAlunos()));

		return turmaPunk;
	}

	private Double buildMediaTurma(Alunos alunos) {
		Double somaMedia = 0.0;
		Integer countaMedia = 0;

		for (Aluno aluno : alunos.getAlunos()) {
			somaMedia += aluno.getMedia() != null ? aluno.getMedia() : 0.0;
			countaMedia++;
		}
		return arredondar(somaMedia / countaMedia, 2);
	}

	private Alunos buildMediaAluno(Alunos alunos) {
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
			aluno.setMedia(arredondar(somaMedia / countaMedia, 2));
			alunosComMediaCalculada.add(aluno);
		}

		return new Alunos(alunosComMediaCalculada);
	}

	private Set<Disciplina> buildMediaDisciplina(Alunos alunos) {
		Set<Disciplina> listaFinal = new HashSet<>();
		HashMap<Long, Disciplina> mapDisciplinas = new HashMap<>();
		Disciplina dissAux;

		for (Aluno aluno : alunos.getAlunos()) {
			for (Disciplina disciplina : aluno.getDisciplinas().getDisciplina()) {
				if (mapDisciplinas.containsKey(disciplina.getCodigo())) {

					dissAux = mapDisciplinas.get(disciplina.getCodigo());
					double notaNova = disciplina.getNota() != null ? disciplina.getNota() : 0.0;

					dissAux.setMedia((dissAux.getMedia() + notaNova) / 2);
					mapDisciplinas.put(disciplina.getCodigo(), dissAux);
				} else {
					disciplina.setMedia(disciplina.getNota() != null ? disciplina.getNota() : 0.0);
					mapDisciplinas.put(disciplina.getCodigo(), disciplina);

					listaFinal.add(disciplina);
				}
			}
		}

		for (Disciplina disciplina : listaFinal) {
			disciplina.setMedia(mapDisciplinas.get(disciplina.getCodigo()).getMedia());
		}

		return listaFinal;
	}

	private double arredondar(double valor, int casas) {
		double arredondado = valor;
		arredondado *= (Math.pow(10, casas));
		arredondado = Math.floor(arredondado);
		arredondado /= (Math.pow(10, casas));
		return arredondado;
	}

	private Long geraCodigo() {
		Random rd = new Random();
		Long cod = Long.valueOf((rd.nextInt((333 - 0) + 1) + 0) * 6);

		if (repository.findOne(cod) != null) {
			Long.valueOf((rd.nextInt((333 - 0) + 1) + 0) * 6);
		}

		return cod;
	}

}
