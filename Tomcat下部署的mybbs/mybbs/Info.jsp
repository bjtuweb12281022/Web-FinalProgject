<%@ page language="java" import="java.util.*" import="Bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%!
	User user=null;
 %>
 <%
 	user=(User) session.getAttribute("user");
 	if (user==null) {response.sendRedirect("index.jsp"); session.setAttribute("tip", "请您先登录"); return; }
  %>
  <head>
    <base href="<%=basePath%>">
    
    <title><%=user.GetName() %>的个人主页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mybbs.css">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
 <div class="tab-content">
 <ul class="nav nav-tabs">
  <li><a href="#info" data-toggle="tab">个人信息</a></li>
  <li><a href="#upload" data-toggle="tab">上传头像</a></li>
  <li><a href="#chanpass" data-toggle="tab">修改密码</a></li>
</ul>
    <div class="regcolum tab-pane fade in active" id="info">
    <br />
    <form class="form-horizontal" role="form" action="servlet/Change" method="post">
  <div class="form-group">
    <label for="inputid2" class="col-sm-2 control-label">学号</label>
    <div class="col-sm-10">
      <p class="form-control"><%=user.GetUserID() %></p>
    </div>
  </div>
  <div class="form-group">
    <label for="inputName1" class="col-sm-2 control-label">昵称</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="name">
    </div>
  </div>
  <div class="form-group">
  <label for="inputSex" class="col-sm-2 control-label">性别</label>&nbsp;&nbsp;
    <input type="radio" name="sex" id="sex" value="m" checked>
    男
    &nbsp;&nbsp;&nbsp;
    <input type="radio" name="sex" id="sex" value="f">
    女
</div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">保存</button>
    </div>
  </div>
</form>
</div>
<div class="tab-pane fade" id="upload" style="margin-left:5%;">
<br />
	<form role="form" action="servlet/upload" method="post" enctype="multipart/form-data">
		<div class="form-group">
		    <label for="exampleInputFile">上传头像</label>
		    <input type="file" name="file"  id="file">
		    <p class="help-block">jpg或png 建议大小在150×150尺寸</p>
		 </div>
		 <button type="submit" class="btn btn-default">上传</button>
		 <br />
		 <br />
		 <img src='<%=user.GetImage() %>' style="width:150px;height:150px;"/>
	</form>
</div>
<div class="tab-pane fade" id="chanpass" style="margin-left:5%;margin-top:5%;">
	<form role="form"  action="servlet/newpass" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">新密码</label>
    <input type="password" class="form-control" name="pass1" placeholder="Password">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">确认新密码</label>
    <input type="password" class="form-control" name="pass2" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
</form>
</div>
</div>
  </body>
</html>
