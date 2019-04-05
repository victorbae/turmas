package br.bae.baesso.model;

import java.util.Set;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@XmlRootElement
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "codigo")
@XmlAccessorType(XmlAccessType.FIELD)
public class Turma {

	private Long codigo;

	@XmlAttribute
	private String nome;

	@XmlElement
	private Alunos alunos;

	private Double media;

	private Set<Disciplina> disciplinas;

}
