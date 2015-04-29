<%@page import="Encje.Przedmiot"%>
<%@page import="Encje.Nauczyciel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>First JSP</title>
</head>

<body>

	PO WALIDACJI
	<br />

	<jsp:useBean id="user" class="Encje.Uczen" scope="session"></jsp:useBean>

	<jsp:setProperty property="*" name="user" />

	<jsp:useBean id="check" class="MavenTest.starterDAO" scope="session"></jsp:useBean>


	<%
		if (check.check(user.getId(), user.getPass()) == 1) {
			
		/* 			java.util.List<Przedmiot> listaPrzemiotow = check.classSubjectList(user);
			
			Iterator<Przedmiot> it = listaPrzemiotow.iterator();
			String pom="";
			while (it.hasNext())

			{

				pom += "<option>" + it.next().getNazwa()
						+ "</option>" + " ";

			}
			
			out.print("Wybierz przedmiot:  <form method=\"post\" action=\"Zajecia.jsp \">"
					+ "<select name=\"Lista_przedmiotow\"  size=\"10\">"
					+ pom
					+ " </select> "
					);
			
			
			 */
			
			out.print("<form method=\"post\" action=\"Przedmioty.jsp \">"
					+ "<input type=\"submit\" value=\"Wyświetl swoje przedmioty\">");
		}

		else if (check.check(user.getId(), user.getPass()) == 2) {

			String pom = "";
			String pom2 = "";
			int i = 0;
			Nauczyciel na = new Nauczyciel();
			na = check.subjectList(user.getId());

			java.util.List<Przedmiot> listaPrzemiotow = na.getListaPrzedmiotow();
			Iterator<Przedmiot> it = listaPrzemiotow.iterator();

			while (it.hasNext())

			{

				pom += "<option>" + it.next().getNazwa()
						+ "</option>" + " ";

			}

			out.print("Wybierz przedmiot:  <form method=\"post\" action=\"Oceny.jsp \">"
					+ "<select name=\"Lista_zajec\"  size=\"10\">"
					+ pom
					+ " </select> "
					);

			out.print("Wybierz klase: "
					+ "<select name=\"Lista_klas\"  size=\"10\">"
					+ "<option>I</option><option>II</option><option>III</option><option>IV</option><option>V</option><option>VI</option>"
					+ " </select> "
					+ "<input type=\"submit\" value=\"Dodaj oceny dla wybranej klasy\"></form> ");


		}

		else
			out.print("Bład LOGOWANIA");
	%>
	<br />
	<br />





</body>
</html>