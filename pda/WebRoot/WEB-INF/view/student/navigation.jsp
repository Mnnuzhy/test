<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'navigation.jsp' starting page</title>

  </head>
  
  <body>
     <div class="wel" style="font-size:15px;margin-left: 5px;">
	    您好，${sessionScope.user.name}。  欢迎登录驾校综合服务平台！<a href="User/logoff.do">注销登陆</a>
	  </div>
	  <div class="mid">
	     <ul class="naw" >
                    <li> <a href="ChangeOver/student.do?flag=1"> <i style="font-size:18px;" class="fa fa-home fa-fw"></i> 我的主页</a></li>
                    <li> <a href="ChangeOver/student.do?flag=2"> <i style="font-size:18px;" class="fa fa-pencil fa-fw"></i> 考试预约 </a> </li>
                    <li> <a href="ChangeOver/student.do?flag=3"> <i style="font-size:18px;" class="fa fa-pencil fa-fw"></i> 预约进度 </a> </li>
                    <li> <a href="ChangeOver/student.do?flag=4"> <i style="font-size:18px;" class="fa fa-pencil fa-fw"></i> 模拟考试 </a> </li>
                    <li> <a href="ChangeOver/student.do?flag=5"> <i style="font-size:18px;" class="fa fa-book fa-fw"></i> 用户信息 </a> </li>
                    <li> <a href="ChangeOver/student.do?flag=6"> <i style="font-size:18px;" class="fa fa-pencil fa-fw"></i> 密码修改 </a> </li>
                    <li> <a href="ChangeOver/student.do?flag=7"> <i style="font-size:18px;" class="fa fa-cog fa-fw"></i> 留言板 </a> </li>
         </ul>
	  </div>
  </body>
</html>
