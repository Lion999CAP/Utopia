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
  
  <%-- Obtener el valor del parámetro "error" --%>
		    <% String errorMessage = request.getParameter("mensaje"); %>
		    <% if (errorMessage != null) { %>
		        <p style="color: red;"><%= errorMessage %></p>
		    <% } %>
  	
	<section class="h-100 bg-dark">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card card-registration my-4">
          <div class="row g-0">
            <div class="col-xl-6 d-none d-xl-block">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/img4.webp"
                alt="Sample photo" class="img-fluid"
                style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
            </div>
            <div class="col-xl-6">
              <div class="card-body p-md-5 text-black">
                <h3 class="mb-5 text-uppercase">Registro</h3>
                
			<form action="respuesta.jsp" method="post" class="resgistro_form"> 
                <div class="form-outline mb-4">
                  <input type="text" id="form3Example8" class="form-control form-control-lg" name="txtCedula"/>
                  <label class="form-label" for="form3Example8">Cedula:</label>
                </div>
                <div class="form-outline mb-4">
                  <input type="text" id="form3Example8" class="form-control form-control-lg" name="txtNombre"/>
                  <label class="form-label" for="form3Example8">Nombre:</label>
                </div>
                <div class="form-outline mb-4">
                  <input type="email" id="form3Example8" class="form-control form-control-lg" name="txtCorreo"/>
                  <label class="form-label" for="form3Example8">Email:</label>
                </div>
                <div class="form-outline mb-4">
                  <input type="text" id="form3Example9" class="form-control form-control-lg" name="txtCarrera"/>
                  <label class="form-label" for="form3Example9">Carrera:</label>
                </div>
                <div class="form-outline mb-4">
                  <input type="text" id="form3Example90" class="form-control form-control-lg" name="txtCelular"/>
                  <label class="form-label" for="form3Example90">Celular:</label>
                </div>
                <div class="form-outline mb-4">
                  <input type="date" id="form3Example99" class="form-control form-control-lg" name="fecha"/>
                  <label class="form-label" for="form3Example99">Fecha de nacimiento:</label>
                </div>
                <div class="form-outline mb-4">
                  <input type="file" id="form3Example97" class="form-control form-control-lg" name="fileFoto" accept=".jpg, .jpeg, .png"/>
                  <label class="form-label" for="form3Example97">Foto:</label>
                </div>
                
                <div class="form-outline mb-4">
                  <input type="file" id="form3Example97" class="form-control form-control-lg" name="fileHojaVida" accept=".pdf"/>
                  <label class="form-label" for="form3Example97">Hoja de vida:</label>
                </div>
                
                <div class="d-flex justify-content-end pt-3">
                	<input type="submit" class="btn btn-primary" value="Ingresar"/> 
					<input type="reset" class="btn btn-primary" value="Cancelar"/>
				</div>
			</form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>

