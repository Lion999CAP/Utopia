package com.revista.negocio;

import java.io.FileInputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.revista.datos.Conexion;

public class Revista {

	private String n_revista;
	private String rev_intro;
	private String rev_tema;
	private String rev_foto;
	
	public String getN_revista() {
		return n_revista;
	}

	public void setN_revista(String n_revista) {
		this.n_revista = n_revista;
	}

	public String getRev_intro() {
		return rev_intro;
	}

	public void setRev_intro(String rev_intro) {
		this.rev_intro = rev_intro;
	}

	public String getRev_tema() {
		return rev_tema;
	}

	public void setRev_tema(String rev_tema) {
		this.rev_tema = rev_tema;
	}

	public String getRev_foto() {
		return rev_foto;
	}

	public void setRev_foto(String rev_foto) {
		this.rev_foto = rev_foto;
	}

	public String consultarTodo(){
		String sql="SELECT * FROM tb_revista ORDER BY n_revista";
		Conexion con=new Conexion();
		String tabla="<table border=2><th>Numero</th><th>Tema</th><th>Introducción</th><th>Foto referencia</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
		while(rs.next()){
			tabla+="<tr><td>"+rs.getInt(1)+"</td>"
			+ "<td>"+rs.getString(3)+"</td>"
			+ "<td>"+rs.getString(2)+"</td>"
			+ "<td>"+rs.getString(4)+"</td>"
			//+ "<td> <a href= editarEvento.jsp?cod=" + rs.getInt(1) + "><pre style=\"text-align: center\">Modifcar</pre></a></td>"
			+ "<td> <a href= eliminarEvento.jsp?cod=" + rs.getInt(1) + " onclick=\"return confirmacion()\"><pre style=\"text-align: center\">Eliminar</pre></a></td>"
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
	
	public String mostrarRevistas() {
		String even="";
		String sql="SELECT * FROM tb_revista ORDER BY n_revista";
		Conexion con=new Conexion();
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next()) {
				even+="<div class=\"listar\">"
			      +"<div>"
			      +"<img alt=\""+rs.getString(3)+"\" src=\"img/"+rs.getString(4)+"\" width=\"500\" height=\"700\">"
			      +"</div>"
			      +"<div>"
			        +"<h3>Tematica: "+rs.getString(3)+"</h3>"
			        +"<h4>Introducción: "+rs.getString(2)+"</h4>"
			      +"</div>"
			    +"</div>";
				}
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.print(e.getMessage());
				//System.out.print(even);
				}
		return even;
	}
	
	public boolean eventoInsertar(int id, String intro, String tema, String foto) {
	    Conexion con = new Conexion();
	    PreparedStatement pr = null;
	    String sql = "INSERT INTO public.tb_revista(n_revista, rev_introduccion, rev_tematica, rev_foto) VALUES (?, ?, ?, ?);;";
	    FileInputStream fis = null;
	    try {
	        pr = con.getConexion().prepareStatement(sql);
	        pr.setInt(1, id);
	        pr.setString(2, intro);
	        pr.setString(3, tema);
	        pr.setString(4, foto);
	        int filasAfectadas = pr.executeUpdate();
	        return filasAfectadas > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.print(e.getMessage());
	        //System.out.print(sql);
	        return false;
	    } 
	}
	
	public boolean eventoEliminar(int id) {
		boolean f = false;
		Conexion con = new Conexion();
		String sql = "DELETE FROM tb_revista WHERE n_revista= " + id + " ;";
		try {
			con.Ejecutar(sql);
			f = true;
		}catch (Exception e) {
			f = false;
		}
		return f;
	}
	
	public Revista() {
		this.n_revista="";
		this.rev_foto="";
		this.rev_intro="";
		this.rev_tema="";
	}

}
