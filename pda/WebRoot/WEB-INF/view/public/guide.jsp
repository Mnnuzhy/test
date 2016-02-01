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


</head>

<body>
	<jsp:include page="head.jsp"></jsp:include>
	  <div style="height:600px;width:1055px;margin:0 auto;margin-top:40px;">
		   
			<div>
			     <div style="height:40px;border-top:2px solid #114EC9;margin-top:5px;line-height:32px;font-size:18px;padding-left:10px;">
			     <span ></span>${title}指南
			    </div>
			    <div style="padding-top:20px;padding-left:10px;border: 1px solid #ccc;">
				     ${content}
				
				</div>
				</div>
				</div>
</body>
</html>
