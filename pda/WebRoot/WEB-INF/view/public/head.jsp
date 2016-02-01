<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>My JSP 'head.jsp' starting page</title>

<script src="rescourse/js/jquery-2.1.1.min.js"></script>
 <script type="text/javascript" charset="utf-8" src="rescourse/ueditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="rescourse/ueditor/umeditor.min.js"></script>
    <script type="text/javascript" src="rescourse/ueditor/lang/zh-cn/zh-cn.js"></script>
<link href="rescourse/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<script src="rescourse/bootstrap/js/bootstrap.min.js"></script>
<link href="rescourse/css/main.css" rel="stylesheet" />
<link href="rescourse/font-awesome-4.3.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="rescourse/bootstrap/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" />
<script src="rescourse/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script src="rescourse/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="rescourse/bootstrap/js/modal.js"></script>
<link href="rescourse/css/pagination.css" rel="stylesheet" />
<script src="rescourse/js/jquery.pagination.js"></script>
<link href="rescourse/css/jquery-confirm.min.css" rel="stylesheet" />
<script src="rescourse/js/jquery-confirm.min.js"></script>
<script src="rescourse/js/ajaxfileupload.js"></script>
</head>

<body>
	<div class="head">
		<div
			style="height:80px;top:16px;position:relative;color:white;font-size:35px;padding-left:200px;line-height:80px;font-family:'Comic Sans MS', cursive, sans-serif;font-weight: bold;">
			<img style="height:100px;width:150px;margin-right:20px;"
				src="rescourse/imag/logo.png" />泰强驾校综合服务管理平台
			<div
				style="height:50px;width:300px;margin-left:750px;margin-top:-60px;font-size:30px;">
				<a href="index.jsp">首页</a>
				<c:choose>
					<c:when test="${sessionScope.user==null}">
						<a href="login.jsp">个人登陆</a>
					</c:when>
					<c:otherwise>
						<a href="User/Home.do">个人中心</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>
