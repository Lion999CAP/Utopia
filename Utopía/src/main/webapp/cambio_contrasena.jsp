<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.revista.seguridad.*"%>
<!DOCTYPE html>

<%
    // Obtén los valores del formulario
    Usuario user= new Usuario();
    String login = request.getParameter("login");
    String claveActual = request.getParameter("claveActual");
    String nuevaContrasena = request.getParameter("nuevaContrasena");

    // Llamada a la función cambiarContrasena
    boolean cambioExitoso = user.cambiarContrasena(login, claveActual, nuevaContrasena);

    if (cambioExitoso) {
    	response.sendRedirect("menu.jsp");
    } else {
        out.println("No se pudo cambiar la contraseña");
    }
%>

<html>
<head>
<meta charset="UTF-8">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<link href="css/contacto.css" rel="stylesheet" type="text/css">
<title> EATTOFUU </title>
</head>
<body>
    <h1>Cambio de contraseña</h1>
    <form method="post" action="cambio_contrasena.jsp">
        Login: <input type="text" name="login" required><br>
        Contraseña actual: <input type="password" name="claveActual" required><br>
        Nueva contraseña: <input type="password" name="nuevaContrasena" required><br>
        <input type="submit" value="Cambiar contraseña">
    </form>
</body>
</html>