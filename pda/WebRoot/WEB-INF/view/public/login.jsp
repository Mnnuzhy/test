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
<link href="rescourse/css/jquery-confirm.min.css" rel="stylesheet" />
<script src="rescourse/js/jquery-confirm.min.js"></script>
</head>

<body>
  
   
	<div class="head">
		<div
			style="height:80px;top:16px;position:relative;color:white;font-size:35px;padding-left:200px;line-height:80px;font-family:'Comic Sans MS', cursive, sans-serif;font-weight: bold;">
			<img style="height:100px;width:150px;margin-right:20px;"
				src="rescourse/imag/logo.png" />泰强驾校综合服务管理平台
			<div
				style="height:50px;width:250px;margin-left:850px;margin-top:-60px;font-size:30px;">
				<a href="index.jsp">首页</a>
			</div>
		</div>
	</div>
	<div style="height:500px;width:1055px;margin:0 auto;margin-top:40px;">
		<div style="height:360px;width:1050px;margin:0 auto;">
			<div
				style="height:360px;width:420px;float:left;padding-top:10px;box-shadow:0 0 2px 2px #ccc">
				<h3 style="margin-left:160px;margin-bottom:30px;">用户登陆</h3>
				<form action="User/login.do" method="post" class="form-horizontal" role="form">
					<div class="form-group" style="margin-left:45px;">
						<label style="width:100px;" for="firstname"
							class="col-sm-2 control-label">用户名：</label>
						<div class="col-sm-10" style="width:220px;margin-left:-10px;">
							<input type="text" class="form-control"  name="user"
								placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group" style="margin-left:45px;">
						<label style="width:100px;" for="lastname"
							class="col-sm-2 control-label">密 码：</label>
						<div class="col-sm-10" style="width:220px;margin-left:-10px;">
							<input type="password" class="form-control"  name="password"
								placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group" style="margin-left:45px;">
						<label style="width:100px;" for="lastname"
							class="col-sm-2 control-label">验证码：</label>
						<div class="col-sm-10" style="width:100px;margin-left:-10px;">
							<input style="float:left" type="text"
								class="form-control" name="verifyCode" placeholder="验证码">
						</div>
						<img style="cursor: pointer;width:120px;margin-left: -11px;" id="kaptchaImage" alt="验证码" src="Kaptcha.jpg">
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								
							</div>
						</div>
					</div>
					<div class="form-group" >
						<div class="col-sm-offset-2 col-sm-10">
							<button style="margin-right:20px;" type="submit"
								class="btn btn-primary">登录</button>
							
							<a href="resetPassword.jsp" style="text-decoration:none;">忘记密码？</a>
						</div>
					</div>
				</form>
			</div>
			<div
				style="height:360px;width:620px;border:1px solid #ccc;float:right;box-shadow:0 0 2px 2px #ccc">
				<div class="container" style="width:620px;height:360px;">
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
										<img id="car1" style="width:1150px;height:360px;" />

									</div>
									<div class="item">
										<img id="car2" style="width:1150px;height:360px;"  />

									</div>
									<div class="item">
										<img id="car3" style="width:1150px;height:360px;" />

									</div>
								</div>
								<a data-slide="prev" href="#carousel-423100"
									class="left carousel-control">‹</a> <a data-slide="next"
									href="#carousel-423100" class="right carousel-control">›</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
	   
		$(function(){
			$.post(
					  "Manager/Login.do",
					   {},
					   function(data){
						   d=eval("("+data+")");
						  // alert(data);
					
						   $("#car1").attr("src","rescourse/imag/ad/"+d[0]);
						   $("#car2").attr("src","rescourse/imag/ad/"+d[1]);
						   $("#car3").attr("src","rescourse/imag/ad/"+d[2]);
						  
					   },
					   "text"
					);
			$("#carousel-423100").carousel('cycle');
		    $("#kaptchaImage").click(function () { 
		    	  //  alert("***");
		        	$(this).attr('src', 'Kaptcha.jpg?' + Math.floor(Math.random()*100));
		        	
		        });
		   
		});
		if (${error==-1}) {
			Alert("验证码有误！");
		} else if (${error==1}) {
			Alert("用户名或密码有误！");
		}
		function Alert(text) {
			$.alert({
				title:'Hello',
				columnClass : 'col-md-4 col-md-offset-4',
				content : text,
				confirmButton : '确定',
				animation : 'zoom',
				animationSpeed : 200,
				 confirmButtonClass: 'btn-info'

			});
		}
	</script>
</body>
</html>
