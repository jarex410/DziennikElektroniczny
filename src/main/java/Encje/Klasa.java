package Encje;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Klasa {

	@Id
	private int id;
	private String oznaczenie;
	
	@OneToMany(mappedBy = "klasa")
	private List<Uczen> listaUczniowKlasy;
	
	@OneToMany(mappedBy = "klasa")
	private List<Ocena> listaOcenKlasy;
	
	@ManyToMany
	private List<Przedmiot> przedmiot_id;
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOznaczenie() {
		return oznaczenie;
	}

	public void setOznaczenie(String oznaczenie) {
		this.oznaczenie = oznaczenie;
	}

	public List<Uczen> getListaUczniowKlasy() {
		return listaUczniowKlasy;
	}

	public void setListaUczniowKlasy(List<Uczen> listaUczniowKlasy) {
		this.listaUczniowKlasy = listaUczniowKlasy;
	}

	public List<Ocena> getListaOcenKlasy() {
		return listaOcenKlasy;
	}

	public void setListaOcenKlasy(List<Ocena> listaOcenKlasy) {
		this.listaOcenKlasy = listaOcenKlasy;
	}

	public List<Przedmiot> getListaPrzedmiotowKlasy() {
		return przedmiot_id;
	}

	public void setListaPrzedmiotowKlasy(List<Przedmiot> listaPrzedmiotowKlasy) {
		this.przedmiot_id = listaPrzedmiotowKlasy;
	}



}
