<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.revista.negocio.*"%>
<%@ page import="java.io.OutputStream" %>

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
              <a class="enlaces" href="index.jsp">Inicio</a>
              <a class="enlaces" href="revista.jsp">Revista</a>
              <a class="enlaces" href="contactos.jsp">Contáctos</a>
              <a class="enlaces" href="login.jsp"> <img src="img/user.png" class="imagen2" alt="icono de inicio"> </a>
          </nav>
  </header>
  <h1>Eventos</h1>
  <main>
    <div>
      <div>
        <%
		int imagenId = 1; // ID de la imagen que deseas obtener
		Funciones funciones = new Funciones();
		byte[] imageData = funciones.getImageData(imagenId);
		
		if (imageData != null) {
		    response.setContentType("image/jpeg"); // Establece el tipo de contenido de la respuesta como una imagen JPEG
		    OutputStream outputStream = response.getOutputStream();
		    outputStream.write(imageData);
		    outputStream.close();
		} else {
		    out.println("No se encontró la imagen en la base de datos o ha ocurrido un error.");
		}
		%>
      </div>
      
      <div>
      
      </div>
    </div>
    
    <div>
      <div>
        <!-- img -->
      </div>
      
      <div>
      <!-- Actividades -->
      </div>
    </div>
    
    <div>
      <div>
        <!-- img -->
      </div>
      
      <div>
      <!-- Actividades -->
      </div>
    </div>
  </main>
  
  <footer>
    <p>&copy; 2023 Leandro Lara</p> <a href="desarrollador.jsp"> Contáctame</a>
  </footer>
</body>
</html>