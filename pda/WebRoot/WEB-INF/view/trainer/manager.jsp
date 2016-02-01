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
          <div style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;"> 学员管理</div>	
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
                 <select id="ap" style="width:200px;margin-left: 10px;display: inline-block;" class="form-control">
		         <option value="all">全部</option>
		         <option value="0">有预约</option>
		         <option value="1">无预约</option>
		        
		      </select>
             <button style="margin-left: 10px;" id="search" type="button" class="btn btn-success">查询</button>
             </label>
	
		     <table class="table table-striped" style="margin-top: 30px;border-top:2px solid #114EC9; ">
			   <thead>
				  <tr>
				     <th>编号</th>
					 <th>学员姓名</th>
					 <th>查看详细信息</th>
					 <th>学员预约</th>
					
				  </tr>
			   </thead>
			   <tbody>
			   
			     <c:forEach begin="0" end="4" var="i">
			     <input type="hidden" id="hid${i}">
				      <tr id="tr${i}">
				      <td id="tdid${i}">${i}</td>
					  <td id="name${i}"></td>
				      <td><a href="javascript:void(0)" onclick="showdetail(${i})">查看详细信息</a></td>
				      <td><a id="tappoint${i}" href="javascript:void(0)" onclick="appoint(${i})">学员预约</a></td>
					
				  </tr>
				  </c:forEach>
			   </tbody>
         </table>
		  </div>
		  <div style="background-color:#F5F5F5;height:40px;line-height:75px;position:relative;top:20px;line-height:38px;text-align:right;"> 
		    共${rowCount}条数据
          </div>	  
		   <div style="margin-left:300px;margin-top:20px;" id="Pagination"></div>	  
   		  
	  </div> 
   </div>
   <div class="tail"> 
   </div>
  <jsp:include page="model.jsp"></jsp:include>
    <script>
      $(function(){
    	  pagination(${rowCount});
     	   pageselectCallback(0);
     	
	   $("li[name='nk']").each(function(i){
	      $(this).click(function(){
		      $(this).css({ "background-color":"white","border-top":"2px solid #114EC9"}).siblings().css({ "background-color":"#F5F5F5","border-top":"0px solid #114EC9"});
			  $(".d1").eq(i).css({"display":"block"}).siblings().css({"display":"none"});
			 });
		});
	 
	   
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
	    	  var ap=$("#ap").val();
	    	   // alert(type+title);
			    $.post(
			      "Manager/getStudent.do",
			      {"pageNow":page_index,"type":type,"title":title,"status":1},
			      function(data){
			    	  for(var i=0;i<5;i++){
			    		 $("#tr"+i).css("display","none");
			    	  }
			    	  for(var i=0;i<data.listuser.length;i++){
			    		  $("#tr"+i).css("display","table-row");
			    		  $("#tdid"+i).text(page_index*5+i+1);
			    		  $("#name"+i).text(data.listuser[i].name);
			    		  $("#hid"+i).val(data.listuser[i].id);
			    		  $("#name"+i).text(data.listuser[i].name);
			    		//  $("#tappoint"+i).text("没有预约");
			    		  checkAppoint(data.listuser[i].id,i);
			         
			    	  }
			    	   
			    	  
			    	  
			    	
			      },
			      "json"
			    );
			  
              return false;
          }
	   function showdetail(id){
		   var sid=$("#hid"+id).val();
		   $.post(
			 "Manager/showUser.do",
			 {"sid":sid},
			 function(user){
				// alert(user.name);
			    $("#sid").val(sid);
				$("#sname").val(user.name);
				$("#idnumber").val(user.idnumber);
				$("#registertime").val(user.registertime);
				$("#updatetime").val(user.updatetime);
				$("#address").val(user.address);
				$("#email").val(user.email);
				$("#tel").val(user.tel);
				$("#imag").attr("src","rescourse/imag/user/"+user.imag);
			//	alert(user.imag);
				 
			 },
			 "json"
		   );
	        $('#myModal').modal({
				  keyboard: true
			   });
	   }
	   function checkAppoint(id,i){
		   //alert(id);
		    $.post(
		      "Order/showOrder.do",
		      {"sid":id},
		      function(data){
		    	  //alert(data);
		    	  if(data.id==null||data.id==""){
		    		 // Alert("该学员没有预约！");
		    		//  alert(data.id);
		    		  $("#tappoint"+i).text("没有预约");
		    	  }
		      },
		    	  "json"
		    	  );
		      }
	  function appoint(id){
		   var sid=$("#hid"+id).val();
		    $.post(
		      "Order/showOrder.do",
		      {"sid":sid},
		      function(data){
		    	  //alert(data);
		    	  if(data.id==null||data.id==""){
		    		  Alert("该学员没有预约！");
		    		  return ;
		    	  }
		    	  $("#oid").val(data.id);
		    	  $("#oname").val(data.sname);
		    	  $("#oidnumber").val(data.idnumber);
		    	  $("#osubject").val(data.subject);
		    	  $("#odate").val(data.date);
		    	//  alert(data.iamg);
		    	  $("#oimag").attr("src","rescourse/imag/user/"+data.imag);
		    	  $('#myModal1').modal({
					  keyboard: true
				   });
		      },
		      "json"
		    );
	       
	  }
	  function Delete(id)
	  {
		  $.confirm({
				columnClass : 'col-md-4 col-md-offset-4',
				title : '確認删除',
				content : '确认删除',
				confirmButton : '确认',
				cancelButton : '取消',
				confirmButtonClass : 'btn-info',
				cancelButtonClass : 'btn-danger',
				confirm : function() {

					$.post("#", "", function(data) {
						Alert("删除成功");

					}, "text"

					);
				}
			});
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
