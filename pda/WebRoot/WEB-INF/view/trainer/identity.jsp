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
    <link href="rescourse/ueditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">

   
  </head>
  
  <body>
   <jsp:include page="../public/head.jsp"></jsp:include>
   <div style="height:850px;width:1055px;margin:0 auto;">
        <jsp:include page="navigation.jsp"></jsp:include> 
	  <div class="major">  
          <div style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;"> 资格认证</div>

		   <div class="form-group" style="margin-top:50px;">
		      <div style="width:300px;height: 200px;border:1px solid #ccc;display:inline-block;vertical-align:top;margin-left: 40px;">
		       <img id="imag1" src="rescourse/imag/trainer/${tr.imag1}" style="width:300px;height: 200px;"></img>
		       <div style="line-height:38px;margin-top:15px;">
		          <label  style="width:100px;float:left;">驾照图片：</label>
		           <input style="width:150px;" type="file" name="file" id="file">
		         </div>
		      </div>
		      
		      <div style="height: 200px;display:inline-block;margin-left: 60px;">
		         <img id="imag2" src="rescourse/imag/trainer/${tr.imag2}" style="width:300px;height: 200px;"></img>
		           <div style="line-height:38px;margin-top:15px;">
		          <label  style="width:100px;float:left;">教练证图片：</label>
		           <input style="width:150px;" type="file" name="file1" id="file1">
		         </div>
		      </div>
		       <div style="width:250px;height: 200px;margin-left: 100px;margin-top: 100px;display:inline-block;vertical-align:top;">
		  
		          <div style="line-height:38px;margin-top:25px;">
			       <label  style="width:80px;float:left;">驾驶年限：</label>
				   <input value="${tr.year}" id="year" style="width:100px;margin-top: 10px;" type="text" class="form-control" id="address">
				   <span style="color:red;width:200px;">格式：YYYY 如：1993</span>
				  </div>
			     
				   <div style="line-height:38px;margin-top:25px;">
			        <button style="margin-left: 30px;" type="button" class="btn btn-success" id="commit">提交</button>
			       </div>
		      </div>
		      <div style="height: 200px;margin-left: 100px;margin-top: 100px;display:inline-block;vertical-align:top;">
		         <c:if test="${sessionScope.user.status!=2}">
		         <h1 id="content" style="color:red;border:2px solid red;">还未认证</h1>
		         </c:if>
		            <c:if test="${sessionScope.user.status==2}">
		         <h1 id="content" style="color:red;border:2px solid red;">已认证</h1>
		         </c:if>
		      </div>
		       
		  </div>
		  
		
	 </div> 

   </div>

   
    <script>
	  $("#commit").click(function(){
		  var content=$("#content").text();
		  if(content=="已认证"){
			  Alert("已通过认证，无需重复提交");
			  return ;
		  }
		  var year=$("#year").val();
		  if(year.trim().length==0){
			  Alert("请正确输入！");
			 return ;
		  }
		  //alert(place);
		  $.ajaxFileUpload({
					
					url:"User/upload0.do",
					type:"post",
					fileElementId:"file",
					dataType:"text",
					 success: function (data, status){
						// alert(data);
						if(data!="")
					    	$("#imag1").attr("src","rescourse/imag/trainer/"+data);
						   $.ajaxFileUpload({	
								url:"User/upload00.do",
								type:"post",
								fileElementId:"file1",
								dataType:"text",
								 success: function (data1, status){
									// alert(data);
									if(data1!="")
								    	$("#imag2").attr("src","rescourse/imag/trainer/"+data1);	
									$.post(
									   "Manager/identity.do",
									   {"imag1":data,"imag2":data1,"year":year},
									   function(data2){
										   Alert("操作成功！");
									   },
									   "text"
									);
								 }
								 });
						
					 }
					 });
	  });
	  function changeArt(obj1){
		  var content=UM.getEditor(obj1).getContent();
		  var content1=UM.getEditor(obj1).getContentTxt();
		  if(content1.trim()==null||content1.trim()==""){
			  Alert("请正确输入！");
			  eturn ;
		  }
		  $.post(
			"Manager/updateTrainerAd.do",
			{"tid":${sessionScope.user.id},"content":content},
			function(data){
			//	alert(data);
				Alert("修改成功！");
				
			},
			"text"
		  );
		  
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
