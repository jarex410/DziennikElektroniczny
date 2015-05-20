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
			
        </ul>    	
    </div> <!-- end of templatemo_menu -->

</div> <!-- end of templatemo_menu_wrapper -->

<div id="templatemo_content">
	<jsp:useBean id="user" class="Encje.Uczen" scope="session"></jsp:useBean>
	
	<% session.invalidate(); %>
<h2>	Wylogowano!</2>
  

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