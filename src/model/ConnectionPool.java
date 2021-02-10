package model;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

public class ConnectionPool {

	
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getcon() {
		
		
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/oracle");

			con = ds.getConnection();

		} catch (Exception e) {
			
			e.printStackTrace();
		}

	}
	
}
