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
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="rescourse/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <script src="rescourse/js/jquery-1.8.2.min.js"></script>
   <script src="rescourse/bootstrap/js/bootstrap.min.js"></script>
   <link href="rescourse/css/main.css" rel="stylesheet"/>
   <link href="rescourse/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet"/>
  </head>
  
  <body>
   <jsp:include page="../public/head.jsp"></jsp:include>
  <div style="height:578px;width:1055px;margin:0 auto;">
      <jsp:include page="navigation.jsp"></jsp:include> 
	 <div class="major">  
          <div style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;"> 修改密码</div>	
		  <div>
		  <div style="line-height:38px;margin-top:20px;height: 30px;">
		      <div id="oldpassdiv"> <label class="col-sm-2 control-label" style="text-align:right;">原密码：</label>
			  <input style="width:230px;position:relative;float:left;"  type="password" class="form-control" id="oldpassword" placeholder="请输入原密码">
			 <span id="oldpasswordErr" style="margin-left:10px;color:#A94442;">
			       * 
			   </span>
			  </div>
		  </div>
          <div style="line-height:38px;margin-top:15px;height: 30px;">
		      <div id="passdiv"> <label class="col-sm-2 control-label" style="text-align:right;">新密码：</label>
			  <input id="password" style="width:230px;position:relative;float:left;"  type="password" class="form-control" placeholder="请输入新密码">
			   <span id="passwordErr" style="margin-left:10px;color:#A94442;">
			       * 
			   </span>
			  </div>
		  </div>
           <div style="line-height:38px;margin-top:15px;">
			  <span style="margin-left:150px;">
			  提示：密码要求包含大写字母、小写字母、数字和特殊字符中的两种及以上且长度大于6
			  </span>
			</div>
           <div style="line-height:38px;margin-top:15px;">
		      <div> <label class="col-sm-2 control-label" style="text-align:right;">密码强度：</label>
			 <span id="enough" style="font-size:15px;padding:5px 20px 5px 20px;background-color:#F7DAD7;" >弱</span>
			 <span id="medium" style="font-size:15px;padding:5px 20px 5px 20px;background-color:#FEEFD9;" >中</span>
			 <span id="strong" style="font-size:15px;padding:5px 20px 5px 20px;background-color:#D6EEDA;" >强</span>
			
		  </div>
          <div id="comfirmdiv" style="line-height:38px;margin-top:15px;height: 30px;">
		      <div> <label class="col-sm-2 control-label" style="text-align:right;">确认密码：</label>
			  <input id="comfirmPassword" style="width:230px;position:relative;float:left;"  type="password" class="form-control" placeholder="请确认密码">
			   <span id="comfirmErr" style="margin-left:10px;color:#A94442;">
			        *
			   </span>
			  </div>
		  </div>
		  </div>
		  
		  <div id="changePanel" style="background-color:#F5F5F5;height:80px;line-height:75px;margin-top: 40px;padding-left: 150px;padding-top: 21px;"> 
		       <button type="button" class="btn btn-primary" id="change">修改密码</button>
          </div>	  
      </div>
	  </div>
	  </div>
    
    <script>
       var flag=0;
       var oldpass=0;
       var newpass=0;
       var cfpass=0;
       $("#oldpassword").blur(function(){
    	   if($(this).val()==""||$(this).val()==null){
    		   oldpass=0;
    	      $("#oldpassdiv").addClass("has-error");
			  $("#oldpasswordErr").text("密码不能为空");
            }
    	   else{ 
    		   $("#oldpassdiv").removeClass("has-error");
    		   $("#oldpasswordErr").text("");
    		   oldpass=1;
    	   }
       });
	   $("#password").click(function(){
	       $("#passdiv").removeClass("has-error");
	   });
	   $("#password").keyup(function(){
		  var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g"); 
		  var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g"); 
		  var enoughRegex = new RegExp("(?=.{6,}).*", "g"); 
		  if(enoughRegex.test($(this).val())==false){
		    // alert("密码小于6");
			  $("#enough").css({"background-color":"#F7DAD7"});
			  $("#medium").css({"background-color":"#FEEFD9"});
			  $("#strong").css({"background-color":"#D6EEDA"});
			  flag=0;
		  }
       else if(strongRegex.test($(this).val())){
		     // alert("强");
			  $("#enough").css({"background-color":"#D64937"});
			  $("#medium").css({"background-color":"#FAAB3B"});
			  $("#strong").css({"background-color":"#35AA47"});
			   flag=1;
		  }
		  else if(mediumRegex.test($(this).val())){
		     //  alert("中");
			 $("#enough").css({"background-color":"#D64937"});
			 $("#medium").css({"background-color":"#FAAB3B"});
			 $("#strong").css({"background-color":"#D6EEDA"});
			 flag=1;
		  }
		  else{
		     //  alert("弱");
			 $("#enough").css({"background-color":"#D64937"});
			 $("#medium").css({"background-color":"#FEEFD9"});
			 $("#strong").css({"background-color":"#D6EEDA"});
			 flag=0;
		  }
	   });
	   $("#password").blur(function(){
		  // alert(flag);
	        if(flag==0){
	          $("#passdiv").addClass("has-error");
			  $("#passwordErr").text("密码格式不符合要求");
			  newpass=0;
			  }
		   else{
			  if($("#password").val()!= $("#comfirmPassword").val()){
				  $("#comfirmdiv").addClass("has-error");
				  $("#comfirmErr").text("密码不一致");
				  newpass=0;
			  }
			  else{
	          $("#passdiv").removeClass("has-error");
			  $("#passwordErr").text("*");
			//  flag=0;
			  newpass=1;
			  }
			  }
	   });
	   
	    $("#comfirmPassword").blur(function(){
        if($(this).val()!=$("#password").val()){
		      //alert("密码不一致");
			  $("#comfirmdiv").addClass("has-error");
			  $("#comfirmErr").text("密码不一致");
			  cfpass=0;
		   }
		   else{
		      $("#comfirmdiv").removeClass("has-error");
			  $("#comfirmErr").text("");
			  cfpass=1;

		   }
	   });
	    $("#change").click(function(){
	    	if(oldpass==1&&newpass==1&&cfpass==1){
	    		$.post(
	    		  "User/changePassword.do",		
	    		  {"oldpassword":$("#oldpassword").val(),"newpassword":$("#password").val()},
	    		  function(data){
	    			  if(data==0)
	    				Alert("密码错误！");
	    			  else{
	    				  $("#oldpassword").val("");
	    				  $("#password").val("");
	    				  $("#comfirmPassword").val("");
	    				  $("#enough").css({"background-color":"#F7DAD7"});
	    				  $("#medium").css({"background-color":"#FEEFD9"});
	    				  $("#strong").css({"background-color":"#D6EEDA"});
	    				  Alert("修改成功！");
	    			  }
	    		  },
	    		  "text"
	    		);
	    	}	
	    	else{
	    		Alert("请正确输入！");
	    	}
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
