<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.revista.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Utopía</title>
</head>
<body>

<%
Usuario usuario=new Usuario();
String nlogin=request.getParameter("usuario");
String nclave=request.getParameter("clave");
HttpSession sesion=request.getSession(); //Se crea la variable de sesión
boolean respuesta = usuario.verificarUsuario(nlogin,nclave);
boolean respuesta2 = usuario.verificarAprobado(nlogin);
if (respuesta){
	if(respuesta2){
		sesion.setAttribute("usuario", usuario.getNombre()); //Se añade atributos
		sesion.setAttribute("perfil", usuario.getPerfil()); //Se añade atributos
		response.sendRedirect("menu.jsp"); //Se redirecciona a una página específica
	}else{
		response.sendRedirect("postulaciones.jsp"); //Se redirecciona a una página específica
	}
}else{
	%>
	<jsp:forward page="login.jsp">
	<jsp:param name="error" value="Datos incorrectos.<br>Vuelva a intentarlo."/>
	</jsp:forward>
	<%
}
%>

</body>
</html>