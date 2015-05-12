package MavenTest;

import java.util.List;

import Encje.Uczen;

public class pom {

	private String Klasa;
	private String Przedmiot;
	private List<Uczen> listaUczniowKlasy;
	private String newPass;
	private int liczZmianaHasla;

	public int getLiczZmianaHasla() {
		return liczZmianaHasla;
	}

	public void setLiczZmianaHasla(int liczZmianaHasla) {
		this.liczZmianaHasla = liczZmianaHasla;
	}

	public String getNewPass() {
		return newPass;
	}

	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}

	public List<Uczen> getListaUczniowKlasy() {
		return listaUczniowKlasy;
	}

	public void setListaUczniowKlasy(List<Uczen> listaUczniowKlasy) {
		this.listaUczniowKlasy = listaUczniowKlasy;
	}

	public String getKlasa() {
		return Klasa;
	}

	public void setKlasa(String klasa) {
		Klasa = klasa;
	}

	public String getPrzedmiot() {
		return Przedmiot;
	}

	public void setPrzedmiot(String przedmiot) {
		Przedmiot = przedmiot;
	}

}
