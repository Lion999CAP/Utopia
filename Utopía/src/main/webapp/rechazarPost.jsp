<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.revista.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
     String cod = request.getParameter("cod");
     Postulaciones sp = new Postulaciones();
     boolean f = sp.aceptarPostulacion(cod);
	 if(f==true){
		response.sendRedirect("menu.jsp");
	 }
%>

</body>
</html>