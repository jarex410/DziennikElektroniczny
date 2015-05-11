package Encje;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity
public class Ocena implements Comparable<Ocena> {

	@Id
	@GeneratedValue
	private int id_ocen;
	private String oceny;

	@ManyToOne
	private Uczen Uczen;
	@ManyToOne
	private Klasa klasa;
	@ManyToOne
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

	public int compareTo(Ocena o) {
		int porownaneOceny = przedmiot.compareTo(o.przedmiot);

		return porownaneOceny;

	}

}
