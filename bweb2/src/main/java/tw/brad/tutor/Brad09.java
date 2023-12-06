package tw.brad.tutor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Brad09")
public class Brad09 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		
		String xx = (String)request.getAttribute("x");
		
		PrintWriter out = response.getWriter();
		out.print("I am Brad09<hr />");
		if (name != null) {
			out.print("Hello, " + name + "<hr />");
		}
		out.printf("%s : %s<br />", x, y);
		out.printf("%s<br />", xx);
	}


}
