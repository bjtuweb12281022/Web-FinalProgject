package mybbs;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Bean.User;
@MultipartConfig
public class upload extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4448020161622787429L;

	/**
	 * Constructor of the object.
	 */
	public upload() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charest=utf-8");
		Part part=request.getPart("file");
		HttpSession session = request.getSession();
		User user=(User) request.getSession().getAttribute("user");
		String type=".jpg";
		String filename=new String(user.GetUserID()+type);	
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:MySQL://localhost:3306/bbsdb2","root","root");
			String strsql2=new String("update user set Image=?where ID=?");
			PreparedStatement p2=conn.prepareStatement(strsql2);;
			p2.setString(1, "uploadFiles/"+filename);
			p2.setInt(2, user.GetID());
			p2.executeUpdate();
			user.SetImage("uploadFiles/"+filename);
			session.setAttribute("user", user);
			conn.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		part.write(getServletContext().getRealPath("/uploadFiles")+"/"+filename);
		response.sendRedirect("/mybbs/Info.jsp");
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
