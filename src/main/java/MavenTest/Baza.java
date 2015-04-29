package MavenTest;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Baza {
	
	public int sum(int a){return a*a;}

	public void start() {

		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("manager");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		 
//	
//
//		Uczen uczen = new Uczen();
//		Uczen uczen1=new Uczen("Janek","Nowak","Janowa 13","5");
//		
//		Nauczyciel nauczyciel = new Nauczyciel();
//		
//		Przedmiot przedmiot = new Przedmiot();
//		Przedmiot przedmiot1 = new Przedmiot();
//		
//		Ocena ocena = new Ocena();
//		Ocena ocena1 = new Ocena();
//		
//		List<Przedmiot> przedmioty = new ArrayList<Przedmiot>();		
//		List<Uczen>	uczniowie = new ArrayList<Uczen>();
//		List<Ocena>	oceny = new ArrayList<Ocena>();
//		
//		uczen.setAdres("Korchów Pierwszy 155");
//		uczen.setImie("Jaros³aw");
//		uczen.setNazwisko("Padjasek");
//		uczen.setKlasa("IIIa");
//
//		
//		
//		
//		 
//		
//		przedmiot1.setNazwa("Matematyka");
//		
//
//
//		przedmiot.setNazwa("Infa");
//		
//
//		
//		
//		przedmioty.add(przedmiot1);
//		przedmioty.add(przedmiot);
//		
//		
//		uczniowie.add(uczen);
//		uczniowie.add(uczen1);
//		
//		
//		
//		
//		nauczyciel.setImie("Jan");
//		nauczyciel.setNazwisko("Nowak");
//		nauczyciel.setAdres("Rzeszow konopnicka 13");
//		
//		ocena.setOceny("5 4 3");
//		ocena1.setOceny("0 0 0");
//		
//		oceny.add(ocena);
//		oceny.add(ocena1);
//		
//		
//		uczen.setOceny(oceny);
//		przedmiot1.setUczniowie(uczniowie);
//		przedmiot.setUczniowie(uczniowie);
//		przedmiot1.setOceny(oceny);
//		nauczyciel.setPrzedmioty(przedmioty);
//		uczen1.setPrzedmioty(przedmioty);
//		uczen.setPrzedmioty(przedmioty);
//		
//		
//		
//		
//		entityManager.getTransaction().begin();
//		entityManager.persist(ocena);
//		entityManager.persist(ocena1);
//		entityManager.persist(uczen);
//		entityManager.persist(uczen1);
//		entityManager.persist(przedmiot);
//		entityManager.persist(przedmiot1);
//		entityManager.persist(nauczyciel);
//	
//
//		entityManager.getTransaction().commit();
		
		
		entityManager.close();
		entityManagerFactory.close();

	}

}
