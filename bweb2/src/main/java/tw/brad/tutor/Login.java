package tw.brad.tutor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.brad.utils.MemberDB;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private MemberDB memberDB;
	
	public Login() {
		try {
			memberDB = new MemberDB();
		}catch(Exception e) {
			System.out.println();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String account = request.getParameter("account");
		String passwd = request.getParameter("passwd");

		
		try {
			if (memberDB.login(account, passwd)) {
				response.sendRedirect("main.jsp");
			}else {
				response.sendRedirect("brad24.jsp");
			}
			//throw new SQLException();
		} catch (SQLException e) {
			System.out.println(e);
			response.sendRedirect("brad24.jsp");
		}
		
		
	}
}
