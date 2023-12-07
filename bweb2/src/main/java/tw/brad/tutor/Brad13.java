package tw.brad.tutor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.brad.utils.BradUtils;
import tw.brad.utils.MyCalc;

// View
@WebServlet("/Brad13")
public class Brad13 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		String web = "";
		try {
			MyCalc myCalc = (MyCalc)request.getAttribute("myCalc");
			String view = (String)request.getAttribute("view");
			web = BradUtils.loadView(view);
			out.printf(web, myCalc.getX(), myCalc.getY(), myCalc.plus());
			
		} catch (Exception e) {
			//System.out.println(e);
			out.printf(web, "", "","");			
		}
		
	}

}
