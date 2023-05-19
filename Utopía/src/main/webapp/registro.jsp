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
          </nav>
          <nav>
              <a class="enlaces" href="login.jsp"> <img src="img/user.png" class="imagen2" alt="icono de inicio"> </a>
          </nav>
  </header>
  <form action="respuesta.jsp" method="post" class="resgistro_form"> 
			<table border="0">
				<tr><td>Cedula: </td> <td> <input type="text" id="input" name="txtCedula" maxlenght="10" required placeholder="Cedula"/> </td></tr>
				<tr><td>Nombre: </td><td> <input type="text" name="txtNombre" required placeholder="Nombre de usuario"/></td></tr>
				<tr><td>Correo: </td> <td> <input type="text" id="input" name="txtCorreo" required/> </td></tr>
				<tr><td>Carrera: </td> <td> <input type="text" id="input" name="txtCarrera" maxlenght="30" required/> </td></tr>
				<tr><td>Celular: </td> <td> <input type="text" id="input" name="txtCelular" maxlenght="10" required/> </td></tr>
				<tr><td>Mes y año de nacimiento: </td><td><input type="date" name="fecha" id="fecha" required/> </td></tr>
				<tr><td>Foto: </td><td><input type="file" name="fileFoto" accept=".jpg, .jpeg, .png" /> </td></tr>
				<tr><td>Hoja de vida: </td><td><input type="file" name="fileHojaVida" accept=".pdf" size="5000000"/> </td></tr>
				<!-- En size se coloca el tamaño de bytes 1MB = 1 * 1024 * 1024 bytes -->
				<tr>
				  <td><input type="submit" /> </td>
				  <td> <input type="reset" /></td>
				</tr>
			</table>
			<a href="index.jsp"> Regresar </a>
	</form>
</body>
</html>