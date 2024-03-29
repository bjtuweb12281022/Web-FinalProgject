package mybbs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.User;

public class Change extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3707532683583346952L;

	/**
	 * Constructor of the object.
	 */
	public Change() {
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
		HttpSession session = request.getSession();
		String name=request.getParameter("name");
		byte[] tempbyte2=name.getBytes("ISO-8859-1");
		name=new String(tempbyte2,"utf-8");
		String sex=request.getParameter("sex");
		Boolean bsex=false;
		if (sex.equals("m")) bsex=true;
		User user=(User) session.getAttribute("user");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:MySQL://localhost:3306/bbsdb2","root","root");
			String strsql="update user set Name=? where id=?";
			PreparedStatement pstmt=conn.prepareStatement(strsql);
			pstmt.setString(1, name);
			pstmt.setInt(2, user.GetID());
			pstmt.executeUpdate();
			PreparedStatement pstmt2=conn.prepareStatement("update user set Sex=? where id=?");
			pstmt2.setBoolean(1, bsex);
			pstmt2.setInt(2, user.GetID());
			pstmt2.executeUpdate();
			user.SetName(name);
			user.SetSex(bsex);
			conn.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
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
