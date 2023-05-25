<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.InputStream" import="com.revista.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

<title>Utopía</title>
</head>
<body>

<%
int id = Integer.parseInt(request.getParameter("id"));
String titulo = request.getParameter("titulo");
String fecha = request.getParameter("fecha");
String foto = request.getParameter("imageFile");
Eventos ev = new Eventos();

boolean resultado = ev.eventoInsertar(id, titulo, fecha, foto);

if(resultado) { 
	response.sendRedirect("administrarEventos.jsp");
} else { 
	%>
	<jsp:forward page="administrarEventos.jsp">
	<jsp:param name="mensaje" value="Error.<br>Vuelva a intentarlo."/>
	</jsp:forward>
	<%
}

%>

</body>
</html>