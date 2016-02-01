<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'home.jsp' starting page</title>
    
	<link href="rescourse/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="rescourse/css/main.css" rel="stylesheet" />
	<script src="rescourse/js/jquery-2.1.1.min.js"></script>
	<script src="rescourse/bootstrap/js/bootstrap.min.js"></script>
    <link href="rescourse/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet"/>

  </head>
  
  <body>
   <jsp:include page="../public/head.jsp"></jsp:include>
   <div style="height:578px;width:1055px;margin:0 auto;">
     <jsp:include page="navigation.jsp"></jsp:include> 
	  <div class="major">  
            <div class="home">	
              <div class="top">	
                 <div style="background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;color:#C87800"> 待阅告知与提示信息</div>	
				 <div style="height:46px;line-height:38px"> 无待阅告知与提示信息</div>					 
              </div>	
              <div class="bottom">
			     <div style="height:42px;background-color:#F5F5F5;line-height:38px;">
				    学员信息
				 </div>
				 <div style="border:1px solid #DDDDDD;height:42px;">
				    <div style="height:42px;width:120px;float:left;background-color:#F5F5F5;line-height:38px;">
					  <strong style="margin-left:40px;">注册时间</strong>
				    </div>
					<div style="border-left:1px solid #DDDDDD;height:42px;width:316px;float:left;line-height:38px;padding-left:2px">
					  ${sessionScope.user.registertime}
				    </div>
					<div style="border-left:1px solid #DDDDDD;height:42px;width:125px;float:left;background-color:#F5F5F5;line-height:38px;">
					  <strong style="margin-left:40px;">家庭地址</strong>
				    </div>
					<div style="border-left:1px solid #DDDDDD;height:42px;width:310px;float:left;line-height:38px;padding-left:2px">
					  ${sessionScope.user.address}
				    </div>
				 </div>
				 <div style="height:42px;">
					<ul class="nak">
					   <li name="nk" style="background-color:white;border-top:2px solid #114EC9">考试信息</li>
					   <li name="nk">培训信息</li>
					</ul>
				 </div>
				 <div>
				
				  <div class="d1" style="border:1px solid #DDDDDD;">
				 <div style="height:24px;background-color:#E6E6E6;">
				    <div style="height:24px;width:436px;float:left;">
					 <strong>考试科目</strong>
				    </div>
					<div style="height:24px;width:436px;float:left;">
					 <strong>考试成绩</strong>
				    </div>
				 </div>
				
				<c:if test="${sd.subjectone!=0}">
				 <div style="height:24px;background-color:#F5F5F5;padding-left: 5px;">
				    <div style="height:24px;width:436px;float:left;">
					科目一
				    </div>
					<div style="height:24px;width:436px;float:left;">
					  <div style="height:24px;width:436px;float:left;">
					  ${sd.subjectone}
				    </div>
				    </div>
				 </div>
				 </c:if>
				 <c:if test="${sd.subjecttow!=0}">
				  <div style="height:24px;background-color:#F5F5F5;padding-left: 5px;">
				    <div style="height:24px;width:436px;float:left;">
					科目二
				    </div>
					<div style="height:24px;width:436px;float:left;">
					  <div style="height:24px;width:436px;float:left;">
					  ${sd.subjecttow}
				    </div>
				    </div>
				 </div>
				  </c:if>
				 <c:if test="${sd.subjectthree!=0}">
				  <div style="height:24px;background-color:#F5F5F5;padding-left: 5px;">
				    <div style="height:24px;width:436px;float:left;">
					科目三
				    </div>
					<div style="height:24px;width:436px;float:left;">
					  <div style="height:24px;width:436px;float:left;">
					  ${sd.subjectthree}
				    </div>
				    </div>
				 </div>
				  </c:if>
				 <c:if test=" ${sd.subjectfour!=0}">
				  <div style="height:24px;background-color:#F5F5F5;padding-left: 5px;">
				    <div style="height:24px;width:436px;float:left;">
					科目四
				    </div>
					<div style="height:24px;width:436px;float:left;">
					  <div style="height:24px;width:436px;float:left;">
					  ${sd.subjectfour}
				    </div>
				    </div>
				 </div>
				   </c:if>
				 </div>
				 <div class="d1" style="border:1px solid #DDDDDD;display:none;">
				 <div style="height:24px;background-color:#E6E6E6;">
				    <div style="height:24px;width:436px;float:left;">
					 <strong>培训科目</strong>
				    </div>
					<div style="height:24px;width:436px;float:left;">
					 <strong>培训学时</strong>
				    </div>
				 </div>
				 <div style="height:24px;background-color:#F5F5F5;">
				    <div style="height:24px;width:436px;float:left;">
					  科目一
				    </div>
					<div style="height:24px;width:436px;float:left;">
					 20
				    </div>
				 </div>
				 </div>
              </div> 
             </div>			  
		 </div> 
	  </div>
   </div>

   
    <script>
      $(function(){
	   $("li[name='nk']").each(function(i){
	      $(this).click(function(){
		   
		      $(this).css({ "background-color":"white","border-top":"2px solid #114EC9"}).siblings().css({ "background-color":"#F5F5F5","border-top":"0px solid #114EC9"});
			  $(".d1").eq(i).css({"display":"block"}).siblings().css({"display":"none"});
			 });
		});
	  });
   </script>
</body>
</html>
