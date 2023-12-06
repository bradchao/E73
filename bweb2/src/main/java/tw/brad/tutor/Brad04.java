package tw.brad.tutor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Brad04")
public class Brad04 extends HttpServlet {
	private final String html = "<!DOCTYPE html>\r\n"
			+ "<html>\r\n"
			+ "	<head>\r\n"
			+ "		<meta charset='UTF-8'>\r\n"
			+ "		<title>Insert title here</title>\r\n"
			+ "	</head>\r\n"
			+ "	<body>\r\n"
			+ "		<form action='Brad04'>\r\n"
			+ "			<input name='x' value='%s' />\r\n"
			+ "			+\r\n"
			+ "			<input name='y' value='%s' />\r\n"
			+ "			<input type='submit' value='=' />\r\n"
			+ "			<span>%s</span>\r\n"
			+ "		</form>\r\n"
			+ "	</body>\r\n"
			+ "</html>";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		//System.out.printf("%s : %s", x, y);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			int r = Integer.parseInt(x) + Integer.parseInt(y);
		
			out.printf(html, x, y, r);
		}catch (RuntimeException e) {
			out.printf(html, "","","");
		}
	}


}
