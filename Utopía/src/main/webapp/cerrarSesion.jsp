<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Utopía</title>
</head>
<body>

<%
HttpSession sesionOk = request.getSession();
sesionOk.invalidate();
%>

<jsp:forward page="login.jsp">
<jsp:param name="cerrarSesion" value="Cerro sesion"/>
</jsp:forward>

</body>
</html>