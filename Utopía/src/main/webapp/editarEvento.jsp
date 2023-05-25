<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.revista.negocio.*"%>
<!DOCTYPE html>

	<%
  	String cod= request.getParameter("cod");
  	Eventos mp= new Eventos();
  	mp.ConsulEditarEvento(cod);
  	HttpSession sesion = request.getSession();
	sesion.setAttribute("id_act", cod);
  	%>

<html>
<head>
<meta charset="UTF-8">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

<title>Utopía</title>
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

  <main>
    <form class="form-inline" action="administrarEventos.jsp">
	  <div class="form-group mx-sm-3 mb-2">
	    <label for="id" class="sr-only">ID</label>
	    <input type="number" class="form-control" id="id" name="id" placeholder="ID" readonly>
	  </div>
	  <div class="form-group mx-sm-3 mb-2">
	    <label for="titulo" class="sr-only">Título</label>
	    <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Título">
	  </div>
	  <div class="form-group mx-sm-3 mb-2">
	    <label for="fecha" class="sr-only">Fecha</label>
	    <input type="date" class="form-control" id="fecha" name="fecha" placeholder="Fecha">
	  </div>
	  <div class="form-group mx-sm-3 mb-2">
	    <label for="imageFile" class="sr-only">Imagen</label>
	    <input type="file" class="form-control" id="imageFile" name="imageFile">
	  </div>
	  	<input type="submit" class="btn btn-primary" value="Actualizar"/> 
		<input type="reset" class="btn btn-primary" value="Cancelar"/>
    </form>
  </main>
  
  <footer>
    <p>&copy; 2023 Leandro Lara</p> <a href="desarrollador.jsp"> Contáctame</a>
  </footer>

</body>
</html>