package tw.brad.tutor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.brad.utils.Bike;


@WebServlet("/Brad10")
public class Brad10 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher dispatcher = request.getRequestDispatcher("Brad11");
		
		Bike b1 = new Bike();
		b1.upSpeed(); b1.upSpeed(); b1.upSpeed(); b1.upSpeed();
		System.out.println(b1.getSpeed());
		
		request.setAttribute("bike", b1);
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("I am Brad10-1<hr />");
		
		dispatcher.forward(request, response);
		
		out.print("<hr />I am Brad10-2");
		
		
	}

}
