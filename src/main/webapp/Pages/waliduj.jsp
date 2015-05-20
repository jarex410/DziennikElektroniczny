<%@page import="Encje.Ocena"%>
<%@page import="Encje.Przedmiot"%>
<%@page import="Encje.Nauczyciel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Dziennik Elektroniczny</title>

<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="templatemo_site_title_bar_wrapper">
	<div id="templatemo_site_title_bar">
    	<div id="site_title">
            <h1><a href="#">

                        <h1>Szkoła Podstawowa </h1>
            	<span>w Korchowie Pierwszym</span>
            
            </a></h1>
        </div>
        
    
    </div> <!-- end of templatemo_site_title_bar -->
</div> <!-- end of templatemo_site_title_bar_wrapper -->

<div id="templatemo_menu_wrapper">

	<div id="templatemo_menu">
        <ul>
            <li><a href="index.jsp" class="current">Str. Główna</a></li>
            <li><a href="Logowanie.jsp">Dziennik Ele.</a></li>
            <li><a href="ZmianaHasla.jsp">Zmiana hasła</a></li>
			<li><a href="LogOut.jsp" class="last">Wyloguj</a></li>
        </ul>    	
    </div> <!-- end of templatemo_menu -->

</div> <!-- end of templatemo_menu_wrapper -->

<div id="templatemo_content">

    
    	<div class="section_w600 margin_r_40">
        
	<jsp:useBean id="user" class="Encje.Uczen" scope="session"></jsp:useBean>

	<jsp:setProperty property="*" name="user" />

	<jsp:useBean id="check" class="MavenTest.starterDAO" scope="session"></jsp:useBean>

	<%
		long id = user.getId();
		String pass = user.getPass();

		if (check.check(id, pass) == 1) {
			java.util.List<Ocena> listaOcen = check.wyswietlListeOcen2(id);
			out.println("<h1> Witaj "
					+  check.getStudentName(id) + "!</h1>");
			Iterator<Ocena> it = listaOcen.iterator();
			String pom = "<table><td>Przedmiot</td>  <td>Ocena</td> <br/></br>";
			Ocena ocena = new Ocena();

			while (it.hasNext()) {
				ocena = it.next();
				pom += "<tr><td>" + ocena.getPrzedmiot().getNazwa()
						+ "</td><td>" + ocena.getOceny() + "</td></tr> ";
			}
			pom += "</table>";
			out.print(pom);
		}

		else if (check.check(id, pass) == 2) {
			out.println("<h1> Witaj "
					+  check.getTeacherName(id)
					+ "!</h1>  <br/>");

			String pom = "";
			String pom2 = "";
			int j = 0;
			int i = 0;
			Nauczyciel na = new Nauczyciel();
			na = check.subjectList(id);

			java.util.List<Przedmiot> listaPrzemiotow = na
					.getListaPrzedmiotow();
			Iterator<Przedmiot> it = listaPrzemiotow.iterator();

			while (it.hasNext())

			{
				if (j == 0) {
					pom += "<option selected>" + it.next().getNazwa()
							+ "</option>" + " ";
					j = 1;
				} else
					pom += "<option>" + it.next().getNazwa() + "</option>"
							+ " ";
			}

			out.print("Wybierz przedmiot oraz klase: <form method=\"post\" action=\"Oceny.jsp \">"
					+ "<select name=\"Lista_zajec\"  size=\"10\">"
					+ pom
					+ " </select> ");

			out.print(" "
					+ "<select name=\"Lista_klas\"  size=\"10\">"
					+ "<option selected>I</option><option>II</option><option>III</option><option>IV</option><option>V</option><option>VI</option>"
					+ " </select> <br/></br>"
					+ "<input type=\"submit\" value=\"Dodaj oceny dla wybranej klasy\"></form> ");

		}

		else
			out.print("Bład LOGOWANIA");
	%>
           
        
        <div class="cleaner"></div>
    </div>

</div> <!-- end of templatemo_content -->
<div id="templatemo_content_bottom"></div>

    <div class="section_w240">
       
        
    </div>
    
    <div class="cleaner_h40"></div>
    
    <center>
        Copyright © 2015 <a href="#">Jarosław Padjasek</a> | 
    </center>
    
</div> <!-- end of footer -->
</div> <!-- end of footer wrapper -->
</body>
</html>