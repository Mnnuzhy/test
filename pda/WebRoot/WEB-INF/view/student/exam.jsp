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
          <div style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;">考试</div>	
		 <div style="height:42px;margin-top: 30px;box-shadow:0 0 2px 2px #ccc">
					<ul class="nak" style="">
					   <li name="nk" style="background-color:white;border-top:2px solid #114EC9">考试列表</li>
					    <li name="nk">已参加的考试</li>
					</ul>
			 </div>
		<div>
		 <div class="d1" style="margin-left:20px;margin-top:30px;">
		    <label style="font-size:15px;">
	           <span>查询类型:</span>
	            <select id="type" style="width:200px;margin-left: 10px;display: inline-block;" class="form-control">
		         <option value="all">全部</option>
		         <option value="examname">考试名称</option>
		         <option value="subject">考试科目</option>
		        
		      </select>
		        <input style="width: 150px;display:inline-block;" type="text" class="form-control" id="title" 
                     placeholder="请输入名称">
             <button id="search" style="margin-left: 10px;" id="search" type="button" class="btn btn-success">查询</button>
             </label>
	
		     <table class="table table-striped" style="margin-top: 30px;border-top:2px solid #114EC9; ">
			   <thead>
				  <tr>
				     <th>编号</th>
					 <th>考试名称</th>
					 <th>考试科目</th>
					 <th>考试开始时间</th>
					 <th>进入考试</th>
				  </tr>
			   </thead>
			   <tbody>
			     <c:forEach begin="0" end="4" var="i"> 
			        <input type="hidden" id="eid${i}">
				  <tr id="etr${i}">
					 <td id="ebh${i}"></td>
					 <td id="ename${i}"></td>
					 <td id="etype${i}"></td>
					 <td id="etime${i}"></td>
					 <td><a href="javascript:void(0)" onclick="beginExam('#eid${i}')">开始考试</a></td>
				  </tr>
				  </c:forEach>
			   </tbody>
         </table>
         <div style="background-color:#F5F5F5;height:40px;line-height:75px;position:relative;top:10px;line-height:38px;text-align:right;">
				共${examCount}条数据
			</div>
			<div style="margin-left:300px;margin-top:10px;" id="t_Pagination">
			</div>
		</div>
		<div class="d1" style="margin-left:20px;margin-top:30px;display:none;">
		     <table class="table table-striped">
			   <thead>
				  <tr>
				     <th>编号</th>
					 <th>考试名称</th>
					 <th>考试科目</th>
					 <th>考试成绩</th>
				  </tr>
			   </thead>
			   <tbody>
			   <c:forEach begin="0" end="4" var="i">
				  <tr id="estr${i}">
				     <td id="esbh${i}"></td>
					 <td id="esname${i}"></td>
					 <td id="estype${i}"></td>
					 <td id="esscore${i}"></td>
				  </tr>
				  </c:forEach>
			   </tbody>
         </table>
         <div style="background-color:#F5F5F5;height:40px;line-height:75px;position:relative;top:10px;line-height:38px;text-align:right;">
				共${examScoreCount}条数据
		 </div>
			<div style="margin-left:300px;margin-top:10px;" id="s_Pagination">
			</div>
		  </div>
      </div>
      </div>
      </div>
      
 
	
    <script>
      $(function(){
    	  pagination(${examCount},${examScoreCount});
    	  t_pageselectCallback(0);
		  s_pageselectCallback(0);
	   $("li[name='nk']").each(function(i){
	      $(this).click(function(){
		      $(this).css({ "background-color":"white","border-top":"2px solid #114EC9"}).siblings().css({ "background-color":"#F5F5F5","border-top":"0px solid #114EC9"});
			  $(".d1").eq(i).css({"display":"block"}).siblings().css({"display":"none"});
			 });
		});
		
	   $("#change").click(function(){
	       // alert("****");
		   
	        $("#changePanel").css({"display":"none"});
		    $("#subchangePanel").css({"display":"block"});
	   });
	   
	    $("#calchange").click(function(){
	       // alert("****");
	        $("#changePanel").css({"display":"block"});
		    $("#subchangePanel").css({"display":"none"});
	   });
	  });
      function beginExam(obj){
    	  var id=$(obj).val();
    	  $.post(
    		"Exam/varifyDate.do",
    		{"id":id},
    		function(data){
    			//alert(data);
    			if(data==1)
    				location.replace("Exam/examing.do?eid="+id);
    			else
    				Alert("考试还未开始!");
    		},
    		"text"
    	  );
    	 
      }
      $("#search").click(function(){
			 pagination(${examCount});
			 t_pageselectCallback(0);
		});
      function pagination(t_rowCount,s_rowCount)
	    {
	           $("#t_Pagination").pagination(t_rowCount, {
                callback: t_pageselectCallback,
                items_per_page:5,// Show only one item per page
					prev_text:"上一页",
					next_text:"下一页",
					num_display_entries:2,
					num_edge_entries:3,
			
					
            });        
	           $("#s_Pagination").pagination(s_rowCount, {
	                  callback: s_pageselectCallback,
	                  items_per_page:5,// Show only one item per page
						prev_text:"上一页",
						next_text:"下一页",
						num_display_entries:2,
						num_edge_entries:3,
				
						
	              });         
	    }
		function t_pageselectCallback(page_index){
			 
			 var type=$("#type").val();   
			 var title=$("#title").val();  
			$.post(
					  "Exam/getAllExam.do",
					  {"pageNow":page_index,"type":type,"title":title},
			  function(data){
				  for(var i=0;i<5;i++){
					  $("#etr"+i).css("display","none");
				  }
				  for(var i=0;i<data.length;i++){
					  $("#etr"+i).css("display","table-row");
					  $("#ebh"+i).text(page_index*5+i+1);
					  $("#eid"+i).val(data[i].id);
					  $("#ename"+i).text(data[i].examname);
					  $("#etype"+i).text(data[i].subject);
					  $("#etime"+i).text(data[i].begindate);
				  }
			  },
			  "json"
			);
            return false;
        }
		function s_pageselectCallback(page_index){
			 
			         $.post(
					  "Exam/getExamScore.do",
					  {"pageNow":page_index},
					  function(data){
						  for(var i=0;i<5;i++){
							  $("#estr"+i).css("display","none");
						  }
						  for(var i=0;i<data.length;i++){
							  $("#estr"+i).css("display","table-row");
							  $("#esbh"+i).text(page_index*5+i+1);
							  $("#esname"+i).text(data[i].examname);
							  $("#estype"+i).text(data[i].examsubject);
							  $("#esscore"+i).text(data[i].score);
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
