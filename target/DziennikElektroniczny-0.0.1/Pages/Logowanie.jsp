<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><html xmlns="http://www.w3.org/1999/xhtml">
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
        </ul>    	
    </div> <!-- end of templatemo_menu -->

</div> <!-- end of templatemo_menu_wrapper -->

<div id="templatemo_content">

     
  <form method="post" action="waliduj.jsp ">
        <p>Login:</p> <input type="text" name="id" /><br /> 
        <p>hasło:</p> <input type="password" name="pass" /><br /> 
        <input type="submit" value="zaloguj">
    </form>
                
        
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