package tw.brad.tutor;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Brad16")
public class Brad16 extends HttpServlet {
	private static final String USER = "root";	
	private static final String PASSWD = "root";
	private static final String URL = "jdbc:mysql://127.0.0.1/brad";
	
	private Connection conn;
	
    public Brad16() {
		Properties prop = new Properties();
		prop.put("user", USER);
		prop.put("password", PASSWD);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("OK2");
			
			conn = DriverManager.getConnection(URL, prop);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM food");
			
			response.setContentType("text/html; charset=UTF-8");;
			PrintWriter out = response.getWriter();
			out.write("<table border='1' width='100%'>");
			
			while (rs.next()) {
				out.print("<tr>");
				out.printf("<td>%s</td>", rs.getString("id"));
				out.printf("<td>%s</td>", rs.getString("name"));
				out.printf("<td><img src='%s' width='160px' height='90px' /></td>", rs.getString("pic"));
				out.print("</tr>");
			}
			
			out.write("</table>");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



}
