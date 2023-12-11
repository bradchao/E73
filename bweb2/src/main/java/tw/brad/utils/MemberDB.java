package tw.brad.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class MemberDB {
	private static final String USER = "root";	
	private static final String PASSWD = "root";
	private static final String URL = "jdbc:mysql://127.0.0.1/brad";
	private static final String SQL_QUERY = "SELECT * FROM member";
	private static final String SQL_INSERT = 
		"INSERT INTO member (account,passwd,cname) VALUES (?,?,?)";
	
	private Connection conn;
	private ResultSet rs;
	String[] fieldNames;
	
	public MemberDB() throws Exception {
		Properties prop = new Properties();
		prop.put("user", USER);
		prop.put("password", PASSWD);
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(URL, prop);
		
	}
	
	public int addNew(String account, String passwd, String cname) 
		throws SQLException {
		PreparedStatement pstmt = conn.prepareStatement(SQL_INSERT);
		pstmt.setString(1, account);
		pstmt.setString(2, BCrypt.hashpw(passwd, BCrypt.gensalt()));
		pstmt.setString(3, cname);
		
		return pstmt.executeUpdate();
	}
	
	public void queryDB() throws SQLException{
		queryDB(SQL_QUERY);
	}
	public void queryDB(String sql) throws SQLException{
		Statement stmt = conn.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_UPDATABLE);
		rs = stmt.executeQuery(sql);
		
		ResultSetMetaData rsmd = rs.getMetaData();
		fieldNames = new String[rsmd.getColumnCount()];
		for (int i=0; i<fieldNames.length; i++) {
			fieldNames[i] = rsmd.getColumnName(i+1);
			//System.out.println(fieldNames[i]);
		}
	}
	public int getRows() {
		try {
			rs.last();
			return rs.getRow();
		}catch(Exception e) {
			return 0;
		}
	}
	public int getCols() {
		return fieldNames.length;
	}
	
	// row => 1-base; col => 1-base
	public String getData(int row, int col) {
		try {
			rs.absolute(row);
			return rs.getString(fieldNames[col-1]);
		}catch(Exception e) {
			return "ERROR";
		}
	}
	
	public String[] getHeader() {return fieldNames;}
	
	public void delRow() throws Exception{
		System.out.println(rs.getRow());
		//rs.deleteRow();
	}
	
	public void updateDB(int row, int col, String value) {
		try {
			rs.absolute(row);
			rs.updateString(col, value);
			rs.updateRow();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public void moveNewRow() {
		try {
			rs.moveToInsertRow();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
