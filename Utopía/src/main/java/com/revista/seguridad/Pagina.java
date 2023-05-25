package com.revista.seguridad;
import java.sql.PreparedStatement;
import com.revista.datos.*;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Pagina {
	private String nombre;
	private String path;
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String mostrarMenu(String nperfil) {
	    String menu = "";
	    String sql = "SELECT rol.ci_us, rol.rol_us, rol.pagina_us, rol.descripcion, us.foto_us, us.nombre_us FROM tb_rol rol, tb_usuario us "
	    		+ "WHERE us.ci_us = rol.ci_us AND us.correo_us = ?;";
	    Conexion con = new Conexion();
	    ResultSet rs = null;
	    try {
	    	PreparedStatement stmt = con.getConexion().prepareStatement(sql);
	        stmt.setString(1, nperfil);
	        rs = stmt.executeQuery();
	        menu+="<div class=\"listar\">"
				      +"<div>"
				      + "<ul>";
	        while (rs.next()) {
				   menu+= "<li><a href=" + rs.getString(3) + ">" + rs.getString(4) + "</a></li>"
				   +"<img alt=\""+rs.getString(6)+"\" src=\"img/"+rs.getString(5)+"\"  width=\"90\" height=\"100\">";
	        }
	        menu+= "</ul>"
	        	+"</div>"
		    +"</div>";
	        stmt.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.print(menu);
	    } 
	    return menu;
	}
	
	public Pagina() {
		this.nombre="";
		this.path="";
	}
}
