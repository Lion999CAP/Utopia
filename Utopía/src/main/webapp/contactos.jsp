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
              <a class="enlaces" href="index.jsp">Inicio</a>
              <a class="enlaces" href="eventos.jsp">Eventos</a>
              <a class="enlaces" href="revista.jsp">Revista</a>
              <a class="enlaces" href="login.jsp"> <img src="img/user.png" class="imagen2" alt="icono de inicio"> </a>
          </nav>
  </header>
  <h1>Contáctos</h1>
	<form action="submit-form.php" method="post">
		<label for="name">Nombre:</label>
		<input type="text" id="name" name="name" required><br><br>
		
		<label for="email">Email:</label>
		<input type="email" id="email" name="email" required><br><br>
		
		<label for="subject">Tema:</label>
		<input type="text" id="subject" name="subject" required><br><br>
		
		<label for="message">Mensaje:</label>
		<textarea id="message" name="message" required></textarea><br><br>
		
		<input type="submit" value="Submit">
	</form>
 
  <footer>
    <p>&copy; 2023 Leandro Lara</p> <a href="desarrollador.jsp"> Contáctame</a>
  </footer>
</body>
</html>