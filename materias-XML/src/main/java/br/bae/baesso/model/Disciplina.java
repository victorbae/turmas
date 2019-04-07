package br.bae.baesso.model;

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
public class Disciplina implements Comparable<Disciplina> {

	@XmlAttribute
	private Long codigo;

	@XmlAttribute
	private String nome;

	@XmlElement
	private Double nota;

	private Double media;

	private Double somaNotas;

	private Integer qntNotas;

	@Override
	public int compareTo(Disciplina o) {
		if (this.codigo < o.getCodigo()) {
			return -1;
		}
		if (this.codigo > o.getCodigo()) {
			return 1;
		}
		return 0;
	}
}
