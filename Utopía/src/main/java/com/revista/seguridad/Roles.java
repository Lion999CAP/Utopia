package com.revista.seguridad;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.revista.datos.Conexion;

public class Roles {

	private String ci;
	private String rol;
	private String path;
	
	public String getCi() {
		return ci;
	}

	public void setCi(String ci) {
		this.ci = ci;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String consultarTodo() {
		String sql="Select nombre_us,  us.ci_us, rol_us FROM tb_usuario us, tb_postulante pos, tb_rol rol WHERE us.ci_us = rol.ci_us AND pos.aprobado=true AND rol.ci_us != '0123456789'; ";
		Conexion con=new Conexion();
		String tabla="<table border=2><th>Nombre</th><th>Cedula</th><th>Rol actual</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
		while(rs.next())
		{
		tabla+="<tr><td>"+rs.getString(1)+"</td>"
		+ "<td>"+rs.getString(2)+"</td>"
		+ "<td>"+rs.getString(3)+"</td>"
		+ "<td> <a href= mod_rol.jsp?cod=" + rs.getString(2) + "><pre style=\"text-align: center\">Cambiar rol</pre></a></td>"
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
	
	public boolean modificarRol(Roles mp, String cod) {
		boolean agregado = false;
		Conexion con=new Conexion();
		String sql = "UPDATE public.tb_rol	SET rol_us=? WHERE ci_us= '"+cod+";";
		try {
			con.Ejecutar(sql);
			agregado = true;
		} catch (Exception e) {
			agregado = false;
		}
		return agregado;
	}
	
	public Roles() {
		this.ci="";
		this.path="";
		this.rol="";
	}

}
