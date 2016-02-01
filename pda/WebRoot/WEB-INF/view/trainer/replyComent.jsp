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
    
  </head>
  
  <body>
   <jsp:include page="../public/head.jsp"></jsp:include>
   <div style="height:750px;width:1055px;margin:0 auto;">
        <jsp:include page="navigation.jsp"></jsp:include> 
	  <div class="major">  
          <div style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;"> 处理留言</div>	
          <div id="replyPanel" style="display:none;">		  
		  <div class="form-group" style="margin-top:30px;">
			<textarea class="form-control" rows="3" id="content"></textarea>
		  </div>
		  
		  <div style="padding-left: 10px;">     
		       <input type="hidden" id="replyid"> 
		       <button type="button" class="btn btn-primary" id="subreply">回复留言</button>
			   <button type="button" class="btn btn-default" id="cancle">取消</button>
          </div>	 
		  </div>
		  <div style="height:42px;margin-top: 30px;box-shadow:0 0 2px 2px #ccc">
					<ul class="nak" style="">
					   <li name="nk" style="background-color:white;border-top:2px solid #114EC9">学员问答</li>
					   <li name="nk">游客问答</li>
					</ul>
			 </div>
			<div>
		  <div class="d1" style="height:400px;margin-top:15px;font-size:15px;">
		   <c:forEach begin="0" end="3" var="i">
		   <div id="comentdiv${i}" style="border-top:1px solid #ccc;height:100px;padding-left:20px;padding-top: 10px;]">
		     <input type="hidden" id="comentid${i}">
		     <div style="width:750px;height:50px;">
		      <div id="sdiv${i}"></div>
			  <div id="tdiv${i}" style="color:#F25F08;margin-top: 10px;"></div>
			  </div>
			   <div style="float:right;position:relative;bottom:50px;right:5px;height: 20px;"> 
		       <button type="button" class="btn btn-default" onclick="replyComent(${i})" name="reply" >回复</button>
              </div>
		  </div>
		  </c:forEach>
		   <div style="margin-left:300px;" id="Pagination">
		   </div>
		  </div>
		  
		   <div class="d1" style="height:400px;margin-top:15px;font-size:15px;display:none;">
		   <c:forEach begin="0" end="3" var="i">
		   <div id="ycomentdiv${i}" style="border-top:1px solid #ccc;height:100px;padding-left:20px;padding-top: 10px;]">
		     <input type="hidden" id="ycomentid${i}">
		     <div style="width:750px;height:50px;">
		      <div id="ysdiv${i}"></div>
			  <div id="ytdiv${i}" style="color:#F25F08;margin-top: 10px;"></div>
			  </div>
			   <div style="float:right;position:relative;bottom:50px;right:5px;height: 20px;"> 
		       <button type="button" class="btn btn-default" onclick="replyComent(${i})" name="reply1" >回复</button>
              </div>
		  </div>
		   
		  </c:forEach>
		   <div style="margin-left:300px;" id="Pagination_1">
		   </div>
		  </div>
		  	  </div>
      </div>
	  </div>

   
    <script>
	     $(function(){
	    	 $("li[name='nk']").each(function(i) {
					$(this).click(function() {

						$(this).css({
							"background-color" : "white",
							"border-top" : "2px solid #114EC9"
						}).siblings().css({
							"background-color" : "#F5F5F5",
							"border-top" : "0px solid #114EC9"
						});
						$(".d1").eq(i).css({
							"display" : "block"
						}).siblings().css({
							"display" : "none"
						});
					});
				});
			
	      	   pagination(${rowCount});
	      	   pageselectCallback(0);
	      	   pagination_1(${rowCount_1});
	           pageselectCallback_1(0);
	      	 //  alert(${sessionScope.user.id});
	      	  $("#subreply").click(function(){
	      		  var id=$("#replyid").val();
	      		  var content=$("#content").val();
	      		  if(content==""||content==null){
	      			  Alert("内容不能为空！");
	      			  return ;
	      		  }
	              $.post(
	            	"Coment/replyComent.do",
	            	{"id":id,"tid":${sessionScope.user.id},"content":content},
	            	function(data){
	            	//	alert(data);
	            	    Alert("回复成功！");
	            		pageselectCallback(0);
	            		pageselectCallback_1(0);
	            	},
	            	"text"
	              );
	      		   $("#content").val("");
	      	  });
		    $("button[name='reply']").each(function(i){
		       $(this).click(function(){
			    $("#replyPanel").css({"display":"block"});
			    var coment=$("#comentid"+i).val();
			    $("#replyid").val(coment);
			 });
		      
			 });
		    
		    $("button[name='reply1']").each(function(i){
			       $(this).click(function(){
				    $("#replyPanel").css({"display":"block"});
				    var coment=$("#ycomentid"+i).val();
				    $("#replyid").val(coment);
				 });
			      
				 });
			  $("#cancle").click(function(){
			    $("#replyPanel").css({"display":"none"});
			 });
		 
		 });
	     $('.form_date').datetimepicker({
		      minView: 2, //选择日期后，不会再跳转去选择时分秒 
			  format: "yyyy-mm-dd", //选择日期后，文本框显示的日期格式 
			  language: 'zh-CN',/*加载日历语言包，可自定义*/
			  weekStart: 1,
			  todayBtn: 1,
			  autoclose: 1,
			  todayHighlight: 1,
			  startView: 2,
			  forceParse: 0
				});
	     function pagination(rowCount)
		    {
		           $("#Pagination").pagination(rowCount, {
	                    callback: pageselectCallback,
	                    items_per_page:4,// Show only one item per page
						prev_text:"上一页",
						next_text:"下一页",
					
						num_display_entries:2,
						num_edge_entries:3,
				
						
	                });
		    }
			function pageselectCallback(page_index){
				    $.post(
				      "Coment/comentPage.do",
				      {"pageNow":page_index, "flag":1},
				      function(data){
				    	  for(var i=0;i<4;i++){
				    		  $("#comentdiv"+i).css("display","none");
				    		  $("#sdiv"+i).text("");
				    		  $("#tdiv"+i).text("");
				    	  }
				    	  for(var i=0;i<data.length;i++){
				    	    // alert(data[0].sname);
				    	   
				    	   //    alert(data[i].id);
				    	   	  $("#comentdiv"+i).css("display","block");
				    	     $("#comentid"+i).val(data[i].id);
				    	    $("#sdiv"+i).text("["+data[i].comentdate+"]"+data[i].sname+"问："+data[i].coment);
				    	    if(data[i].tname!=null){
				    	       $("#tdiv"+i).text("["+data[i].replydate+"]"+data[i].tname+"  回答："+data[i].replycoment);
				    	     
				    	    }
				    	      else{
				    	    	$("#tdiv"+i).text("");
				    	    	$("#cid"+i).val("");
				    	      }
				    	  }
				    	
				      },
				      "json"
				    );
	                return false;
	            }
			
			 function pagination_1(rowCount)
			    {
			           $("#Pagination_1").pagination(rowCount, {
		                    callback: pageselectCallback_1,
		                    items_per_page:4,// Show only one item per page
							prev_text:"上一页",
							next_text:"下一页",
						
							num_display_entries:2,
							num_edge_entries:3,
					
							
		                });
			    }
				function pageselectCallback_1(page_index){
					    $.post(
					      "Coment/comentPage.do",
					      {"pageNow":page_index, "flag":2
					      },
					      function(data){
					    	  for(var i=0;i<4;i++){
					    		  $("#ycomentdiv"+i).css("display","none");
					    		  $("#ysdiv"+i).text("");
					    		  $("#ytdiv"+i).text("");
					    	  }
					    	  for(var i=0;i<data.length;i++){
					    	    // alert(data[0].sname);
					    	   
					    	   //    alert(data[i].id);
					    	   	  $("#ycomentdiv"+i).css("display","block");
					    	       $("#ycomentid"+i).val(data[i].id);
					    	       $("#ysdiv"+i).text("["+data[i].comentdate+"]游客："+data[i].coment);
					    	      if(data[i].replycoment!=null){
					    	       $("#ytdiv"+i).text("["+data[i].comentdate+"]"+data[i].tname+"  回答："+data[i].replycoment);
					    	     
					    	    }
					    	      else{
					    	    	$("#tdiv"+i).text("");
					    	    	$("#cid"+i).val("");
					    	      }
					    	  }
					    	
					      },
					      "json"
					    );
		                return false;
		            }
			 function Alert(text) {
					$.alert({
						title : 'Hello',
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
