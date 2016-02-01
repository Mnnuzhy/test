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
   <div style="height:578px;width:1055px;margin:0 auto;">
         <jsp:include page="navigation.jsp"></jsp:include> 
	  <div class="major">  
          <div style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;"> 留言板管理</div>	
		   <div style="margin-top:15px;font-size:15px;">
		     <label style="font-size:15px;">
	           <span>查询类型:</span>
	            <select id="flag" style="width:200px;margin-left: 10px;display: inline-block;" class="form-control">
	             <option value="3">全部</option>
		         <option value="4">游客</option>
		         <option value="1">学员</option>
		        
		      </select>
		      
             <button id="search" style="margin-left: 10px;"  type="button" class="btn btn-success">查询</button>
             <button id="deleteAll" style="margin-left: 10px;"  type="button" class="btn btn-danger">清空留言</button>
             </label>
	
		 
		   <c:forEach begin="0" end="3" var="i">
		   <input type="hidden" id="comentid${i}">
		   <div id="comentdiv${i}" style="border-top:1px solid #ccc;height:100px;padding-left:20px;padding-top: 10px;">
		      <div id="sdiv${i}"></div>
			  <div id="tdiv${i}"style="color:#F25F08;margin-top: 10px;"></div>
			  <button style="float:right;" type="button" class="btn btn-primary" onclick="deleteComent('#comentid${i}')">删除</button>
		  </div>
		  </c:forEach>
		  </div>
		   <div style="margin-left:340px;" id="Pagination"></div>	  
        </div>
        </div>

    <script>
	     $(function(){
	    	 pagination(${rowCount});
	    	 pageselectCallback(0);
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
	     $("#search").click(function(){
			 pagination(${rowCount});
			 pageselectCallback(0);
		});
	     $("#deleteAll").click(function(){
	    	 $.confirm({
					columnClass : 'col-md-4 col-md-offset-4',
					title : 'Notice',
					content : '确认删除',
					confirmButton:'确认',
					cancelButton:'取消',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					confirm : function() {
					$.post(
					"Coment/clearComent.do",
					{},
					function(data){	
						Alert("操作成功");
						 pagination(0);
						 pageselectCallback(0);
					},
					"text"
					);
					}
					});
			
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
				 var flag=$("#flag").val();   
				    $.post(
				      "Coment/comentPage.do",
				      {"pageNow":page_index,"flag":flag},
				      function(data){
				    	  for(var i=0;i<4;i++){
				    		  $("#comentdiv"+i).css("display","none");
				    		  $("#sdiv"+i).text("");
				    		  $("#tdiv"+i).text("");
				    	  }
				    	  for(var i=0;i<data.length;i++){
				    	    // alert(data[0].sname);
				    	      $("#comentdiv"+i).css("display","block");
				    	      $("#comentid"+i).val(data[i].id);
				    	      if(data[i].sname!=null){
				    	      $("#sdiv"+i).text("["+data[i].comentdate+"]"+data[i].sname+"问："+data[i].coment);
				    	    if(data[i].tname!=null)
				    	       $("#tdiv"+i).text("["+data[i].replydate+"]"+data[i].tname+"  回答："+data[i].replycoment);
				    	    else
				    	    	$("#tdiv"+i).text("");
				    	      }
				    	      else{
				    	    	  $("#sdiv"+i).text("["+data[i].comentdate+"]游客问："+data[i].coment);
						    	    if(data[i].replycoment!=null)
						    	       $("#tdiv"+i).text("["+data[i].replydate+"]"+data[i].tname+"  回答："+data[i].replycoment);
						    	    else
						    	    	$("#tdiv"+i).text("");
				    	      }
				    	  }
				    	
				      },
				      "json"
				    );
	                return false;
	            }
			
			function deleteComent(obj){
				var id=$(obj).val();
				//alert(id);
				$.post(
				    "Coment/deleteComent.do",
				    {"id":id},
				    function(data){
				    	 pagination(data);
				    	 pageselectCallback(0);
				    	 Alert("删除成功！");	
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
					confirmButtonClass: 'btn-info',

				});
			}
			
   </script>
</body>
</html>
