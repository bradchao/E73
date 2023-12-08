package tw.brad.tutor;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Brad15")
public class Brad15 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//File root = new File(".");
		//System.out.println(root.getAbsolutePath());
		BufferedImage img = ImageIO.read(new File("C:\\Users\\Brad\\git\\repository2\\bweb2\\src\\main\\webapp\\imgs\\brad.jpg"));
		Graphics2D g2d = img.createGraphics();
		
		Font font = new Font(null, Font.BOLD, 72);
		AffineTransform tran = new AffineTransform();
		tran.rotate(Math.toRadians(-30));
		Font font2 = font.deriveFont(tran);
		
		g2d.setColor(Color.YELLOW);
		g2d.setFont(font2);
		g2d.drawString("資展國際", 300, 300);
		
		
		response.setContentType("image/jpeg");
		OutputStream os = response.getOutputStream();
		ImageIO.write(img, "jpeg", os);
		
		ImageIO.write(img, "jpeg", new File("C:\\Users\\Brad\\git\\repository2\\bweb2\\src\\main\\webapp\\imgs\\brad2.jpg"));
		
		
		
	}



}
