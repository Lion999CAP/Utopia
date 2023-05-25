package com.revista.negocio;

import java.io.File;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.revista.datos.Conexion;

public class Eventos {

	private int id_act;
	private String act_titulo ;
	private String act_fecha;
	private String act_foto;

	public int getId_act() {
		return id_act;
	}

	public void setId_act(int id_act) {
		this.id_act = id_act;
	}

	public String getAct_titulo() {
		return act_titulo;
	}

	public void setAct_titulo(String act_titulo) {
		this.act_titulo = act_titulo;
	}

	public String getAct_fecha() {
		return act_fecha;
	}

	public void setAct_fecha(String act_fecha) {
		this.act_fecha = act_fecha;
	}

	public String getAct_foto() {
		return act_foto;
	}

	public void setAct_foto(String act_foto) {
		this.act_foto = act_foto;
	}

	public String consultarTodo(){
		String sql="SELECT * FROM tb_actividades ORDER BY id_act";
		Conexion con=new Conexion();
		String tabla="<table border=2><th>ID</th><th>Titulo</th><th>Fecha</th><th>Nombre foto</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
		while(rs.next()){
			tabla+="<tr><td>"+rs.getInt(1)+"</td>"
			+ "<td>"+rs.getString(2)+"</td>"
			+ "<td>"+rs.getString(3)+"</td>"
			+ "<td>"+rs.getString(4)+"</td>"
			+ "<td> <a href= editarEvento.jsp?cod=" + rs.getInt(1) + "><pre style=\"text-align: center\">Modifcar</pre></a></td>"
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
	
	public String mostrarEventos() {
		String even="";
		String sql="SELECT * FROM tb_actividades ORDER BY id_act";
		Conexion con=new Conexion();
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next()) {
				even+="<div class=\"listar\">"
			      +"<div>"
			      +"<img alt=\""+rs.getString(2)+"\" src=\"img/"+rs.getString(4)+"\" width=\"500\" height=\"700\">"
			      +"</div>"
			      +"<div>"
			        +"<h3>Actividad: "+rs.getString(2)+"</h3>"
			        +"<h4>Fecha prevista: "+rs.getString(3)+"</h4>"
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
	
	public boolean eventoInsertar(int id, String titulo, String fecha, String foto) {
	    Conexion con = new Conexion();
	    PreparedStatement pr = null;
	    String sql = "INSERT INTO tb_actividades (id_act, act_titulo, act_fecha, act_foto) VALUES (?, ?, ?, ?);";
	    FileInputStream fis = null;
	    try {
	        pr = con.getConexion().prepareStatement(sql);
	        pr.setInt(1, id);
	        pr.setString(2, titulo);
	        pr.setString(3, fecha);
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
		String sql = "DELETE FROM tb_actividades WHERE id_act= " + id + " ;";
		try {
			con.Ejecutar(sql);
			f = true;
		}catch (Exception e) {
			f = false;
		}
		return f;
	}
	
	public void ConsulEditarEvento (String cod) {
		Conexion obj=new Conexion();
		ResultSet rs = null;
		String sql = "SELECT * FROM tb_actividades WHERE id_act = " +cod+";";
		rs = obj.Consulta(sql);
		try {
			while(rs.next()){
				setId_act(Integer.parseInt(cod));
				setAct_titulo(rs.getString(2));
				setAct_fecha(rs.getString(3));
				setAct_foto(rs.getString(4));
			}
		}catch (SQLException e) {
			 System.out.print(e.getMessage());
		     System.out.print(sql);
		}
	}
	
	public boolean eventoActualizar(Eventos mp) {
		PreparedStatement pr = null;
		Conexion con=new Conexion();
		String sql = "UPDATE tb_actividades SET act_titulo=?, act_fecha=?, act_foto=?	WHERE id_pr=" + mp.getId_act() + ";";
		System.out.print(sql);
		try {
			pr = con.getConexion().prepareStatement(sql);
			pr.setString(2, mp.getAct_titulo());
			pr.setString(3, mp.getAct_fecha());
			pr.setString(4, mp.getAct_foto());
			int filasAfectadas = pr.executeUpdate();
	        return filasAfectadas > 0; // Retorna true si se insertaron filas, false si no se insertaron filas.
		} catch (Exception e) {
			System.out.print(e.getMessage());
			System.out.print(sql);
	        return false; // Retorna false en caso de excepción o error.
		}
	}
	
	public Eventos() {
		this.act_fecha="";
		this.act_foto="";
		this.act_titulo="";
		this.id_act=0;
	}

}
