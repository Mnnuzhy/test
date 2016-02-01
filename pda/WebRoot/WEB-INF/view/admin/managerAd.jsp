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
          <div style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;"> 广告管理</div>
          
           <h4  style="width:200px;line-height:30px;" class="col-sm-2 control-label">广告类型：</h4>
          <div style="margin-top:60px;">
            <input type="hidden" id="id" value="8">
		      <select  class="form-control" style="width:230px;" id="type">
								         <option>招生页面</option>
								         <option>教练招聘页面</option>
								        
								      </select>
		  </div> 
		  
		  <h4  style="width:200px;margin-top: 20px;" class="col-sm-2 control-label">内容：</h4>
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
		  var id=$("#id").val();
		 $.post(
		    "Manager/getAd.do",
		    {"id":id},
		    function(data){
		    	//alert(data);
		    	um.setContent(data);
		    },
		    "text"
		 );
	  }
	  function changeArt(obj1){
		  var id=$("#id").val();
		  var content=UM.getEditor(obj1).getContent();
		  var content1=UM.getEditor(obj1).getContentTxt();
		/*  if(content1.trim()==null||content1.trim()==""){
			  Alert("请正确输入！");
			  return ;
		  }*/
		  $.post(
			"Manager/updateAd.do",
			{"id":id,"name":content},
			function(data){
			//	alert(data);
				Alert("修改成功！");
				
			},
			"text"
		  );
		  
	}
	  $("#type").click(function(){
		 
			var type=$(this).val();
			if(type=="招生页面"){
			  $("#id").val(8);
			  ShowArt();
	
			}
			else{
			   $("#id").val(9);
			   ShowArt();
			  
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
