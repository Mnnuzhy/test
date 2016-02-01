<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'login.jsp' starting page</title>
<link href="rescourse/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="rescourse/css/main.css" rel="stylesheet" />
<script src="rescourse/js/jquery-2.1.1.min.js"></script>
<script src="rescourse/bootstrap/js/bootstrap.min.js"></script>

</head>

<body>
	<div class="head">
		<div
			style="height:80px;top:16px;position:relative;color:white;font-size:35px;padding-left:200px;line-height:80px;font-family:'Comic Sans MS', cursive, sans-serif;font-weight: bold;">
			<img style="height:100px;width:150px;margin-right:20px;"
				src="rescourse/imag/logo.png" />驾校综合服务管理平台
			<div
				style="height:50px;width:250px;margin-left:850px;margin-top:-60px;font-size:30px;">
				<a href="index.jsp">首页</a>
			</div>
		</div>
	</div>
	<div style="height:1000px;margin:0 auto;margin-top:10px;margin-top:40px;">
 <div class="container" style="width:1055px;">
  <div class="jumbotron" style="box-shadow:0 0 2px 2px #888888"">
   <div class="container">
      <h1>${title}</h1>
      <p>${content}</p>
      <p><a class="btn btn-primary btn-lg" role="button" href="login.jsp">
                    返回登陆</a>
      </p>
   </div>
</div>
</div>
</div> 

</body>
</html>
