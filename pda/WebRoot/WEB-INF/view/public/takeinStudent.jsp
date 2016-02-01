<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	 <div style="height:600px;width:1055px;margin:0 auto;margin-top:40px;">
		   
			<div>
			     <div style="height:40px;border-top:2px solid #114EC9;margin-top:5px;line-height:32px;font-size:18px;padding-left:10px;">
			     <span ></span>招生信息
			    </div>
			    <div style="padding-top:20px;padding-left:10px;">
				    ${map.m6}
				
				</div>
				 <div style="height:40px;border-top:2px solid #114EC9;margin-top:5px;background-color:#F5F5F5;line-height:32px;font-size:18px;padding-left:10px;">
			    <span ></span>教练列表
			   </div>
		  <div style="height:400px;margin-top:15px;font-size:15px;">
		   <div id="comentdiv${i}" style="border-top:1px solid #ccc;height:100px;padding-left:20px;padding-top: 10px;">
		   <c:forEach items="${map.trainerM1}" var="tm">
		   <div id="sdiv${i}" style="width:200px;height:230px;margin-top: 10px;display:inline-block;border:1px solid #ccc;">
		        <a href="ChangeOver/trainerDetail.do?id=${tm.id}" style="cursor:point;"> <img style="width:150px;height: 200px;margin-left: 25px;" src="rescourse/imag/user/${tm.imag}"> </a>
			         <p style="margin-left: 45px;"><span>${tm.name}</span> <span>${tm.year}年驾龄</span></p>
		   </div>
		   </c:forEach>
      </div>
	  </div>
	  </div>
	  </div>
	<script>
		$(function() {
			$.post(
			   "Manager/Index.do",
			   {},
			   function(data){
				   d=eval("("+data+")");
				  // alert($("#v").text());
				   $("#v").attr("src","rescourse/imag/ad/"+d.m2);
				   $("#jp").html(d.m4);
				   $("#gp").html(d.m3);
				   $("#car1").attr("src","rescourse/imag/ad/"+d.m1[0]);
				   $("#car2").attr("src","rescourse/imag/ad/"+d.m1[1]);
				   $("#car3").attr("src","rescourse/imag/ad/"+d.m1[2]);
				  
			   },
			   "text"
			);
			$.post(
			        "Manager/getAllArt.do",
					   {},
					   function(data){
						   d=eval("("+data+")");
						  // alert(d);
						   for(var i=0;i<d.length;i++){
							   $("#arc").append("<div>·<a href=User/article.do?aid="+d[i].id+">"+repalceHtml(d[i].title)+"</a></div>");
						   }
					   },
					   "text"
					);
			$("#carousel-423100").carousel('cycle');
		
		});
		$("#login").click(function() {
			window.open("login.html", "_self");
		});
		function repalceHtml(t){
			te=t.replace(/({|})/g,''); //过滤{}
			te=te.replace("&nbsp;",''); //过滤{}
			te=te.replace(/</g,'<'); //置换符号<
			te=te.replace(/>/g,'>'); //置换符号>*/
			te=te.replace(/<\/?[^>]*>/g,''); //*<\/?[^>]*>可以匹配<script></style></body>等，并置空。而不是替换<和>两个符号
			return te;
		}
	</script>
</body>
</html>
