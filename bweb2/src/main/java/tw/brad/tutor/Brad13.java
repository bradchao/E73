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
			
			String[] ops = {"","","",""};
		
			ops[myCalc.getOp()] = "selected";
		
			out.printf(web, myCalc.getX(), 
					ops[0], ops[1], ops[2], ops[3],
					myCalc.getY(), 
					myCalc.result());
			
		} catch (Exception e) {
			System.out.println("debug1:" + e);
			out.printf(web, "", "", "", "", "", "","");			
		}
		
	}

}
