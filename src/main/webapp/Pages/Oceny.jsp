<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="DAO" class="MavenTest.starterDAO" scope="session"></jsp:useBean>
	
	<jsp:useBean id="pom2" class="MavenTest.pom" scope="session" />
	OCENY: Hello
	<%
		String Klasa = request.getParameter("Lista_klas");
		String Przedmiot = request.getParameter("Lista_zajec");
	//	request.setAttribute("Przedmiot", Przedmiot);
	//	request.setAttribute("Klasa", Klasa);
		
		pom2.setKlasa(Klasa);
		pom2.setPrzedmiot(Przedmiot);

		String pom = "";
		
		
		int i=0;
		Encje.Uczen ucz = new Encje.Uczen();
		java.util.List<Encje.Uczen> listaUczniow = DAO
				.studentList(Klasa);
		pom2.setListaUczniowKlasy(listaUczniow);
		java.util.Iterator<Encje.Uczen> it = listaUczniow.iterator();

		while (it.hasNext())

		{
			ucz=it.next();
			pom +=   ucz.getImie() + "   "+ ucz.getNazwisko()  + "\n";
			i++;
		}

		out.print("Lista uczniow klasy "+ Klasa + " <form method=\"post\" action=\"UpDate.jsp \">"
				+ "<textarea name=\"Lista_Uczniow\" rows=25 >"
				+ pom
				+ " </textarea> ");
		
		out.print("Dodajesz oceny z przedmiotu "+ Przedmiot 
				+ "<textarea name=\"Lista_Ocen\" rows="+25+" >"
				+ " </textarea> <br />" 
				+"<input type=\"submit\" value=\"Dodaj oceny dla wybranej klasy\"></form> ");
		
		out.print(" PRZEDMIOT =  " + Przedmiot);
		
	%>

</body>
</html>