<%@ page language="java" import="java.util.*" import="java.sql.*" import="Bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%!String title=new String();
  		String content=new String();
  		String pid=null;
  		User user=null;
  		User ub=null;
  		int uid;
  		int count;
  		 %>
  		<% 
    ub=(User) session.getAttribute("user");
    if (ub==null) {response.sendRedirect("index.jsp"); session.setAttribute("tip", "请您先登录"); return; }
    pid=request.getParameter("id");
    int n=Integer.parseInt(pid) ;
    try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:MySQL://localhost:3306/bbsdb2","root","root");
			String strsql="select * from page where ID=?";
			PreparedStatement pstmt=conn.prepareStatement(strsql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			pstmt.setInt(1, n);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
			title=rs.getString("Title");
			content=rs.getString("Content");
			uid=rs.getInt("UserID");
			}
			String strsql2="select * from user where ID=?";
			PreparedStatement pstmt2=conn.prepareStatement(strsql2,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			pstmt2.setInt(1, uid);
			ResultSet rs2=pstmt2.executeQuery();
			while(rs2.next())
			{
				user=new User(rs2.getInt(1),rs2.getString(2),rs2.getString("Password"),rs2.getString("Name"),rs2.getString("Image"),rs2.getBoolean("Sex"),rs2.getTimestamp("Adddate").getTime(),rs2.getTimestamp("Lastlogindate").getTime(),rs2.getInt("LoginCount"));
			}
			conn.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
     %>
  <head>
    <base href="<%=basePath%>">
    <title><%=title %></title>
    
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mybbs.css">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

  </head>
  
  <body>
     <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="forum.jsp">壶中世界</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-right">
      <li><a><%=ub.GetName() %></a></li>
      <li><a href='Info.jsp'>账户设置</a></li>
      <li><a href='Logout.jsp'>退出</a></li>
      <li>
        <img src='<%=ub.GetImage() %>' style="width:50px; height:50px"/>
      </li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>
<div class="panel panel-default" style="width:1080px;margin-left:auto;margin-right:auto">
  <!-- Default panel contents -->
  <div class="panel-heading">Panel heading</div>

  <!-- Table -->
  <table class="table">
  	<tr>
     		<td>
     		</td>
     		<td style="width:100%">
     		<h1><%=title %></h1>
     		</td>
     	</tr>
  	<tr>
     		<td class="pls">
     			<div>
     			<%=user.GetName() %>
     			<br />
     			<img src='<%=user.GetImage() %>' width="120" height="120"/>
     			<br />
     			</div>
     		</td>
     		<td>
     			<div style="text-align:right; font-size:12px; font-color:red;">
     				<p>楼主</p>
     			</div>
     			<pre class="con"><%=content %></pre>
     			<form class="form-inline" role="form" action="servlet/AddReply" method="post">
     			<input name="pageid" type="hidden" value="<%=pid %>">
  					<div class="form-group" style="width:75%">
				    <label class="sr-only" for="qucikreply">Email address</label>
				    <input type="text" class="form-control" style="height:40px" name="reply" placeholder="#在这里快速回复#">
				  </div>
				  <button type="submit" style="height:40px" class="btn btn-default">快速回复</button>
				</form>
     		</td>
     	</tr>
    <%
    try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:MySQL://localhost:3306/bbsdb2","root","root");
			String strsql="select * from reply where PageID=?";
			PreparedStatement pstmt=conn.prepareStatement(strsql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			pstmt.setInt(1, n);
			String t=new String();
			String uid=new String();
			ResultSet rs=pstmt.executeQuery();
			count=1;
			while(rs.next())
			{
				count++;
				t=rs.getString("Content");
				uid=rs.getString("UserID");
				String strsql2="select * from user where ID=?";
				PreparedStatement pstmt2=conn.prepareStatement(strsql2,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				pstmt2.setString(1, uid);
				ResultSet rs2=pstmt2.executeQuery();
				while(rs2.next())
				{
					user=new User(rs2.getInt(1),rs2.getString(2),rs2.getString("Password"),rs2.getString("Name"),rs2.getString("Image"),rs2.getBoolean("Sex"),rs2.getTimestamp("Adddate").getTime(),rs2.getTimestamp("Lastlogindate").getTime(),rs2.getInt("LoginCount"));
				}
			%>
				<tr>
					<td class="pls">
     				<div>
     					<%=user.GetName() %>
     					<br />
     					<img src='<%=user.GetImage() %>' width="120" height="120"/>
     					</div>
     				</td>
					<td>
					<div style="text-align:right;">
						<p><%
						String name=new String();
						if (count==2) name=new String("沙发");
						if (count==3) name=new String("板凳");
						if (count==4) name=new String("地板");
						if (count>4) name=new String(count+"楼");
						out.write(name);%></p>
					</div>
					<pre class="con"><%=t %></pre></td>
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
</div>
  </body>
</html>
