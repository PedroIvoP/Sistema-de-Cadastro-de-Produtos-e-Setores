package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BDConn {
	private Connection conn;
	
	public void conecta () {
		String driver = "com.mysql.cj.jdbc.Driver";
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		String url = "jdbc:mysql://localhost:3306/sys_pdv?useTimezone=true&serverTimezone=UTC";
		String user = "root";
		String pass = "";
		
		try {
			conn = DriverManager.getConnection(url, user, pass);
		} catch (SQLException e) {
			System.out.println("Erro: " + e);
		}
	}
	
	public void desconecta(){
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConn() {
		return this.conn;
	}
}
