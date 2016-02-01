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
          <div style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;"> 招生宣传</div>
		  <h4  style="width:200px;margin-top: 20px;" class="col-sm-2 control-label">个人宣传主页</h4>
		   <div class="form-group" style="margin-top:50px;">
		      <div style="width:300px;height: 200px;border:1px solid #ccc;display:inline-block;vertical-align:top;margin-left: 20px;">
		      <img id="imag"  style="width:300px;height: 200px;"></img>
		      </div>
		      
		      <div style="height: 200px;display:inline-block;margin-left: 40px;">
		         <div style="line-height:38px;margin-top:15px;">
		          <label  style="width:50px;float:left;">图片：</label>
		           <input type="file" name="file" id="file">
		         </div>
		          <div style="line-height:38px;margin-top:25px;">
			       <label  style="width:50px;float:left;">价格：</label>
				   <input id="price" style="width:100px;margin-top: 10px;" type="text" class="form-control" id="address">
				  </div>
			      <div style="line-height:38px;margin-top:25px;">
			       <label  style="width:50px;float:left;">地区：</label>
				   <input id="place" style="width:100px;margin-top: 10px;" type="text" class="form-control" id="address">
				  </div>
				   <div style="line-height:38px;margin-top:25px;">
			        <button style="margin-left: 30px;" type="button" class="btn btn-success" id="subchange">提交修改</button>
			       </div>
		      </div>
		       
		  </div>
		  
		 <div class="form-group" style="margin-top:50px;">
			<script type="text/plain" id="content" style="width:800px;height:200px;">  
  		     </script>
		  </div>
		  
		   <div id="changePanel" style="background-color:#F5F5F5;height:40px;line-height:40px;position:relative;top:20px;"> 
		       <button style="margin-left: 20px;" type="button" class="btn btn-primary btn-lg" onclick="changeArt('content')">修改</button>
          </div>	 
	 </div> 

   </div>

   
    <script>
    var um = UM.getEditor('content');
      $(function(){
    	  //实例化编辑器
    	  ///alert("****");
    	    ShowArt();
    	    
      });
	  function ShowArt(){
		 $.post(
		    "Manager/trainerAd.do",
		    {"tid":${sessionScope.user.id}},
		    function(data){
		    	//alert(data);
		    	um.setContent(data.instruction);
		    	$("#imag").attr("src","rescourse/imag/trainer/"+data.imag);
		    	$("#place").val(data.place);
		    	$("#price").val(data.price);
		    },
		    "json"
		 );
	  }
	  $("#subchange").click(function(){
		  var place=$("#place").val();
		  var price=$("#price").val();
		  if(place.trim().length==0||price.trim().length==0){
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
					    	$("#imag").attr("src","rescourse/imag/trainer/"+data);
					    	$.post(
					    	  "Manager/updateTrainerAd1.do",
					    	  {"place":place,"price":price,"imag":data},
					    	  function(data){
					    		  Alert("修改成功！");
					    	  },
					    	  "text"
					    	);
						
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
