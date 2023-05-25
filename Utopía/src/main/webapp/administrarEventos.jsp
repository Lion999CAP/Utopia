<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.revista.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

<title>Utopía</title>
</head>
<script type="text/javascript">
	function confirmacion(){
	  var respuesta = confirm("Desea eliminar el evento?");
	  if (respuesta == true){
		  return true;
	  }else{
		  return false;
	  }
	}
</script>
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
  
  <% String errorMessage = request.getParameter("mensaje"); %>
		    <% if (errorMessage != null) { %>
		        <p style="color: red;"><%= errorMessage %></p>
		    <% } %>
		    
	<%
	String usuario, perfil;
	HttpSession sesion = request.getSession();
	if (sesion.getAttribute("usuario") == null) {
		// Redireccionar a login.jsp si no se ha iniciado sesión
		response.sendRedirect("login.jsp?error=Debe registrarse en el sistema.");
	} else {
		usuario = (String) sesion.getAttribute("usuario");
		perfil = (String) sesion.getAttribute("perfil");
	}
	%>
	
    <h1>Eventos</h1>
    <h2>Añadir evento</h2>
	<a href="nuevoEvento.jsp"><button type="button" class="btn btn-secondary">Nuevo Evento</button></a>
    <h2>Eventos actuales:</h2>
    
	  <%
	    Eventos mp = new Eventos();
	    out.print(mp.consultarTodo());
	  %>
    
  </main>

  <footer>
    <p>&copy; 2023 Leandro Lara</p> <a href="desarrollador.jsp"> Contáctame</a>
  </footer>

</body>
</html>