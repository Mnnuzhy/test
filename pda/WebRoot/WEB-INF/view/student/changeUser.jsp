<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'changerUser.jsp' starting page</title>
    
  </head>
  
  <body>
    <jsp:include page="../public/head.jsp"></jsp:include>
    <div style="height:578px;width:1055px;margin:0 auto;">
        <jsp:include page="navigation.jsp"></jsp:include> 
	  <div class="major">  
          <div style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;"> 用户信息修改</div>	
		 <div style="display:inline-block;">
		  <div style="line-height:38px;margin-top:20px;">
		      <div> <label class="col-sm-2 control-label" style="text-align:right;width:150px;">联系人：</label>
			  <input style="width:230px;position:relative;" readonly="true" type="text" class="form-control" id="name" value="${user.name}" ></div>
		  </div>
           <div style="line-height:38px;margin-top:15px;">
		      <div> <label class="col-sm-2 control-label" style="text-align:right;width:150px;">身份证号：</label>
			  <input style="width:230px;position:relative;" readonly="true" type="text" class="form-control" id="idnumber"value="${user.idnumber}" ></div>
		  </div>
       
          <div style="line-height:38px;margin-top:15px;">
		      <div> <label class="col-sm-2 control-label" style="text-align:right;width:150px;">注册时间：</label>
			  <input style="width:230px;position:relative;" readonly="true" type="text" class="form-control" id="registerdate" value="${user.registertime}"></div>
		  </div>
          <div style="line-height:38px;margin-top:15px;">
		      <div> <label class="col-sm-2 control-label" style="text-align:right;width:150px;">上次更新时间：</label>
			  <input style="width:230px;position:relative;" readonly="true" type="text" class="form-control" id="updatedate" value="${user.updatetime}"></div>
		  </div>
		  <div id="teldiv" style="line-height:38px;margin-top:15px;">
		      <div> <label class="col-sm-2 control-label" style="text-align:right;width:150px;">电话号码：</label>
			  <input style="width:230px;position:relative;" readonly="true" type="text" class="form-control" id="tel" value="${user.tel}"></div>
		  </div>
          <div id="emaildiv" style="line-height:38px;margin-top:15px;" >
		      <div> <label class="col-sm-2 control-label" style="text-align:right;width:150px;">电子邮箱：</label>
			  <input style="width:230px;position:relative;" readonly="true" type="text" class="form-control" id="email"value="${user.email}" ></div>
		  </div>	  
		  <div style="line-height:38px;margin-top:15px;">
		      <div> <label class="col-sm-2 control-label" style="text-align:right;width:150px;">联系地址：</label>
			  <input style="width:230px;position:relative;" readonly="true" type="text" class="form-control" id="address" value="${user.address}"></div>
		  </div>
		  </div>
		   <div style="width:120px;margin-left:100px;display:inline-block;vertical-align:top;margin-top:20px;">
			  <div style="border:1px solid #ccc;width:122px;height:151px;"> 
			      <img style="width:120px;height:150px;" id="imag" src="rescourse/imag/user/${sessionScope.user.imag}"></img>
		      </div>
			  <div style="margin-top: 20px;display:none;" id="imagdiv">
			   <input type="file" id="file" name="file">
			   </div>
		   </div>
		  
		  <div id="changePanel" style="background-color:#F5F5F5;height:80px;line-height:75px;position:relative;top:20px;padding-left: 150px;"> 
		       <button type="button" class="btn btn-primary" id="change" style="margin-top: 20px;">修改信息</button>
          </div>	
		   <div id="subchangePanel"  style="background-color:#F5F5F5;height:80px;line-height:75px;position:relative;top:20px;padding-left: 150px;display:none;"> 
		       <button type="button" class="btn btn-default" id="calchange">取消</button>
		       <button type="button" class="btn btn-primary" id="subchange">提交修改</button>
          </div>	
          </div>  
      </div>
	
   
    <script>
    var flag = 1;
	var flag1 = 1;
		    $("#tel").blur(function(){
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
		 $("#email").blur(function(){
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
      $(function(){
	   $("li[name='nk']").each(function(i){
	      $(this).click(function(){
		      $(this).css({ "background-color":"white","border-top":"2px solid #114EC9"}).siblings().css({ "background-color":"#F5F5F5","border-top":"0px solid #114EC9"});
			  $(".d1").eq(i).css({"display":"block"}).siblings().css({"display":"none"});
			 });
		});
		
	   $("#change").click(function(){
	       // alert("****");
		    $("#tel").removeAttr("readonly");
		    $("#email").removeAttr("readonly");
		    $("#address").removeAttr("readonly");
	        $("#changePanel").css({"display":"none"});
		    $("#subchangePanel").css({"display":"block"});
		    $("#imagdiv").css({"display":"block"});
	   });
	   
	    $("#calchange").click(function(){
	       // alert("****");
	         $("#tel").attr("readonly","readonly");
		    $("#email").attr("readonly","readonly");
		    $("#address").attr("readonly","readonly");
	        $("#changePanel").css({"display":"none"});
	        $("#changePanel").css({"display":"block"});
		    $("#subchangePanel").css({"display":"none"});
		    $("#imagdiv").css({"display":"none"});
	   });
	    
	    $("#subchange").click(function(){
	    	if(flag==0||flag1==0){
	    		Alert("请正确输入！");
	    		return ;
	    	}
	    	 var tel=$("#tel").val();
			 var email=$("#email").val();
			 var address=$("#address").val();
				$.ajaxFileUpload({
					
					url:"User/upload.do",
					type:"post",
					fileElementId:"file",
					dataType:"text",
					 success: function (data, status){
						// alert(data);
						if(data!=""){
					    	$("#imag").attr("src","rescourse/imag/user/"+data);
						}
					 $.post(
						    		"User/changeUser.do",
						    		{"tel":tel,"email":email,"address":address,"filename":data},
						    		function(data){
						    			Alert("修改成功");
						    		},
						    		"text"
						    	 );
				         },
				});
	    	
	    });
	  });
      function Alert(text) {
			$.alert({
				title : 'Hello',
				columnClass : 'col-md-4 col-md-offset-4',
				content : text,
				confirmButton : '确定',
				animation : 'zoom',
				animationSpeed : 200,
				confirmButtonClass : 'btn-info',
			//  backgroundDismiss:false

			});
		}
   </script>
  </body>
</html>
