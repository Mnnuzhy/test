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


</head>

<body>
	<jsp:include page="head.jsp"></jsp:include>
	  <div style="height:600px;width:1055px;margin:0 auto;margin-top:40px;">
		   
			<div>
			     <div style="height:40px;border-top:2px solid #114EC9;margin-top:5px;line-height:32px;font-size:18px;padding-left:10px;">
			     <span ></span>教练招聘
			    </div>
			    <div style="padding-top:20px;padding-left:10px;">
				   ${m7}
				
				</div>
				 <div style="height:40px;border-top:2px solid #114EC9;margin-top:5px;background-color:#F5F5F5;line-height:32px;font-size:18px;padding-left:10px;">
			    <span ></span>网上报名
			   </div>
		   <div style="height:400px;margin-top:15px;font-size:15px;">
		     <div style="line-height:38px;margin-top:20px;">
		      <div> <label class="col-sm-2 control-label" style="text-align:right;">姓名：</label>
			  <input style="width:230px;position:relative;float:left;"  type="text" class="form-control" id="tname" >
			  <span id="namespan" style="margin-left:10px;color:#A94442;">
								* </span>
			  </div>
		  </div>
          <div style="line-height:38px;margin-top:15px;">
		      <div id="idnumberdiv"> <label class="col-sm-2 control-label" style="text-align:right;">身份证号：</label>
			  <input style="width:230px;position:relative;float:left;"  type="text" class="form-control" id="tidnumber" >
			   <span id="idnumberspan" style="margin-left:10px;color:#A94442;">
								* </span>
			  </div>
		  </div>
		      <div style="line-height:38px;margin-top:20px;">
		      <div> <label class="col-sm-2 control-label" style="text-align:right;">身份信息：</label>
			  <input type="file" name="file" id="file" >
			   <span  style="margin-left:10px;color:#A94442;">
								身份信息用于身份证信息的验证 ，请将身份证正面拍照上传</span>
			  </div>
		  </div>
		  <div style="line-height:38px;margin-top:30px;">
		   <label class="col-sm-2 control-label" style="text-align:right;">性别：</label>
		   <label class="checkbox-inline">
			  <input type="radio" name="sex"
				 value="男" checked> 男
		   </label>
		   <label class="checkbox-inline">
			  <input type="radio" name="sex"
				 value="女"> 女
		   </label>
        </div>
		    <div id="teldiv" style="line-height:38px;margin-top:15px;">
		      <div> <label class="col-sm-2 control-label" style="text-align:right;">联系号码：</label>
			  <input style="width:230px;position:relative;float:left;"  type="text" class="form-control" id="ttel" >
			  <span id="telspan" style="margin-left:10px;color:#A94442;">
								* </span>
			  </div>
		  </div>
		  
		   <div id="emaildiv" style="line-height:38px;margin-top:15px;">
		      <div> <label class="col-sm-2 control-label" style="text-align:right;">邮箱：</label>
			  <input style="width:230px;position:relative;float:left;"  type="text" class="form-control" id="temail" >
			  <span id="emailspan" style="margin-left:10px;color:#A94442;">
								* </span>
			  </div>
		  </div>
		  <div style="line-height:38px;margin-top:15px;">
		          <div> <label class="col-sm-2 control-label" style="text-align:right;">备注：</label>
				  <textarea style="width:400px;" class="form-control" rows="4" id="tremark"></textarea>
				  </div>
				  </div>
		    <div id="changePanel" style="background-color:#F5F5F5;height:80px;line-height:75px;position:relative;top:20px;padding-left:180px;"> 
		         <button type="button" class="btn btn-success" id="register">提交</button>
				 <button type="button" class="btn btn-default" id="cancle" style="margin-left:20px;">取消</button>
                </div>	 
		  </div>
		   <div style="margin-left:300px;" id="Pagination"></div>	  
          </div>
	  </div>
	

	<script>
	 var flag = 0;
	  var flag1 = 0;
	  var flag2 = 0;
			    $("#ttel").blur(function(){
					if($(this).val()==null||$(this).val()==""){
						return ;
					}
				 var tel=$(this).val();	 
				// alert(tel);
				 var bValidate = RegExp(/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/).test(tel);  
				     if (bValidate) {  	
					   $("#teldiv").removeClass("has-error");
					   flag=1;
				    }  
				    else{
				         $("#teldiv").addClass("has-error");
				         flag=0; 
				    } 
				        
			 });
			 $("#temail").blur(function(){
					if($(this).val()==null||$(this).val()==""){
						return ;
					}
				 var email=$(this).val();
				// alert("1111");
				 var bValidate = RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(email);  
				  if (bValidate) {  
					  $("#emaildiv").removeClass("has-error");
					   flag1=1; 
				    }  
				    else  {
				    	 $("#emaildiv").addClass("has-error");
					     flag1=0; 
			
				    }	 
			 });
	  $("#register").click(function(){
			
		  var name=$("#tname").val();
		  var idnumber=$("#tidnumber").val();
		  var sex=$("input:checked").val();
		  var tel=$("#ttel").val();
		  var remark=$("#tremark").val();
		  var file=$("#file").val();
		  var email=$("#temail").val();
		  if(name.trim().length==0||idnumber.trim().length==0||tel.trim().length==0||email.trim().length==0||file.length==0||flag==0||flag1==0||flag2==0){
			  alert("请正确输入！");
			  return;
		  }
		  $.ajaxFileUpload({
				
				url:"User/upload1.do",
				type:"post",
				fileElementId:"file",
				dataType:"text",
				 success: function (data, status){
					// alert(data);
		  $.post(
			"Manager/takeinTrainer.do",
			{"name":name,"idnumber":idnumber,"sex":sex,"tel":tel,"email":email,"remark":remark,"idimag":data},
			function(data){
				alert("报名成功！");
				$("#tname").val("");
				$("#tidnumber").val("");
				$("#ttel").val("");
				$("#tremark").val("");
			},
			"text"
		  );
			 }
		 });
	  });
	  $("#cancle").click(function(){
			$("#tname").val("");
			$("#tidnumber").val("");
			$("#ttel").val("");
			$("#tremark").val("");
	  });
	  $("#tidnumber").blur(function(){
			if($(this).val()==null||$(this).val()==""){
				return ;
			}
			
	    	$.post(
	    		"User/varify.do",
	    		{"idnumber":$(this).val()},
	    		function(data){
	    			//alert(data);
	    			 if(data!=-1){
		    			  $("#idnumberdiv").addClass("has-error");
		    			  $("#idnumberspan").text("该身份证已被使用！");
		    			  flag2=0;
		    			}
	    			 else{
	    				 $("#idnumberdiv").removeClass("has-error");
		    			 $("#idnumberspan").text("*");
		    			 flag2=1;
	    			 }
	    		},
	    		"text"
	    	);
	    });
	  
	</script>
</body>
</html>
