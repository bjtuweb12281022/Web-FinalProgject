<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎注册</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mybbs.css">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
  <div style="margin-left:20px;">
  	<h1>欢迎来到壶中世界</h1>
  	<br />
  	<br />
  </div>
  <div class="regcolum">
    <form class="form-horizontal" role="form" action="servlet/Reg" method="post">
  <div class="form-group">
    <label for="inputid2" class="col-sm-2 control-label">学号</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="userid">
    </div>
  </div>
  <div class="form-group">
    <label for="inputName1" class="col-sm-2 control-label">昵称</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="name">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="Password1" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">确认</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="Password2" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
  <label for="inputSex" class="col-sm-2 control-label">性别</label>&nbsp;&nbsp;
    <input type="radio" name="sex" id="sex1" value="m" checked>
    男
    &nbsp;&nbsp;&nbsp;
    <input type="radio" name="sex" id="sex2" value="f">
    女
</div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox" id="allow">同意壶中世界的条款
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">注册</button>
    </div>
  </div>
</form>
</div>
<div style="margin-left:55%">
<img alt="" src='lyh.jpg' style="width:200px;heigth:200px;">
</div>
  </body>
</html>
