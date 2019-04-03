package br.bae.baesso.banco;

import java.util.Arrays;
import java.util.List;

import com.google.common.collect.Iterables;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;

import br.bae.baesso.dao.TurmaDAO;
import br.bae.baesso.model.Turma;

public class TurmaMongo implements TurmaDAO {

	@Override
	public MongoCollection<Turma> getCollection() {
		return MongoConnection.getDatabase().getCollection("turmas", Turma.class);
	}

	@Override
	public void inserir(Turma dado) {
		getCollection().insertOne(dado);
	}

	@Override
	public void excluir(Turma dado) {
		getCollection().deleteOne(Filters.eq("codigo", dado.getCodigo()));
	}

	@Override
	public Turma findOne(Long codigo) {
		return getCollection().find(Filters.eq("codigo", codigo)).first();
	}

	@Override
	public List<Turma> listar() {
		return Arrays.asList(Iterables.toArray(getCollection().find(), Turma.class));
	}

}
