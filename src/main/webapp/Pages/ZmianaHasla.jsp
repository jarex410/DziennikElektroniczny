<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>First JSP</title>
</head>

<body> 
	
LOGOWANIE
  <form method="post" action="ZmianaHasla.jsp ">

        Nowe hasło: <br />
        <input type="password" name="newPass" /><br /> 
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
			
			out.print("Zmieniono hasło");
			session.invalidate();		
			out.print("	 <form method=\"post\" action=\"index.jsp \">"
				+	"<input type=\"submit\" value=\"Zaloguj ponownie\"></form>");
			pom.setLiczZmianaHasla(0);
			}
			
		else
			{out.print("Bład przy probie zmiany"
					+"	 <form method=\"post\" action=\"index.jsp \">"
					+	"<input type=\"submit\" value=\"Zaloguj ponownie\"></form>");
			pom.setLiczZmianaHasla(0);
			}
		

		//pom.setLiczZmianaHasla(0);
		}
		pom.setLiczZmianaHasla(1);
%>

         <br />


</body>
</html>