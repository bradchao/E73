package tw.brad.tutor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.brad.utils.MyCalc;

// Controller
@WebServlet("/Brad12")
public class Brad12 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 1. 接收參數
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		
		// 2. 計算
		try {
			MyCalc myCalc = new MyCalc(x, y);
			request.setAttribute("myCalc", myCalc);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		// 3. 呈現 View
		RequestDispatcher dispatcher = request.getRequestDispatcher("Brad13");
		dispatcher.forward(request, response);
		
	}

}
