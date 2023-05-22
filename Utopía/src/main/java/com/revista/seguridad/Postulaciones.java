package com.revista.seguridad;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.revista.datos.Conexion;

public class Postulaciones {

	private String ci;
	private String hVida;
	private boolean estado;
	
	public String getCi() {
		return ci;
	}

	public void setCi(String ci) {
		this.ci = ci;
	}

	public String gethVida() {
		return hVida;
	}

	public void sethVida(String hVida) {
		this.hVida = hVida;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public String consultarTodo()
	{
	String sql="SELECT * FROM tb_postulante ORDER BY aprobado";
	Conexion con=new Conexion();
	String tabla="<table border=2><th>CI</th><th>Hoja de vida</th><th>Estado</th>";
	ResultSet rs=null;
	rs=con.Consulta(sql);
	try {
	while(rs.next())
	{
	tabla+="<tr><td>"+rs.getString(1)+"</td>"
	+ "<td>"+rs.getString(3)+"</td>"
	+ "<td>"+rs.getBoolean(2)+"</td>"
	+ "<td> <a href= aceptarPost.jsp?cod='" + rs.getString(1) + "'><pre style=\"text-align: center\">Aceptar</pre></a></td>"
	+ "<td> <a href= rechazarPost.jsp?cod='" + rs.getString(1) + "'><pre style=\"text-align: center\">Rechazar</pre></a></td>"
	+ "</td></tr>";
	}
	} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	System.out.print(e.getMessage());
	}
	tabla+="</table>";
	return tabla;
	}
	
	public boolean aceptarPostulacion(String cod) {
	    boolean respuesta = false;
	    String sentencia = "SELECT * FROM tb_postulante WHERE ci_us='"+cod+"';";
	    try {
	        ResultSet rs;
	        Conexion clsCon = new Conexion();
	        rs = clsCon.Consulta(sentencia);
	        if (rs.next()) {
	            // El usuario y la contraseña son válidos, procede a cambiar la contraseña
	            String actualizacion = "UPDATE tb_postulante SET aprobado = " + true + " WHERE ci_us = '" + cod + "';";
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
	
	public boolean rechazarPostulacion(String cod) {
	    boolean respuesta = false;
	    String sentencia = "SELECT * FROM tb_postulante WHERE ci_us='"+cod+"';";
	    try {
	        ResultSet rs;
	        Conexion clsCon = new Conexion();
	        rs = clsCon.Consulta(sentencia);
	        if (rs.next()) {
	            // El usuario y la contraseña son válidos, procede a cambiar la contraseña
	            String actualizacion = "UPDATE tb_postulante SET aprobado = " + false + " WHERE ci_us = '" + cod + "';";
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
	
	public Postulaciones() {
		this.ci="";
		this.estado=false;
		this.hVida="";
	}

}
