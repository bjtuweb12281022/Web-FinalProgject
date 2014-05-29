<%@ page language="java" import="java.util.*" import="java.sql.*" import="Bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  	<%!User user=null; %>
  	<%user=(User) session.getAttribute("user"); 
  	if (user==null) {response.sendRedirect("index.jsp"); session.setAttribute("tip", "请您先登录"); return; }%>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎来到壶中世界</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
  </head>
  
  <body>
    <nav class="navbar navbar-default " role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href='forum.jsp'>壶中世界</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-right">
      <li><a><%=user.GetName() %></a></li>
      <li><a href='Info.jsp'>账户设置</a></li>
      <li><a href='Logout.jsp'>退出</a></li>
      <li>
        <img src='<%=user.GetImage() %>' style="width:50px; height:50px"/>
      </li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>
<div class="table-responsive" style="margin-left:auto;margin-right:auto;width:1080px;">
  <table class="table table-striped">
  	<%
  		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:MySQL://localhost:3306/bbsdb2","root","root");
			String strsql="select * from page";
			PreparedStatement pstmt=conn.prepareStatement(strsql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				%><tr>
				<td style='width:20px;'><img src='folder_new.gif'></td>
				<td style="width:40%"><a href='Page.jsp?id=<%=rs.getString("ID") %>'>
				<%=rs.getString("Title") %>
				</a></td>
				<%
				String strsql2="select * from user where ID=?";
				PreparedStatement pstmt2=conn.prepareStatement(strsql2,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				pstmt2.setInt(1, rs.getInt("UserID"));
				ResultSet rs2=pstmt2.executeQuery();
				String uid=null;
				while(rs2.next())
				{
					uid=rs2.getString("Name");
				}
				%><td><cite><span style='font-size:14px'><%=uid %></span></cite><br /><em><span style='font-size:11px'><%=rs.getString("SendTime") %></span></em></td>
				<td><%
				String strsql3="select * from reply where PageID=?";
				PreparedStatement pstmt3=conn.prepareStatement(strsql3,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				pstmt3.setInt(1, rs.getInt("ID"));
				ResultSet rs3=pstmt3.executeQuery();
				long max=0;
				int ruid=0;
				while(rs3.next())
				{
					if (rs3.getTimestamp("SendTime").getTime()>max) {ruid=rs3.getInt("UserID"); max=rs3.getTimestamp("SendTime").getTime();}
				}
				String strsql4="select * from user where ID=?";
				PreparedStatement pstmt4=conn.prepareStatement(strsql4,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				pstmt4.setInt(1, ruid);
				ResultSet rs4=pstmt4.executeQuery();
				while(rs4.next())
				{
					%><cite><span style='font-size:14px'><%=rs4.getString("Name") %></span></cite><br /><em><span style='font-size:11px'><%=new Timestamp(max) %></span></em><%
				}
				 %></td>
				</tr>
				<%
			}
			conn.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
  	 %>
  </table>
  <form role="form" action="servlet/Fatie" method="post">
  	<div class="form-group">
    	<label for="exampleInputPassword1">标题</label>
    	<input type="text" class="form-control" name="title" placeholder="Text input" style="width:50%">
 	 </div>
 	 <div class="form-group">
    	<label for="exampleInputPassword1">正文</label>
 	 	<textarea class="form-control" name="content" rows="9" style="width:70%"></textarea>
 	 </div>
 	 <button type="submit" class="btn btn-default">快速发帖</button>
  </form>
</div>
  </body>
</html>
