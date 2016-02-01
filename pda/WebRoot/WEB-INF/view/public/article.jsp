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
	<jsp:include page="head.jsp"></jsp:include>
	<div style="height:1000px;margin:0 auto;margin-top:10px;margin-top:40px;">
	  <div style="width:1100px;margin:0 auto;box-shadow:0 0 5px 5px #A8DCE8">
      <div style="width:1100px;height:120px;margin:0 auto;">
	      <div id="title" style="height:40px;margin:0 auto;">
	        ${title}
		  </div>
		  <div style="width:500px;height:40px;margin:0 auto;margin-top:35px;color:red;">
		       <div style="float:left;width:250px;height:40px;padding-top:10px;padding-left: 30px;">
			     <span>发表时间：</span><span id="date">${date}</span>
			   </div>
			   <div style="display:inline-block;width:250px;height:40px;padding-top:10px;padding-left: 20px;">
			      <span>文章来源：</span><span id="author">${author}</span>
			   </div>
		   </div>
      </div>
	  <div id="content" style="border-top:1px solid #C0C0C0;width:1000px;margin:0 auto;padding-top:30px;">
	        ${content}
	        <div style="height:50px;"></div>
	  </div>
	  </div>
      </div> 
	  
   
</body>
</html>
