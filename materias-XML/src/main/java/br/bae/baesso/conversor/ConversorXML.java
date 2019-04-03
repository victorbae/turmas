package br.bae.baesso.conversor;

import java.io.File;
import java.io.StringReader;
import java.io.StringWriter;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class ConversorXML<T> {

	private JAXBContext jaxbContext;

	public ConversorXML(Class<?> classePrincipal) {
		try {
			jaxbContext = JAXBContext.newInstance(classePrincipal);
		} catch (JAXBException e) {
			e.printStackTrace();
		}
	}

	public ConversorXML(String contextPath) {
		try {
			jaxbContext = JAXBContext.newInstance(contextPath);
		} catch (JAXBException e) {
			e.printStackTrace();
		}
	}

	public void gerarXml(File file, T objeto) {
		try {
			Marshaller marshaller = jaxbContext.createMarshaller();
			marshaller.marshal(objeto, file);
		} catch (JAXBException e) {
			e.printStackTrace();
		}
	}

	public T gerarObj(File file) {
		try {
			Unmarshaller unMarshaller = jaxbContext.createUnmarshaller();
			return (T) unMarshaller.unmarshal(file);
		} catch (JAXBException e) {
			e.printStackTrace();
		}
		return null;
	}

	public T geraObj(StringReader str) {
		try {
			Unmarshaller unMarshaller = jaxbContext.createUnmarshaller();
			return (T) unMarshaller.unmarshal(str);
		} catch (JAXBException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String gerarString(T objeto) {
		try {
			Marshaller marshaller = jaxbContext.createMarshaller();
			StringWriter stringWriter = new StringWriter();
			marshaller.marshal(objeto, stringWriter);
			return stringWriter.toString();
		} catch (JAXBException e) {
			e.printStackTrace();
		}
		return "";
	}
}