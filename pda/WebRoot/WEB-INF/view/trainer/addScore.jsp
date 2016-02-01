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
          <div style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;"> 成绩录入</div>	
		  <div>
		
		  <div style="margin:20px;">
		   <label style="font-size:15px;">
	           <span>查询类型:</span>
	            <select id="type" style="width:200px;margin-left: 10px;display: inline-block;" class="form-control">
		         <option value="all">全部</option>
		         <option value="name">姓名</option>
		         <option value="idnumber">身份证</option>
		        
		      </select>
		        <input style="width: 150px;display:inline-block;" type="text" class="form-control" id="title" 
                     placeholder="请输入名称">
             <button style=";margin-left: 10px;" id="search" type="button" class="btn btn-success">查询</button>
             </label>
	
		     <table class="table table-striped" style="margin-top: 30px;border-top:2px solid #114EC9; ">
			   <thead>
				  <tr>
				     <th>编号</th>
					 <th>学员姓名</th>
					 <th>科目一</th>
					 <th>科目二</th>
					 <th>科目三</th>
					 <th>科目四</th>
					 <th>成绩录入</th>
				  </tr>
			   </thead>
			   <tbody>
			   <c:forEach begin="0" end="4" var="i">
			     <input type="hidden" id="scoreid${i}">
			     <input type="hidden" id="suid${i}">
			      <input type="hidden" id="imag${i}">
				  <tr id="tr${i}">
				     <td id="tdid${i}">${i}</td>
					 <td id="name${i}"></td>
					 <td id="one${i}"></td>
					 <td id="tow${i}"></td>
					 <td id="three${i}"></td>
					 <td id="four${i}"></td>
					<td><a href="javascript:void(0)" onclick="addScore(${i})">成绩录入</a></td>
				  </tr>
				  </c:forEach>
			   </tbody>
         </table>
		  </div>
		  <div id="changePanel" style="background-color:#F5F5F5;height:40px;line-height:75px;position:relative;top:20px;line-height:38px;text-align:right;"> 
		    共${rowCount}条数据
          </div>	  
		   <div style="margin-left:300px;margin-top:20px;" id="Pagination"></div>	  
      </div>
	  </div>
	  </div>
     <jsp:include page="model.jsp"></jsp:include>

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
	     function pagination(rowCount)
		    {
		           $("#Pagination").pagination(rowCount, {
	                  callback: pageselectCallback,
	                  items_per_page:5,// Show only one item per page
						prev_text:"上一页",
						next_text:"下一页",
						
						num_display_entries:2,
						num_edge_entries:3,
				
						
	              });
		    }
			function pageselectCallback(page_index){
				 var type=$("#type").val();   
				 var title=$("#title").val();
				    $.post(
				      "Manager/getStudentScore.do",
				      {"pageNow":page_index,"type":type,"title":title},
				      function(data){
				    	  for(var i=0;i<5;i++){
				    		 $("#tr"+i).css("display","none");
				    	  }
				    	  for(var i=0;i<data.length;i++){
				    		  $("#tdid"+i).text(page_index*5+i+1);
				    		  $("#tr"+i).css("display","table-row");
				    		  $("#scoreid"+i).val(data[i].id);
				    		  $("#suid"+i).val(data[i].sid);
				    		  $("#name"+i).text(data[i].sname);
				    		  $("#one"+i).text(data[i].subjectone);
				    		  $("#tow"+i).text(data[i].subjecttow);
				    		  $("#three"+i).text(data[i].subjectthree);
				    		  $("#four"+i).text(data[i].subjectfour);
				    		  $("#imag"+i).val(data[i].imag);
				    	  }
				    	
				      },
				      "json"
				    );
	              return false;
	          }
	    function addScore(id){
	    	  
	    	   var sid=$("#scoreid"+id).val();
	    	   var suid=$("#suid"+id).val();
	    	   var imag=$("#imag"+id).val();
	    	   $("#stitle").text($("#name"+id).text()+"的成绩单");
	    	   $("#sone").val($("#one"+id).text());
	    	   $("#stow").val($("#tow"+id).text());
	    	   $("#sthree").val($("#three"+id).text());
	    	   $("#sfour").val($("#four"+id).text());
	    	   $("#ssid").val(sid);
	    	   $("#suid").val(suid);
	    	 //  alert(id);
	    	  check();
	    	   $("#simag").attr("src","rescourse/imag/user/"+imag);
			    $('#myModal3').modal({
				  keyboard: true
			   });
			}
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
   </script>
</body>
</html>
