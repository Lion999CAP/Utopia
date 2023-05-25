package com.revista.seguridad;

import java.sql.ResultSet;

import com.revista.datos.Conexion;

public class Usuario {

	private String nombre;
	private String login;
	private String clave;
	private String newclave;
	private boolean aprobado;
	private String perfil;
	
	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getLogin() {
		return login;
	}


	public void setLogin(String login) {
		this.login = login;
	}


	public String getClave() {
		return clave;
	}


	public void setClave(String clave) {
		this.clave = clave;
	}


	public String getNewclave() {
		return newclave;
	}


	public void setNewclave(String newclave) {
		this.newclave = newclave;
	}


	public boolean verificarUsuario(String nlogin, String nclave)
	{
	boolean respuesta=false;
	String sentencia= "Select * from tb_usuario where correo_us='"+nlogin+"' and clave_us='"+nclave+"';";
	//System.out.print(sentencia);
	try
	{
		ResultSet rs;
		Conexion clsCon=new Conexion();
		rs=clsCon.Consulta(sentencia);
		if(rs.next())
		{
		respuesta=true;
		this.setLogin(nlogin);
		this.setClave(nclave);
		this.setPerfil(rs.getString(3));
		this.setNombre(rs.getString(2));
		}
		else
		{
		respuesta=false;
		rs.close();
		}
		}
		catch(Exception ex)
		{
		System.out.println( ex.getMessage());
		}
		return respuesta;
	}
	
	public boolean verificarAprobado(String n_login)
	{
	boolean respuesta=false;
	String sentencia= "SELECT aprobado FROM tb_postulante, tb_usuario WHERE tb_postulante.ci_us = tb_usuario.ci_us AND tb_usuario.correo_us='"+n_login+"';";
	//System.out.print(sentencia);
	try
	{
		ResultSet rs;
		Conexion clsCon=new Conexion();
		rs=clsCon.Consulta(sentencia);
		if(rs.next())
		{
		this.setAprobado(rs.getBoolean(1));
		respuesta = this.isAprobado();
		}
		else
		{
		respuesta=false;
		rs.close();
		}
		}
		catch(Exception ex)
		{
		System.out.println( ex.getMessage());
		}
		return respuesta;
	}
	
	public boolean cambiarContrasena(String nlogin, String nclave, String nuevaContrasena) {
	    boolean respuesta = false;
	    String sentencia = "SELECT * FROM tb_usuario WHERE correo_us='" + nlogin +"' AND clave_us='" + nclave + "';";
	    try {
	        ResultSet rs;
	        Conexion clsCon = new Conexion();
	        rs = clsCon.Consulta(sentencia);
	        if (rs.next()) {
	            // El usuario y la contraseña son válidos, procede a cambiar la contraseña
	            String actualizacion = "UPDATE tb_usuario SET clave_us = '" + nuevaContrasena + "' WHERE correo_us = '" + nlogin + "';";
	            clsCon.Ejecutar(actualizacion);
	            respuesta = true;
	        } else {
	            respuesta = false;
	            rs.close();
	        }
	    } catch (Exception ex) {
	        System.out.println(ex.getMessage());
	    }
	    return respuesta;
	}
	
	public boolean isAprobado() {
		return aprobado;
	}

	public void setAprobado(boolean aprobado) {
		this.aprobado = aprobado;
	}


	public String getPerfil() {
		return perfil;
	}


	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}
	
	public Usuario() {
		this.clave="";
		this.newclave="";
		this.login="";
		this.nombre="";
		this.perfil="";
		this.aprobado=false;
	}

}
