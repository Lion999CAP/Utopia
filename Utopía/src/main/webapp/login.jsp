<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
             <a class="enlaces" href="index.jsp"> <img src="img/uni.jpg" class="imagen2" alt="Logo de la universidad"> </a>
             <a class="enlaces" href="index.jsp"> <img src="img/logo.png" class="imagen1" alt="Logo del producto"> </a>
          </nav>
          <nav >
            <a class="enlaces" href="index.jsp"> <h2 class="titulo"> Utopía </h2> </a> 
          </nav>
          <nav class="navengacion">
              <a class="enlaces" href="eventos.jsp">Eventos</a>
              <a class="enlaces" href="revista.jsp">Revista</a>
              <a class="enlaces" href="contactos.jsp">Contáctos</a>
              <a class="enlaces" href="login.jsp"> <img src="img/user.png" class="imagen2" alt="icono de inicio"> </a>
          </nav>
  </header>
  
  <main>
     <div id="login">
	        <h1>Inicio de Sesion</h1>
			    <form method="post" id="form_login">
			      <label for="username">Usuario:</label>
			      <input type="text" id="username" name="username" required placeholder="Nombre de usuario" size="30"><br><br>
			      <label for="password">Contraseña:</label>
			      <input type="password" id="password" maxlength="5" name="password" required placeholder="Contraseña" size="30"><br><br>
			      <input type="submit" value="Ingresar">
			        <a id="registrar" href="registro.jsp"> Registrarme </a>
			    </form>
		</div>
  </main>
  
  <footer>
    <p>&copy; 2023 Leandro Lara</p> <a href="desarrollador.jsp"> Contáctame</a>
  </footer>
</body>
</html>