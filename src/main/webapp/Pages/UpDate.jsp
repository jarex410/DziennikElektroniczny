<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="start" class="MavenTest.starterDAO" scope="session"></jsp:useBean>
	<jsp:useBean id="pom2" class="MavenTest.pom" scope="session" />
		<jsp:useBean id="user" class="Encje.Uczen" scope="session"></jsp:useBean>
	UPDATE::

	<%
		int id_Przedmiotu;
		int id_Klasy;
		
			String listaUczniow= request.getParameter("Lista_Uczniow");
			String listaOcen = request.getParameter("Lista_Ocen");
			String Przedmiot =pom2.getPrzedmiot() ;
			String Klasa = pom2.getKlasa();
			
			
			id_Przedmiotu=start.findSubId(Przedmiot);
			id_Klasy=start.getClassId(Klasa);

			start.upDate(listaUczniow, listaOcen, id_Przedmiotu, id_Klasy, pom2.getListaUczniowKlasy());
	%>

	DODANO OCENY:  
	 <form method="post" action="waliduj.jsp ">
        <input type="submit" value="Dodaj nowe oceny">
    </form>
	 <form method="post" action="LogOut.jsp ">
        <input type="submit" value="Wyloguj">
    </form>

</body>
</html>