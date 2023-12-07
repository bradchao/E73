package tw.brad.tutor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.brad.utils.Bike;

@WebServlet("/Brad11")
public class Brad11 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Bike b1 = (Bike)request.getAttribute("bike");
		
		PrintWriter out = response.getWriter();
		out.print("I am Brad11:" + b1.getSpeed());
	}

}
