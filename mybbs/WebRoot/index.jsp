<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎来到壶中世界</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="css/mybbs.css">
	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
  </head>
  
  <body>
      <nav class="navbar navbar-default" role="navigation">
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
</nav>
  <div class="leftcolum" style="margin-left:10px;">
    <form role="form" action="servlet/UserCheck" method="post">
  <div class="form-group">
    <label for="UserID">学号</label>
    <input type="text" class="form-control" name="userid" placeholder="请输入学号">
  </div>
  <div class="form-group">
    <label for="Password1">密码</label>
    <input type="password" class="form-control" name="password1" placeholder="Password">
  </div>
  <p><%String tip=(String) request.getAttribute("tip");
  	if (tip!=null) out.print(tip);
  	 %></p>
  <button type="submit" class="btn btn-default btn-myindex">登录</button>
</form>
<br />
<div class="form-group">
    <p><% String s=(String) session.getAttribute("tip"); if(s!=null) {out.write(s); session.setAttribute("tip", null);} %></p>
  </div>
  <br />
  <button type="button" class="btn btn-default btn-myindex" onclick="window.location='Reg.jsp'">注册</button>
</div>
<div>
<img alt="" src='lyh.jpg' style="width:200px;heigth:200px;">
</div>
  </body>
</html>
