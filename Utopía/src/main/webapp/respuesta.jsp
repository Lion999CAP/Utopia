<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.revista.negocio.*"%>
<%@ page import="java.io.File" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.io.InputStream" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Utopía</title>
</head>
<body>

<%-- Código para validar y procesar el formulario de registro --%>
<%
    Funciones mp = new Funciones();
    // Validar el correo electrónico utilizando la expresión regular



        // Procesar el formulario y guardar los datos del usuario
		String cedula = request.getParameter("txtCedula");
		String nombre = request.getParameter("txtNombre");
		String correo = request.getParameter("txtCorreo");
		String carrera = request.getParameter("txtCarrera");
		String celular = request.getParameter("txtCelular");
		String fechaParametro = request.getParameter("fecha");
		String foto = request.getParameter("fileFoto");
		String hojaVida= request.getParameter("fileHojaVida");
		Funciones funciones = new Funciones();
		boolean exito = funciones.guardarDatosUser(cedula, nombre, correo, carrera, celular, fechaParametro, foto);
			
		boolean exito2 = funciones.guardarDatosPost(cedula, hojaVida);
		
		if (exito) {
			%>
			<jsp:forward page="login.jsp">
			<jsp:param name="mensaje" value="Ingreso exitoso.<br>Su usuario es: <%= funciones.getCorreo() %> y contraseña: 123456."/>
			</jsp:forward>
			<%
		} else {
			%>
			<jsp:forward page="registro.jsp">
			<jsp:param name="mensaje" value="Datos incorrectos.<br>Vuelva a intentarlo."/>
			</jsp:forward>
			<%
		}
		
%>
</body>
</html>