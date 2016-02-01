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
 

  </head>
  
  <body>
   <jsp:include page="../public/head.jsp"></jsp:include>
   <div style="height:750px;width:1055px;margin:0 auto;">
         <jsp:include page="navigation.jsp"></jsp:include> 
	    <div class="major">  
          <div style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:40px;line-height:38px;font-size:18px;"> 留言板</div>	
		  <div class="form-group" style="margin-top:30px;">
			<textarea class="form-control" rows="3" id="content"></textarea>
		  </div>
		  <div> 
		       <button type="button" class="btn btn-primary" id="leaveComent" style="margin-left: 10px;">留言</button>
          </div>	 
		  <div style="height:400px;margin-top:15px;font-size:15px;">
		   <c:forEach begin="0" end="3" var="i">
		   <div id="comentdiv${i}" style="border-top:1px solid #ccc;height:100px;padding-left:20px;padding-top: 10px;]">
		      <div id="sdiv${i}"></div>
			  <div id="tdiv${i}"style="color:#F25F08;margin-top: 10px;"></div>
		  </div>
		  </c:forEach>
		  </div>
		   <div style="margin-left:300px;" id="Pagination"></div>	  
      </div>
	  </div>
  
    <script>
       $(function(){
    	   pageselectCallback(0);
    	   pagination(${rowCount});
       });
        $("#leaveComent").click(function(){
        	var content=$("#content").val();
        	//alert(content);
        	if(content==null||content==""){
        		Alert("请留言！");
        		return ;
        	}
        	$.post(
        	    "Coment/leaveComent.do",
        	    {"content":content},
        	    function(data){
        	    	Alert("留言成功！");
        	    	pagination(data);
       	    	    pageselectCallback(0);
        	    	
        	    },
        	    "text"
        	);
        	$("#content").val("");
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
			      {"pageNow":page_index,"flag":1},
			      function(data){
			    	  for(var i=0;i<4;i++){
			    		  $("#comentdiv"+i).css("display","none");
			    		  $("#sdiv"+i).text("");
			    		  $("#tdiv"+i).text("");
			    	  }
			    	  for(var i=0;i<data.length;i++){
			    	    // alert(data[0].sname);
			    	      $("#comentdiv"+i).css("display","block");
			    	    $("#sdiv"+i).text("["+data[i].comentdate+"]"+data[i].sname+"："+data[i].coment);
			    	    if(data[i].tname!=null)
			    	       $("#tdiv"+i).text("["+data[i].comentdate+"]"+data[i].tname+"  回答："+data[i].replycoment);
			    	    else
			    	    	$("#tdiv"+i).text("");
			    	  }
			    	
			      },
			      "json"
			    );
                return false;
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
