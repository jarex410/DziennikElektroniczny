package Encje;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Ocena {

	@Id
	@GeneratedValue
	private int id_ocen;
	private String oceny;

	@ManyToOne
	// @JoinColumn(name = "Ocena")
	private Uczen Uczen;
	@ManyToOne
	// @JoinColumn(name = "Ocena")
	private Klasa klasa;
	@ManyToOne
	// @JoinColumn(name = "Ocena")
	private Przedmiot przedmiot;

	public int getId_ocen() {
		return id_ocen;
	}

	public void setId_ocen(int id_ocen) {
		this.id_ocen = id_ocen;
	}

	public String getOceny() {
		return oceny;
	}

	public void setOceny(String oceny) {
		this.oceny = oceny;
	}

	public Uczen getUczen() {
		return Uczen;
	}

	public void setUczen(Uczen uczen) {
		Uczen = uczen;
	}

	public Klasa getKlasa() {
		return klasa;
	}

	public void setKlasa(Klasa klasa) {
		this.klasa = klasa;
	}

	public Przedmiot getPrzedmiot() {
		return przedmiot;
	}

	public void setPrzedmiot(Przedmiot przedmiot) {
		this.przedmiot = przedmiot;
	}

}
