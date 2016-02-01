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
	<div style="margin:0 auto;margin-top:10px;margin-top:40px;">
	
		<div class="container" style="width:1055px;box-shadow:0 0 2px 2px #888888">
			<div class="row">
				<div class="span12">
					<div class="carousel slide" id="carousel-423100">
						<ol class="carousel-indicators">
							<li class="active" data-slide-to="0"
								data-target="#carousel-423100"></li>
							<li data-slide-to="1" data-target="#carousel-423100"></li>
							<li data-slide-to="2" data-target="#carousel-423100"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img id="car1" style="width:1055px;height:317px;"   />

							</div>
							<div class="item">
								<img id="car2" style="width:1055px;height:317px;"  />

							</div>
							<div class="item">
								<img id="car3" style="width:1055px;height:317px;"  />

							</div>
						</div>
						<a data-slide="prev" href="#carousel-423100"
							class="left carousel-control">‹</a> <a data-slide="next"
							href="#carousel-423100" class="right carousel-control">›</a>
					</div>
				</div>
			</div>
		</div>
       
        
		<div class="container">
			<div class="row">
				<div class="span12">
					<ul class="thumbnails" style="">

						<li class="span4" style="width:500px;float:left;margin-left:30px;">
							<div class="thumbnail">
								<img alt="300x200" src="rescourse/imag/2.jpg" />
								<div class="caption" >
									<h3 style="background-color: #F5F5F5;">最新动态</h3>
									<marquee id="arc" style="margin-left: 20px;" direction="up" scrollamount="2" onmouseout="this.start()" onmouseover="this.stop()">
							          
							     
									</marquee>
									
								</div>
							</div>
							<div class="thumbnail" style="border-top: 2px solid #114EC9;">
							   <h3 style="">教练招聘</h3>
							   <div  style="margin-left: 20px;">
							       <p id="zp">
								
									</p>
							   </div>
							   <p style="margin-top: 20px;">
								  <a href="ChangeOver/takeinTrainer.do" class="btn btn-primary" role="button">了解更多</a>
								</p>
							</div>
						</li>
						
						<li class="span4" style="width:250px;float:left;margin-left:20px;border-top: 2px solid #114EC9;">
							<div class="thumbnail">
							
								<div class="caption">
									<h3 style="background-color: #F5F5F5;">驾校招生</h3>
									<p id="jp"></p>
									
								</div>
								<p>
								           <a href="ChangeOver/takeinStudent.do" class="btn btn-primary" role="button">了解更多</a>
									</p>
							</div>
						</li>
						<li class="span4" style="width:250px;float:left;margin-left:20px;border-top: 2px solid #114EC9;">
							<div class="thumbnail">
							
								<div class="caption">
									<h3 style="background-color: #F5F5F5;">交通安全宣传</h3>
									<div style="margin-left: 3px;margin-top: -20px;">
									<video id="v" autoplay="autoplay" loop="loop" width="222" height="222" controls="controls">
							
									</video>
									</div>
								
								</div>
							</div>
							<div class="thumbnail" style="border-top: 2px solid #FF0000;">
				
								<div class="caption">
									<h3  style="background-color: #F5F5F5;">通知公告</h3>
									<p id="gp">
								
									</p>
									
								</div>
							     	
							</div>
						</li>

					</ul>
				</div>
			</div>
			
		</div>
		 <div class="container" style="height:300px;width:1050px;border:1px solid #ccc;margin-top: 15px;">
          <div class="row" style="border-top: 2px solid #114EC9;">
			<h3 style="background-color: #F5F5F5;panpadding-left:30px;">教练风采</h3>
			   
			       <c:forEach begin="0" end="5" var="i">
			       <div id="jldiv${i}" style="width:150px;height: 200px;border:1px solid #ccc;display: inline-block;margin-left: 15px;display:none;">
			  
			          <input type="hidden" id="tid${i}">
			         <a href="javascript:void(0)" onclick="showTrainer('#tid${i}')" style="cursor:point;">
			          <img id="timag${i}" style="width:150px;height: 200px;" src="rescourse/imag/xu.jpg">
			           </a>
			          <p style="margin-left: 25px;">
			          <span id="tname${i}">张教练</span> 
			          <span id="year${i}">0年驾龄</span>
			          </p>
			                  
			   
			       </div>
			       </c:forEach> 
			       
			 </div>
			
         </div>
        <div class="container" style="height:250px;width:1050px;border:1px solid #ccc;margin-top: 15px; ">
          <div class="row" style="border-top: 2px solid #114EC9;">
			<h3 style="background-color: #F5F5F5;panpadding-left:30px;">驾考指南</h3>
			 
			      <div class="sdiv" onclick="guide(1)">
			         <h3 style="margin-top: 50px;">科目一</h3>
			     </div>
			       <div  class="sdiv" onclick="guide(2)">
			          <h3 style="margin-top: 50px;">科目二</h3>
			     </div>
			       <div  class="sdiv" onclick="guide(3)">
			           <h3 style="margin-top: 50px;">科目三</h3>
			     </div>
			       <div  class="sdiv" onclick="guide(4)">
			          <h3 style="margin-top: 50px;">科目四</h3>
			     </div>
			       <div  class="sdiv" onclick="guide(5)">
			           <h3 style="margin-top: 50px;">领证</h3>
			     </div>
			</div>
			</div>
        </div>
			


	<script>
		$(function() {
			
			$.post(
			   "Manager/Index.do",
			   {},
			   function(d){
				//   d=eval("("+data+")");
				  // alert($("#v").text());
				   $("#v").attr("src","rescourse/imag/ad/"+d.m2);
				   $("#jp").html(d.m4);
				   $("#gp").html(d.m3);
				   $("#zp").html(d.m5);
				   $("#car1").attr("src","rescourse/imag/ad/"+d.m1[0]);
				   $("#car2").attr("src","rescourse/imag/ad/"+d.m1[1]);
				   $("#car3").attr("src","rescourse/imag/ad/"+d.m1[2]);
				
				   for(var i=0;i<d.m0.length;i++){
					   //alert(d.m0[i].year);
					   $("#jldiv"+i).css("display","inline-block");
					   $("#tid"+i).val(d.m0[i].id);
					   $("#tname"+i).text(d.m0[i].name);
					   $("#year"+i).text(d.m0[i].year+"年驾龄");
					   $("#timag"+i).attr("src","rescourse/imag/user/"+d.m0[i].imag);
				   }
				  
			   },
			   "json"
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
		function showTrainer(obj){
			var tid=$(obj).val();
			//alert(tid);
			window.open("ChangeOver/trainerDetail.do?id="+tid,"_self");
		}
		function repalceHtml(t){
			te=t.replace(/({|})/g,''); //过滤{}
			te=te.replace("&nbsp;",''); //过滤{}
			te=te.replace(/</g,'<'); //置换符号<
			te=te.replace(/>/g,'>'); //置换符号>*/
			te=te.replace(/<\/?[^>]*>/g,''); //*<\/?[^>]*>可以匹配<script></style></body>等，并置空。而不是替换<和>两个符号
			return te;
		}
		function guide(flag){
			window.open("ChangeOver/guide.do?flag="+flag,"_self");
		}
	</script>
</body>
</html>
