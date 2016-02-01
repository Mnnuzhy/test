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
          <div style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;"> 文章添加</div>
           <h3  style="width:200px;line-height:30px;" class="col-sm-2 control-label">文章标题：</h3>
          <div style="margin-top:60px;">
		    <script type="text/plain" id="title" style="width:800px;height:50px;">
  			   </script>
		  </div> 
		   <h3  style="width:200px;line-height:30px;" class="col-sm-2 control-label">文章来源：</h3>
		   <div style="width:500px;">
		   <input type="text" id="author"  class="form-control">
		   </div>
		  <h3  style="width:200px;" class="col-sm-2 control-label">文章正文：</h3>
		  <div class="form-group" style="margin-top:60px;">
			<script type="text/plain" id="content" style="width:800px;height:200px;">  
  			 </script>
		  </div>
		  
		   <div id="changePanel" style="background-color:#F5F5F5;height:40px;line-height:40px;position:relative;top:20px;"> 
		       <button style="margin-left: 20px;" type="button" class="btn btn-primary btn-lg" id="addArticle">添加</button>
          </div>	 
	 </div> 

   </div>

   
    <script>
    
      $(function(){
    	  //实例化编辑器
    	    var um = UM.getEditor('title');
    	    um.addListener('blur',function(){
    	        $('#focush2').html('编辑器失去焦点了');
    	    });
    	    um.addListener('focus',function(){
    	        $('#focush2').html('');
    	    });
    	    um = UM.getEditor('content');
    	    um.addListener('blur',function(){
    	        $('#focush2').html('编辑器失去焦点了');
    	    });
    	    um.addListener('focus',function(){
    	        $('#focush2').html('');
    	    });
	   $("li[name='nk']").each(function(i){
	      $(this).click(function(){
		   
		      $(this).css({ "background-color":"white","border-top":"2px solid #114EC9"}).siblings().css({ "background-color":"#F5F5F5","border-top":"0px solid #114EC9"});
			  $(".d1").eq(i).css({"display":"block"}).siblings().css({"display":"none"});
			 });
		});
	  });
      $("#addArticle").click(function(){
    	  var title=UM.getEditor('title').getContent();
    	  var content=UM.getEditor('content').getContent();
    	  var title1=UM.getEditor('title').getContentTxt();
    	  var content1=UM.getEditor('content').getContentTxt();
    	  var author=$("#author").val();
    	  if(title1.trim()==""||title1.trim()==null||content1.trim()==""||content1.trim()==null||author.trim()==""||author.trim()==null){
    		  Alert("请正确输入！");
    		  return ;
    	  }
    	  $.post(
    		 "Manager/addArticle.do",
    		 {"title":title,"author":author,"content":content},
    		 function(data){
    			 Alert("添加成功！");
    			 $("#author").val("");
    			 UM.getEditor('title').setContent("");
    			 UM.getEditor('content').setContent("");
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
