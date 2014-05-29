package mybbs;

import Bean.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserCheck extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1254474054330200804L;

	/**
	 * Constructor of the object.
	 */
	public UserCheck() {
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

		response.setContentType("text/html");
		HttpSession session = request.getSession();
		String uid=request.getParameter("userid");
		String id=null;
		String name=null;
		String image=null;
		String Password=null;
		String pass=request.getParameter("password1");
		int nid=0;
		Timestamp date = null;
		Timestamp ldate=null;
		int logincount=0;
		boolean sex=false;
		boolean find=false;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:MySQL://localhost:3306/bbsdb2","root","root");
			String strsql="select * from user";
			PreparedStatement pstmt=conn.prepareStatement(strsql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				id=rs.getString("UserID");
				Password=rs.getString("Password");
				if (id.equals(uid) && Password.equals(pass)) {
					find=true; nid=rs.getInt("ID");name=rs.getString("Name"); image=rs.getString("Image"); sex=rs.getBoolean("Sex"); date=rs.getTimestamp("Adddate"); 
					ldate=rs.getTimestamp("Lastlogindate"); logincount=rs.getInt("LoginCount");
					break;
					}
			}
			conn.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		if (find)
		{
			ldate=new Timestamp(System.currentTimeMillis());
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn=DriverManager.getConnection("jdbc:MySQL://localhost:3306/bbsdb2","root","root");
				String strsql2=new String("update user set Lastlogindate=?where ID=?");
				PreparedStatement p2=conn.prepareStatement(strsql2);;
				p2.setTimestamp(1, ldate);
				p2.setInt(2, nid);
				p2.executeUpdate();
				conn.close();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			User user=new User(nid,uid,pass,name,image,sex,date.getTime(),ldate.getTime(),logincount);
			session.setAttribute("user", user);
			response.sendRedirect("/mybbs/forum.jsp");
		}
		else
		{
			session.setAttribute("tip","’À∫≈ªÚ√‹¬Î¥ÌŒÛ");
			response.sendRedirect("/mybbs/index.jsp");
		}
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
