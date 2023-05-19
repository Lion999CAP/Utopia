<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.revista.negocio.*"%>
<%@ page import="java.io.File" %>
<%@ page import="java.nio.file.Paths" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Utopía</title>
</head>
<body>

<%
String cedula = request.getParameter("txtCedula");
String nombre = request.getParameter("txtNombre");
String correo = request.getParameter("txtCorreo");
String carrera = request.getParameter("txtCarrera");
String celular = request.getParameter("txtCelular");
String fechaNacimiento = request.getParameter("fecha");

Part fotoPart = request.getPart("fileFoto");
Part hojaVidaPart = request.getPart("fileHojaVida");

Funciones funciones = new Funciones();
boolean exito = funciones.guardarDatosFormulario(cedula, nombre, correo, carrera, celular, fechaNacimiento, fotoPart, hojaVidaPart);

if (exito) {
	response.sendRedirect("index.jsp"); //Se redirecciona a una página específica
} else {
	%>
	<jsp:forward page="respuesta.jsp">
	<jsp:param name="error" value="Datos incorrectos.<br>Vuelva a intentarlo."/>
	</jsp:forward>
	<%
}
%>

</body>
</html>