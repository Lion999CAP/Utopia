<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
     <div id="login">
	        <h1>Inicio de Sesion</h1>
			    <form method="post" id="form_login" action="verificarLogin.jsp">
				  <div class="mb-3">
				    <label for="exampleInputEmail1" class="form-label">Email</label>
				    <input type="email" name="usuario" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
				  </div>
				  <div class="mb-3">
				    <label for="exampleInputPassword1" class="form-label">Contraseña:</label>
				    <input type="password" name="clave" class="form-control" id="exampleInputPassword1">
				  </div>
				  <input type="submit" class="btn btn-primary" value="Ingresar">
				  <a id="registrar" href="registro.jsp"> Registrarme </a>
				</form>
		</div>
  </main>
  
  <footer>
    <p>&copy; 2023 Leandro Lara</p> <a href="desarrollador.jsp"> Contáctame</a>
  </footer>
</body>
</html>