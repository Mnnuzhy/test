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
	<div style="height:600px;width:1055px;margin:0 auto;margin-top:40px;">
		<div
			style="height:40px;border-top:2px solid #ccc;margin-top:5px;background-color:#F5F5F5;line-height:32px;font-size:18px;padding-left:10px;">
			<span class="glyphicon glyphicon-user"></span>找回密码
		</div>
		<div>
		  <form action="User/findPassword.do" method="post">
			<div style="line-height:38px;margin-top:20px;">
				<div>
					<label class="col-sm-2 control-label" style="text-align:right;">身份证号：</label>
					<input style="width:230px;position:relative;" type="text" id="idnumber"
						class="form-control" name="idnumber" placeholder="请输入原密码">
				</div>
				<div style="margin-top: 30px;">
				<label class="col-sm-2 control-label" style="text-align:right;">验证码：</label>
						<input style="width:100px;position:relative;float: left;" type="text" id="verifyCode"
						class="form-control" name="verifyCode" placeholder="验证码">
					  <img style="cursor: pointer;width:120px;margin-left: 10px;" id="kaptchaImage" alt="验证码" src="Kaptcha.jpg">
				</div>
			</div>
			<div 
				style="background-color:#F5F5F5;height:80px;line-height:75px;position:relative;top:80px;">
				<button type="submit" style="margin-top: 20px;margin-left: -80px;"class="btn btn-success" >提交</button>
			</div>
			</form>
		</div>
	</div>
	
	<script>
	$(function(){
		if (${error==-1}) {
			Alert("验证码有误！");
		}
		else if (${error==1}) {
			Alert("账户不存在！");
		}
	});
	 $("#kaptchaImage").click(function () { 
   	  //  alert("***");
       	$(this).attr('src', 'Kaptcha.jpg?' + Math.floor(Math.random()*100));  	
       });
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
