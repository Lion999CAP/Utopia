<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<title>Utopía</title>
</head>
<body>
  <header id="header">
          <nav class="logo">
             <a class="enlaces" href="index.jsp"> <img src="img/uni.png" class="imagen2" alt="Logo de la universidad"> </a>
             <a class="enlaces" href="index.jsp"> <img src="img/logo.png" class="imagen1" alt="Logo del producto"> </a>
          </nav>
          <nav >
            <h2 class="titulo"> <a class="enlaces" href="index.jsp"> Utopía </a> </h2> 
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

<main>
  <h1>Menu </h1>
  <a class="enlaces" href="aceptarPostulaciones.jsp">Postulantes</a>
</main>

<footer>
    <p>&copy; 2023 Leandro Lara</p> <a href="desarrollador.jsp"> Contáctame</a>
  </footer>
</body>
</html>