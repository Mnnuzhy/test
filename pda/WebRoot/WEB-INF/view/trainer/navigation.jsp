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
     <div class="wel">
	    您好，${sessionScope.user.name}。  欢迎登录驾校综合服务平台！<a href="User/logoff.do">注销登陆</a>
	  </div>
	    <div class="mid">
	     <ul class="naw" >
                    <li> <a href="ChangeOver/trainer.do?flag=1"> <i style="font-size:18px;" class="fa fa-home fa-fw"></i> 招生宣传</a></li>
                    <li> <a href="ChangeOver/trainer.do?flag=2"> <i style="font-size:18px;" class="fa fa-pencil fa-fw"></i> 学员管理 </a> </li>
                    <li> <a href="ChangeOver/trainer.do?flag=3"> <i style="font-size:18px;" class="fa fa-pencil fa-fw"></i> 学员招收 </a> </li>
                    <li> <a href="ChangeOver/trainer.do?flag=4"> <i style="font-size:18px;" class="fa fa-pencil fa-fw"></i> 成绩录入 </a> </li>
                    <li> <a href="ChangeOver/trainer.do?flag=5"> <i style="font-size:18px;" class="fa fa-book fa-fw"></i> 用户信息 </a> </li>
                    <li> <a href="ChangeOver/trainer.do?flag=6"> <i style="font-size:18px;" class="fa fa-pencil fa-fw"></i> 密码修改 </a> </li>
                    <li> <a href="ChangeOver/trainer.do?flag=7"> <i style="font-size:18px;" class="fa fa-cog fa-fw"></i> 处理留言 </a> </li>
                     <li> <a href="ChangeOver/trainer.do?flag=8"> <i style="font-size:18px;" class="fa fa-cog fa-fw"></i> 资格认证 </a> </li>
         </ul>
	  </div>
  </body>
</html>
