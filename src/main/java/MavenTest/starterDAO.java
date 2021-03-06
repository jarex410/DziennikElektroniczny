package MavenTest;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import Encje.Klasa;
import Encje.Nauczyciel;
import Encje.Ocena;
import Encje.Przedmiot;
import Encje.Uczen;

public class starterDAO {
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;

	public starterDAO() {
		entityManagerFactory = Persistence
				.createEntityManagerFactory("manager");
		entityManager = entityManagerFactory.createEntityManager();
	}

	// Funkcja sprawdzajaca poprawnosc logowania oraz to czy jest to uczen czy
	// nauczyciel;
	public int check(long id, String pass) {

		if (entityManager
				.createQuery(
						"SELECT u FROM Uczen u WHERE u.id LIKE :id AND u.pass LIKE :pass")
				.setParameter("id", id).setParameter("pass", pass)
				.getResultList().isEmpty() == false)
			return 1; // jesli jest uczniem
		else if (entityManager
				.createQuery(
						"SELECT n FROM Nauczyciel n WHERE n.id LIKE :id AND n.pass LIKE :pass")
				.setParameter("id", id).setParameter("pass", pass)
				.getResultList().isEmpty() == false)
			return 2; // jesli jest nauczycielem
		else
			return 0; // 0 jesli user nie istnieje
	}

	public String getStudentName(long id) {
		Uczen uczen = new Uczen();
		uczen = (Uczen) entityManager
				.createQuery("SELECT u FROM Uczen u WHERE u.id LIKE :id")
				.setParameter("id", id).getResultList().get(0);

		return uczen.getImie();
	}

	public String getTeacherName(long id) {
		Nauczyciel nauczyciel = new Nauczyciel();
		nauczyciel = (Nauczyciel) entityManager
				.createQuery("SELECT n FROM Nauczyciel n WHERE n.id LIKE :id")
				.setParameter("id", id).getResultList().get(0);

		return nauczyciel.getImie();
	}

	// Funckja zwraca list� przedmiotow prowadzonych przez zalogowanego
	// nauczyciela

	@SuppressWarnings("unchecked")
	public Nauczyciel subjectList(long id_nauczyciela) {
		Nauczyciel na = new Nauczyciel();
		List<Nauczyciel> listaPrzedmiotow;

		listaPrzedmiotow = entityManager
				.createQuery("SELECT n FROM Nauczyciel n WHERE n.id LIKE :id")
				.setParameter("id", id_nauczyciela).getResultList();
		na = listaPrzedmiotow.get(0);

		return na;
	}

	// funcka zwraca liste uczniow wybranej klasy
	public List<Uczen> studentList(String oznaczenie) {

		List<Uczen> listaUczniow;
		Klasa klasa = new Klasa();

		klasa = (Klasa) entityManager
				.createQuery(
						"SELECT k FROM Klasa k WHERE k.oznaczenie LIKE :ozn")
				.setParameter("ozn", oznaczenie).getResultList().get(0);

		listaUczniow = klasa.getListaUczniowKlasy();

		return listaUczniow;
	}

	// funkcja zwracajaca id wybranej klasy
	@SuppressWarnings("unchecked")
	public int getClassId(String oznaczenie) {
		Klasa klasa = new Klasa();

		klasa = (Klasa) entityManager
				.createQuery(
						"SELECT k FROM Klasa k WHERE k.oznaczenie LIKE :ozn")
				.setParameter("ozn", oznaczenie).getResultList().get(0);

		return klasa.getId();
	}

	// Funcja zwracajaca id wybranego przedmiotu

	public int findSubId(String name) {
		Integer id = null;

		@SuppressWarnings("unchecked")
		List<Przedmiot> listaPrzemiotow = entityManager
				.createQuery(
						"SELECT p FROM Przedmiot p WHERE p.nazwa LIKE :przedmiot")
				.setParameter("przedmiot", name).getResultList();
		id = listaPrzemiotow.get(0).getId();

		return id;
	}

	// funckcja dodajaca oceny do bazy danych
	public String upDate(String lista_uczniow, String lista_ocen,
			int id_Przedmiotu, int id_Klasy, List<Uczen> listaUczniowKlasy) {
		ArrayList<Uczen> listaUczniow = new ArrayList<Uczen>();
		ArrayList<Ocena> listaOcen = new ArrayList<Ocena>();
		List<Klasa> listaKlas = new ArrayList<Klasa>();
		List<Ocena> listaOcen1 = new ArrayList<Ocena>();

		String Dane[] = null;
		String Oceny[] = null;
		String Pom[] = null;
		Uczen ucz = new Uczen();
		String POM = "";

		@SuppressWarnings("unchecked")
		List<Przedmiot> listaPrzemiotow = entityManager
				.createQuery("SELECT p FROM Przedmiot p WHERE p.id LIKE :id")
				.setParameter("id", id_Przedmiotu).getResultList();
		Przedmiot przedmiot1 = listaPrzemiotow.get(0); // Wybrany przedmiot

		Klasa klasa = (Klasa) entityManager
				.createQuery("SELECT k FROM Klasa k WHERE k.id LIKE :id")
				.setParameter("id", id_Klasy).getResultList().get(0);

		POM = "ID KLASY =" + klasa.getId() + "  ozn" + klasa.getOznaczenie();

		Dane = lista_uczniow.split("\n");
		Oceny = lista_ocen.split("\n");

		Iterator<Uczen> it = listaUczniow.iterator();

		for (int i = 0; i < Dane.length; i++) {
			Pom = Dane[i].split(" ", 2);
			// POM += " Imie  " + Pom[0];
			ucz.setImie(Pom[0]);
			// POM += " Nazw " + Pom[1];
			ucz.setNazwisko(Pom[1]);
			listaUczniow.add(ucz);
			Pom = null;
		}

		String pom3 = "";

		// entityManager.getTransaction().begin();

		for (int k = 0; k < Oceny.length; k++) {
			Ocena oc = new Ocena();

			Uczen uczen = listaUczniowKlasy.get(k);

			List<Ocena> listaOcenPom = new ArrayList<Ocena>();
			listaOcenPom = uczen.getOcena();
			oc.setOceny(Oceny[k]); //
			oc.setKlasa(klasa);
			oc.setPrzedmiot(przedmiot1);
			oc.setUczen(uczen);

			listaOcen.add(oc);
			listaOcenPom.add(oc);
			POM = listaOcen.toString();

			uczen.setOcena(listaOcenPom);
			listaKlas = przedmiot1.getListaKlas();
			listaKlas.add(klasa);

			przedmiot1.setListaKlas(listaKlas);

			entityManager.getTransaction().begin();
			entityManager.persist(oc);
			entityManager.merge(uczen);
			entityManager.getTransaction().commit();

			// prz.setOceny(listaOcen);
			// entityManager.flush();

		}

		przedmiot1.setListaOcen(listaOcen);

		klasa.setListaOcenKlasy(listaOcen);
		entityManager.getTransaction().begin();
		entityManager.merge(przedmiot1);
		entityManager.merge(klasa);
		entityManager.getTransaction().commit();

		return POM;

	}

	@SuppressWarnings("unchecked")
	public List<Ocena> wyswietlListeOcen(long uczen_id) // Wyswietlanie listy
														// ocen dla ucznia
	{
		List<Ocena> listaOcen = new ArrayList<Ocena>();
		List<Ocena> listaWynikow = new ArrayList<Ocena>();
		listaOcen = entityManager.createQuery("SELECT o FROM Ocena o")
				.getResultList();

		Iterator<Ocena> it = listaOcen.iterator();

		while (it.hasNext()) {
			Ocena ocena = it.next();

			if (ocena.getUczen().getId() == uczen_id) {
				listaWynikow.add(ocena);
			}
		}

		return listaWynikow;
	}

	@SuppressWarnings("unchecked")
	public List<Ocena> wyswietlListeOcen2(long uczen_id) // Wyswietlanie listy
															// ocen dla ucznia
	{
		List<Ocena> listaOcen = new ArrayList<Ocena>();
		List<Ocena> listaWynikow = new ArrayList<Ocena>();
		listaOcen = entityManager.createQuery("SELECT o FROM Ocena o")
				.getResultList();

		Iterator<Ocena> it = listaOcen.iterator();
		String pom = "";

		while (it.hasNext()) {
			Ocena ocena = it.next();

			if (ocena.getUczen().getId() == uczen_id) {
				listaWynikow.add(ocena);
			}
		}
		Collections.sort(listaWynikow);

		List<Ocena> listaWynikow2 = new ArrayList<Ocena>();
		Ocena ocenaPom = new Ocena();
		Przedmiot przedmiotPom = new Przedmiot();
		przedmiotPom.setId(9999);
		ocenaPom.setPrzedmiot(przedmiotPom);
		for (int i = 0; i < listaWynikow.size(); i++) {
			Ocena ocena = listaWynikow.get(i);
			if (ocena.getPrzedmiot().getId() == ocenaPom.getPrzedmiot().getId())
				continue;

			// if (ocena.getId_ocen() != ocenaPom.getId_ocen()) {
			for (int j = i + 1; j < listaWynikow.size(); j++) {
				Ocena ocena2 = listaWynikow.get(j);
				if (ocena.getPrzedmiot().getId() == ocena2.getPrzedmiot()
						.getId()) {
					pom = ocena.getOceny() + " " + ocena2.getOceny();
					ocena.setOceny(pom);
					ocenaPom = ocena;
				}

			}
			listaWynikow2.add(ocena);
			// }
		}

		return listaWynikow2;
	}

	public boolean passChange(long id, String pass, String newPass) {
		Uczen uczen = new Uczen();
		Nauczyciel nauczyciel = new Nauczyciel();
		starterDAO start = new starterDAO();

		if (start.check(id, pass) == 1) {
			uczen = (Uczen) entityManager
					.createQuery(
							"SELECT u FROM Uczen u WHERE u.id LIKE :id AND u.pass LIKE :pass")
					.setParameter("id", id).setParameter("pass", pass)
					.getResultList().get(0);

			uczen.setPass(newPass);
			entityManager.getTransaction().begin();
			entityManager.merge(uczen);
			entityManager.getTransaction().commit();

			return true;

		} else if (start.check(id, pass) == 2) {
			nauczyciel = (Nauczyciel) entityManager
					.createQuery(
							"SELECT n FROM Nauczyciel n WHERE n.id LIKE :id AND n.pass LIKE :pass")
					.setParameter("id", id).setParameter("pass", pass)
					.getResultList().get(0);

			nauczyciel.setPass(newPass);
			entityManager.getTransaction().begin();
			entityManager.merge(nauczyciel);
			entityManager.getTransaction().commit();
			return true;
		}

		return false;
	}

}
