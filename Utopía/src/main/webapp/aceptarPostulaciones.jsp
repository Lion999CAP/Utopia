<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.revista.seguridad.*"%>
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
              <a class="enlaces" href="login.jsp"> <img src="img/user.png" class="imagen2" alt="icono de inicio"> </a>
          </nav>
  </header>

<main>
<%-- Obtener el valor del parámetro "error" --%>
		    <% String errorMessage = request.getParameter("mensaje"); %>
		    <% if (errorMessage != null) { %>
		        <p style="color: red;"><%= errorMessage %></p>
		    <% } %>
<h1>Área de postulaciones entrantes</h1>

  <%
  Postulaciones ps= new Postulaciones();
  out.println(ps.consultarTodo());
  %>
  
</main>

<footer>
    <p>&copy; 2023 Leandro Lara</p> <a href="desarrollador.jsp"> Contáctame</a>
  </footer>

</body>
</html>