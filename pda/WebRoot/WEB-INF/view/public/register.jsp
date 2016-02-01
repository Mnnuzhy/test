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
	<div style="height:700px;width:1055px;margin:0 auto;margin-top:40px;">
	 <div id="maindiv">
		<div
			style="height:40px;border-top:2px solid #ccc;margin-top:5px;background-color:#F5F5F5;line-height:32px;font-size:18px;padding-left:10px;">
			<span class="glyphicon glyphicon-user"></span>个人用户注册
		</div>
		<div>
			<div style="line-height:38px;margin-top:20px;">
				<div id="idnumberdiv">
					<label class="col-sm-2 control-label" style="text-align:right;">身份证号：</label>
					<input style="width:230px;position:relative;float:left;" type="text"
						class="form-control" id="idnumber" name="idnumber" placeholder="请输入身份证号">
				</div>
				<span id="idnumberspan" style="margin-left:10px;color:#A94442;">
								* </span>
						
			</div>
			
			<div style="line-height:38px;margin-top:15px;">
				<div id="teldiv">
					<label class="col-sm-2 control-label" style="text-align:right;">手机号码：</label>
					<input style="width:230px;position:relative;float:left" type="text"
						class="form-control" id="tel" name="tel" placeholder="请输入手机号码">
				</div>
				<span id="telspan" style="margin-left:10px;color:#A94442;">
								* </span>
					
			</div>
			<div style="line-height:38px;margin-top:15px;">
				<div id="emaildiv">
					<label class="col-sm-2 control-label" style="text-align:right;">电子邮箱：</label>
					<input style="width:230px;position:relative;float:left;" type="email"
						class="form-control" id="email" name="email" placeholder="请输入电子邮箱">
				</div>
				<span id="emailspan" style="margin-left:10px;color:#A94442;">
								* </span>
				
			</div>
			<div style="line-height:38px;margin-top:15px;">
				<div id="passdiv">
					<label class="col-sm-2 control-label" style="text-align:right;">密码：</label>
					<input id="password"
						style="width:230px;position:relative;float:left;" type="password"
						class="form-control" name="password" placeholder="请输入密码">
					<span id="passwordErr" style="margin-left:10px;color:#A94442;">
                       *
					</span>
				</div>
			</div>
			<div style="line-height:38px;margin-top:15px;">
				<span style="margin-left:150px;">
					提示：密码要求包含大写字母、小写字母、数字和特殊字符中的两种及以上且长度大于6 </span>
			</div>
			<div style="line-height:38px;margin-top:15px;">
				<div>
					<label class="col-sm-2 control-label" style="text-align:right;">密码强度：</label>
					<span id="enough"
						style="font-size:15px;padding:5px 20px 5px 20px;background-color:#F7DAD7;">弱</span>
					<span id="medium"
						style="font-size:15px;padding:5px 20px 5px 20px;background-color:#FEEFD9;">中</span>
					<span id="strong"
						style="font-size:15px;padding:5px 20px 5px 20px;background-color:#D6EEDA;">强</span>

				</div>
				<div id="comfirmdiv" style="line-height:38px;margin-top:15px;">
					<div>
						<label class="col-sm-2 control-label" style="text-align:right;">确认密码：</label>
						<input id="comfirmPassword"
							style="width:230px;position:relative;float:left;" type="password"
							class="form-control" id="inputPassword" placeholder="请确认密码">
						<span id="comfirmErr" style="margin-left:10px;color:#A94442;">
							* </span>
					</div>
				</div>
			</div>
            <div style="line-height:38px;margin-top:15px;height: 50px;">
				<div id="emaildiv">
					<label class="col-sm-2 control-label" style="text-align:right;">选择身份：</label>
					 <select class="form-control" id="role" style="width:100px;float:left;">
			         <option value="3">学员</option>
			         <option value="2">教练员</option>
		
			      </select>
			
				<span id="emailspan" style="margin-left:10px;color:#A94442;">
								* </span>
				
			</div>
			</div>
			<div id="changePanel"
				style="background-color:#F5F5F5;height:80px;line-height:75px;position:relative;top:20px;padding-left:180px;">
				<button type="button" style="margin-top: 20px;" class="btn btn-success" id="register">注册</button>
			</div>
		</div>
		</div>
		 <div id="successdiv" class="container" style="width:1055px;display:none;">
		  <div class="jumbotron" style="box-shadow:0 0 2px 2px #888888"">
		   <div class="container">
		      <h1>恭喜您，注册成功！</h1>
		      <p>祝您早日拿到驾照！！！</p>
		      <p><a class="btn btn-primary btn-lg" role="button" href="login.jsp">
		                    返回登陆</a>
		      </p>
		   </div>
		</div>
</div>
	</div>
	
	<script>
		var flag = 0;
		var flag1 = 0;
		var flag2 = 0;
		var flag3 = 0;
		var flag4 = 0;
		$("#password").click(function() {
			$("#passdiv").removeClass("has-error");
		});
		$("#password")
				.keyup(
						function() {
							var strongRegex = new RegExp(
									"^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$",
									"g");
							var mediumRegex = new RegExp(
									"^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$",
									"g");
							var enoughRegex = new RegExp("(?=.{6,}).*", "g");
							if (enoughRegex.test($(this).val()) == false) {
								// alert("密码小于6");
								$("#enough").css({
									"background-color" : "#F7DAD7"
								});
								$("#medium").css({
									"background-color" : "#FEEFD9"
								});
								$("#strong").css({
									"background-color" : "#D6EEDA"
								});
								flag = 0;
							} else if (strongRegex.test($(this).val())) {
								// alert("强");
								$("#enough").css({
									"background-color" : "#D64937"
								});
								$("#medium").css({
									"background-color" : "#FAAB3B"
								});
								$("#strong").css({
									"background-color" : "#35AA47"
								});
								flag = 1;
							} else if (mediumRegex.test($(this).val())) {
								//  alert("中");
								$("#enough").css({
									"background-color" : "#D64937"
								});
								$("#medium").css({
									"background-color" : "#FAAB3B"
								});
								$("#strong").css({
									"background-color" : "#D6EEDA"
								});
								flag = 1;
							} else {
								//  alert("弱");
								$("#enough").css({
									"background-color" : "#D64937"
								});
								$("#medium").css({
									"background-color" : "#FEEFD9"
								});
								$("#strong").css({
									"background-color" : "#D6EEDA"
								});
								flag = 0;
							}
						});
		$("#password").blur(function() {
			if($(this).val()==null||$(this).val()==""){
				return ;
			}
			if (flag == 0) {
				$("#passdiv").addClass("has-error");
				$("#passwordErr").text("密码格式不符合要求");
			} else {
				$("#passdiv").removeClass("has-error");
				$("#passwordErr").text("*");
				flag = 1;
			}
		});

		$("#comfirmPassword").blur(function() {
			if ($(this).val() != $("#password").val()) {
				//alert("密码不一致");
				$("#comfirmdiv").addClass("has-error");
				$("#comfirmErr").text("密码不一致");
				flag
			} else {
				$("#comfirmdiv").removeClass("has-error");
				$("#comfirmErr").text("*");
				flag1 = 1;
			}
		});
		 $("#idnumber").blur(function(){
				if($(this).val()==null||$(this).val()==""){
					return ;
				}
		    	$.post(
		    		"User/varify.do",
		    		{"idnumber":$(this).val()},
		    		function(data){
		    			//alert(data);
		    			if(data==2){
		    			  $("#idnumberdiv").addClass("has-error");
		    			  $("#idnumberspan").text("該用戶已注册");
		    			  flag2=0;
		    			}
		    			else if(data==1){
		    				$("#idnumberdiv").removeClass("has-error");
			    			 $("#idnumberspan").text("*");
			    			 flag2=1;
			    		}
		    			else if(data==0){
			    			  $("#idnumberdiv").addClass("has-error");
			    			  $("#idnumberspan").text("該用戶还未审核");
			    			  flag2=0;
			    			}
		    			else if(data==-1){
			    			  $("#idnumberdiv").addClass("has-error");
			    			  $("#idnumberspan").text("該用戶还未录入系统");
			    			  flag2=0;
			    			}
		    		},
		    		"text"
		    	);
		    });
		 $("#tel").blur(function(){
				if($(this).val()==null||$(this).val()==""){
					return ;
				}
			 var tel=$(this).val();
			 
			// alert(tel);
			 var bValidate = RegExp(/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/).test(tel);  
       	     if (bValidate) {  
       	    	
   			   $("#teldiv").removeClass("has-error");
 			   $("#telspan").text("*");
 			   flag3=1;
       	    }  
       	    else{
       	         $("#teldiv").addClass("has-error");
			     $("#telspan").text("格式错误");
			     flag3=0; 
       	    } 
       	        
		 });
         $("#email").blur(function(){
        		if($(this).val()==null||$(this).val()==""){
    				return ;
    			}
        	 var email=$(this).val();
        	// alert("1111");
        	 var bValidate = RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(email);  
        	  if (bValidate) {  
        		  $("#emaildiv").removeClass("has-error");
    			   $("#emailspan").text("*");
    			   flag4=1; 
        	    }  
        	    else  {
        	    	 $("#emaildiv").addClass("has-error");
    			     $("#emailspan").text("格式错误");
    			     flag4=0; 

        	    }
        	       

			 
		 });
         $("#register").click(function(){
        	// alert(flag);
        	 var idnumber=$("#idnumber").val();
        	 var tel=$("#tel").val();
        	 var email=$("#email").val();
        	 var password=$("#password").val();
        	 var role=$("#role").val();
        	// alert(role);
        	 if(flag==0||flag1==0||flag2==0||flag3==0||flag4==0){
        		 Alert("请正确输入！");
        		 return ;
        	 }
        	 $.post(
        	     "User/register.do",
        	     {"idnumber":idnumber,"tel":tel,"email":email,"password":password,"role":role},
        	     function(data){
        	    	// alert(data);
        	    	 if(data==-1)
        	    		 Alert("您的用户身份与登记的不符合！");
        	    	 else{
        	    		$("#idnumber").val("");
        	        	$("#tel").val("");
        	        	 $("#email").val("");
        	        	 $("#password").val("");
        	        	 $("#confirmpassword").val("");
        	    		 $("#maindiv").css("display","none");
        	    		 $("#successdiv").css("display","block");
        	    	 }
        	     },
        	     "text"
        	 );
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
