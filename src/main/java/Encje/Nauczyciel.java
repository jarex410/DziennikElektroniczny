package Encje;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Nauczyciel {

	@Id
	private long id;
	private String imie;
	private String nazwisko;
	private String adres;
	private String pass;
	
	
	@OneToMany(mappedBy = "nauczyciel")
	private List<Przedmiot> listaPrzedmiotow;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getImie() {
		return imie;
	}

	public void setImie(String imie) {
		this.imie = imie;
	}

	public String getNazwisko() {
		return nazwisko;
	}

	public void setNazwisko(String nazwisko) {
		this.nazwisko = nazwisko;
	}

	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}


	public List<Przedmiot> getListaPrzedmiotow() {
		return listaPrzedmiotow;
	}

	public void setListaPrzedmiotow(List<Przedmiot> listaPrzedmiotow) {
		this.listaPrzedmiotow = listaPrzedmiotow;
	}

}
