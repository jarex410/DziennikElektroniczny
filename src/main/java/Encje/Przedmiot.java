package Encje;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Przedmiot {

	@Id
	@GeneratedValue
	private int id;
	private String nazwa;
	@ManyToMany(mappedBy = "przedmiot_id")
	private List<Klasa> listaKlas;

	@ManyToOne
	private Nauczyciel nauczyciel;

	@OneToMany(mappedBy = "przedmiot")
	private List<Ocena> listaOcen;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNazwa() {
		return nazwa;
	}

	public void setNazwa(String nazwa) {
		this.nazwa = nazwa;
	}

	public List<Klasa> getListaKlas() {
		return listaKlas;
	}

	public void setListaKlas(List<Klasa> listaKlas) {
		this.listaKlas = listaKlas;
	}

	public Nauczyciel getNauczyciel() {
		return nauczyciel;
	}

	public void setNauczyciel(Nauczyciel nauczyciel) {
		this.nauczyciel = nauczyciel;
	}

	public List<Ocena> getListaOcen() {
		return listaOcen;
	}

	public void setListaOcen(List<Ocena> listaOcen) {
		this.listaOcen = listaOcen;
	}

	public int compareTo(Przedmiot przedmiot) {

		int porownanePrzedmioty = nazwa.compareTo(przedmiot.nazwa);

		return porownanePrzedmioty;

	}

}
