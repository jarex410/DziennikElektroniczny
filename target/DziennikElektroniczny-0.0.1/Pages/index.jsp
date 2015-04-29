<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>First JSP</title>
</head>

<body> 
	<jsp:useBean id="user" class="Encje.Uczen" scope="session"></jsp:useBean>
	
LOGOWANIE
  <form method="post" action="waliduj.jsp ">
        login: <br />
        <input type="text" name="id" /><br /> 
        HASLO: <br />
        <input type="text" name="pass" /><br /> 
        <input type="submit" value="zaloguj">
    </form>
kpka]
     <jsp:useBean id="start"
       class="MavenTest.starterDAO" scope="session"></jsp:useBean>



         <br />


         KUPA

</body>
</html>