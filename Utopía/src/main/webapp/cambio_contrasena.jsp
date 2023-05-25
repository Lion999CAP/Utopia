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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

<title> EATTOFUU </title>
</head>
<body>

  <header id="header">
          <nav class="logo">
             <a class="enlaces" href="index.jsp"> <img src="img/uni.png" class="imagen2" alt="Logo de la universidad"> </a>
             <a class="enlaces" href="index.jsp"> <img src="img/logo.png" class="imagen1" alt="Logo del producto"> </a>
          </nav>
          <nav >
            <h2 class="titulo"> <a class="enlaces" href="menu.jsp"> Utopía </a> </h2> 
          </nav>
          <nav class="navengacion">
              <a class="enlaces" href="eventos.jsp">Eventos</a>
              <a class="enlaces" href="revista.jsp">Revista</a>
              <a class="enlaces" href="contactos.jsp">Contáctos</a>
              <details>
		  	    <summary>Perfil</summary> 
		  	    <ul>
		  	      <li> <a href="cerrarSesion.jsp"> Cerrar sesion</a> </li>
		  	      <li> <a href="cambio_contrasena.jsp"> Cambiar contraseña</a> </li>
		  	    </ul>
		  	  </details>
          </nav>
  </header>

    <h1>Cambio de contraseña</h1>
    <form method="post" action="cambio_contrasena.jsp">
        Login: <input type="text" name="login" required><br>
        Contraseña actual: <input type="password" name="claveActual" required><br>
        Nueva contraseña: <input type="password" name="nuevaContrasena" required><br>
        <input type="submit" value="Cambiar contraseña">
    </form>
</body>
</html>