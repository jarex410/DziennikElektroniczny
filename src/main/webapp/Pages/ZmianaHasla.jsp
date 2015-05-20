<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
            <li><a href="index.jsp" class="current">Strona Główna</a></li>
            <li><a href="Logowanie.jsp">Dziennik Elektor</a></li>
			<li><a href="waliduj.jsp" class="last">Dodaj oceny</a></li>
			<li><a href="ZmianaHasla.jsp">Zmiana hasła</a></li>
			<li><a href="LogOut.jsp" class="last">Wyloguj</a></li>
			
        </ul>    	
    </div> <!-- end of templatemo_menu -->

</div> <!-- end of templatemo_menu_wrapper -->

<div id="templatemo_content">
  <form method="post" action="ZmianaHasla.jsp ">

        Nowe hasło: <br />
        <input type="password" name="newPass" /><br /> </br>
        <input type="submit" value="zmień">
    </form>
     <jsp:useBean id="start"
       class="MavenTest.starterDAO" scope="session"></jsp:useBean>
		<jsp:useBean id="user" class="Encje.Uczen" scope="session"></jsp:useBean>
		<jsp:useBean id="pom" class="MavenTest.pom" scope="session"></jsp:useBean>
			<jsp:setProperty property="*" name="pom" />
<%	
		
		if(pom.getLiczZmianaHasla()==1)
		{
		if(start.passChange(user.getId(), user.getPass(), pom.getNewPass())==true)
			{
			
			out.print("<h4>Zmieniono hasło </br> Zaloguj ponownie!<h4>");
			session.invalidate();		
			pom.setLiczZmianaHasla(0);
			}
			
		else
			{out.print("<h4>Bład przy probie zmiany! </h4>");
			pom.setLiczZmianaHasla(0);
			}
		

		//pom.setLiczZmianaHasla(0);
		}
		pom.setLiczZmianaHasla(1);
%>

        <div class="cleaner"></div>
    </div>

</div> <!-- end of templatemo_content -->
<div id="templatemo_content_bottom"></div>


        
    </div>
    
    <div class="cleaner_h40"></div>
    
    <center>
        Copyright © 2015 <a href="#">Jarosław Padjasek</a> | 
    </center>
    
</div> <!-- end of footer -->
</div> <!-- end of footer wrapper -->
</body>
</html>