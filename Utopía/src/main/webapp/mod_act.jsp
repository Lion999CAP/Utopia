<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.revista.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>

<%
Eventos even = new Eventos();
String id = request.getParameter("id");
String titulo = request.getParameter("titulo");
String fecha = request.getParameter("fecha");
String foto = request.getParameter("foto");
boolean act = even.eventoActualizar(id, titulo, fecha, foto);
if(act == true){
	response.sendRedirect("administrarEventos.jsp");
}else{
	response.sendRedirect("editarEvento.jsp");
}
%>

</body>
</html>