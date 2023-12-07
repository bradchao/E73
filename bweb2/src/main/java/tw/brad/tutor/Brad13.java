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
			String op = request.getParameter("op");
			String[] ops = {"","","",""};
			String result = "";
			if (op != null) {
				switch (op) {
					case "1": 
						ops[0] = "selected";
						result = myCalc.plus() + "";
						break;
					case "2": 
						ops[1] = "selected"; 
						result = myCalc.minu() + "";
						break;
					case "3": 
						ops[2] = "selected"; 
						result = myCalc.mult() + "";
						break;
					case "4": 
						ops[3] = "selected"; 
						result = myCalc.div();
						break;
					default: ops[0] = "selected"; break;
				}
			}
			
			web = BradUtils.loadView(view);
			out.printf(web, myCalc.getX(), 
					ops[0], ops[1], ops[2], ops[3],
					myCalc.getY(), 
					result);
			
		} catch (Exception e) {
			System.out.println(e);
			out.printf(web, "", "", "", "", "", "","");			
		}
		
	}

}
