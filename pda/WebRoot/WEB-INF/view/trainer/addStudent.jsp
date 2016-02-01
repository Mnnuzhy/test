<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'home.jsp' starting page</title>
</head>

<body>
	<jsp:include page="../public/head.jsp"></jsp:include>
	<div style="height:680px;width:1055px;margin:0 auto;">
		<jsp:include page="navigation.jsp"></jsp:include>
		<div class="major">
			<div
				style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;">
				学员招收</div>
		
			
			 <div>
			<div class="d1" style="margin-left:20px;margin-top:30px;">
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
						    <th >编号</th>
							<th >身份证号</th>
							<th >姓名</th>
							<th >招收</th>
						</tr>
					</thead>
					<tbody>
					  <c:forEach begin="0" end="4" var="i">
					    <input type="hidden" id="sid${i}">
						<tr id="str${i}">
						    <td id="sbh${i}"></td>
							<td id="sidnumber${i}"></td>
							<td id="sname${i}"></td>
							<td><a id="sstatus${i}" href="javascript:void(0)" onclick="showUser('#sid'+${i},3)"></a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="scountdiv"
				style="background-color:#F5F5F5;height:40px;line-height:75px;position:relative;top:10px;line-height:38px;text-align:right;">
				共${studentCount}条数据
			</div>
			<div style="margin-left:300px;margin-top:10px;" id="s_Pagination">
			</div>
			</div>
			
	
					
				</div>
			

		</div>
	</div>

	<jsp:include page="model1.jsp"></jsp:include>
	<script>
		$(function() {
			//alert("****");
			flag=0;
			pagination_1(${studentCount});
			s_pageselectCallback(0);
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
		});
	
		function showUser(obj,role) {
			 var uid=$(obj).val();
			// alert(sid);
			   $.post(
				 "Manager/showUser.do",
				 {"sid":uid},
				 function(user){
				    $("#uid").val(uid);
					$("#uname").val(user.name);
					$("#idnumber").val(user.idnumber);
					$("#registertime").val(user.registertime);
					$("#updatetime").val(user.updatetime);
					$("#address").val(user.address);
					$("#email").val(user.email);
					$("#tel").val(user.tel);
					$("#role").val(role);
					$("#imag").attr("src","rescourse/imag/user/"+user.imag);
				     $("#idimag").attr("src","rescourse/imag/user/"+user.idimag);
					//alert(user.imag);
					 
				 },
				 "json"
			   );
			$('#myModal1').modal({
				keyboard : true
			});
		}
		$("#search").click(function(){
			pagination_1(${studentCount});
			s_pageselectCallback(0);
		});
	        function pagination_1(rowCount){
						            
		           $("#s_Pagination").pagination(rowCount, {
		                  callback: s_pageselectCallback,
		                  items_per_page:5,// Show only one item per page
							prev_text:"上一页",
							next_text:"下一页",
							num_display_entries:2,
							num_edge_entries:3,
							
		              });         
		    }
		
			function s_pageselectCallback(page_index){
				 var type=$("#type").val();   
				 var title=$("#title").val();
				$.post(
					"Manager/getStudent.do",
					{"pageNow":page_index,"type":type,"title":title,"status":0},
					function(data){
						for(var i=0;i<5;i++){
							//alert($("#str"+i));
				            $("#str"+i).css("display","none");
						}
						//alert(data.listuser.length);
					  for(var i=0;i<data.listuser.length;i++){
							//alert($("#tname"+i).text());

							 $("#str"+i).css("display","table-row"); 
							 $("#str"+i).css("display","table-row"); 
							 $("#sid"+i).val(data.listuser[i].id);
							 $("#sbh"+i).text(page_index*5+i+1);
							 $("#sidnumber"+i).text(data.listuser[i].idnumber);
							 $("#sname"+i).text(data.listuser[i].name);
							 //alert(data[i].status);
							 $("#sstatus"+i).text("待招收");
							 
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
