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
            <li><a href="Logowanie.jsp">Dziennik Elek.</a></li>
            <li><a href="ZmianaHasla.jsp">Zmiana hasła</a></li>
        </ul>    	
    </div> <!-- end of templatemo_menu -->

</div> <!-- end of templatemo_menu_wrapper -->

<div id="templatemo_content">


    
    <div class="section_w940" >
	<jsp:useBean id="DAO" class="MavenTest.starterDAO" scope="session"></jsp:useBean>
	
	<jsp:useBean id="pom2" class="MavenTest.pom" scope="session" />

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

		out.print("Lista uczniow klasy    "+ Klasa + "</br> Przedmiot    " + Przedmiot+ " <form method=\"post\" action=\"UpDate.jsp \">"
				+ "<textarea readonly name=\"Lista_Uczniow\" rows=25  cols=30>"
				+ pom
				+ " </textarea> ");
		
		out.print(
				 "<textarea name=\"Lista_Ocen\" rows="+25+" >"
				+ " </textarea> <br />" 
				+"<input type=\"submit\" value=\"Dodaj oceny dla wybranej klasy\"></form> ");
		
		
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