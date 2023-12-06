package tw.brad.tutor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

// 

@WebServlet("/Brad06")
@MultipartConfig(
		location = "C:\\Users\\Brad\\git\\repository2\\bweb2\\upload"
		)
public class Brad06 extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part part = request.getPart("upload");
		
		System.out.println(part.getName());
		System.out.println(part.getSize());
		System.out.println(part.getSubmittedFileName());
		System.out.println(part.getContentType());
		
		if (part.getSize() > 0) {
			part.write(part.getSubmittedFileName());
		}
	}

}
