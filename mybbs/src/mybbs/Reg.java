package mybbs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Reg extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8612754998640365252L;

	/**
	 * Constructor of the object.
	 */
	public Reg() {
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
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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

		response.setContentType("text/html;charset=utf-8");
		String userid=request.getParameter("userid");
		String name=request.getParameter("name");
		byte[] tempbyte2=name.getBytes("ISO-8859-1");
		name=new String(tempbyte2,"utf-8");
		String pass1=request.getParameter("Password1");
		String pass2=request.getParameter("Password2");
		String sex=request.getParameter("sex");
		String image=null;
		boolean bsex=false;
		if (!pass1.equals(pass2))
		{
			response.sendRedirect("Reg.jsp");
			return ;
		}
		if (sex.equals("m"))
		{
			image=new String("male.jpg");
			bsex=true;
		}
		else image=new String("female.jpg");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:MySQL://localhost:3306/bbsdb2","root","root");
			PreparedStatement pstmt=conn.prepareStatement("insert into user(UserID,Password,Name,Sex,Adddate,Image)values(?,?,?,?,?,?)");
			pstmt.setString(1, userid);
			pstmt.setString(2, pass1);
			pstmt.setString(3, name);
			pstmt.setBoolean(4, bsex);
			pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			pstmt.setString(6, image);
			pstmt.executeUpdate();
			conn.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		response.sendRedirect("/mybbs/index.jsp");
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
