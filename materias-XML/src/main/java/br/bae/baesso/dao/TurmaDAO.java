package br.bae.baesso.dao;

import com.mongodb.client.MongoCollection;

import br.bae.baesso.model.Turma;

public interface TurmaDAO extends CrudDAO<Turma> {

	MongoCollection<Turma> getCollection();

}
