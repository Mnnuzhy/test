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
				用户管理</div>
		
			 <div style="height:42px;margin-top: 30px;box-shadow:0 0 2px 2px #ccc">
					<ul class="nak" style="">
					   <li name="nk" style="background-color:white;border-top:2px solid #114EC9">教练员</li>
					   <li name="nk">学员</li>
					</ul>
			 </div>
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
                  <select id="status" style="width:200px;margin-left: 10px;display: inline-block;" class="form-control">
	             <option value="-1">全部</option>
		         <option value="1">已审核</option>
		         <option value="0">待审核</option> 
		         <option value="2">已认证</option> 
		      </select>
             <button id="search" style=";margin-left: 10px;" id="search" type="button" class="btn btn-success">查询</button>
             </label>
	
		     <table class="table table-striped" style="margin-top: 30px;border-top:2px solid #114EC9; ">
					<thead>
						<tr>
						    <th>编号</th>
							<th>用户账号</th>
							<th>姓名</th>
							<th>密码重置</th>
							<th>资格认证</th>
							<th>删除用户</th>
							<th>状态</th>
						</tr>
					</thead>
					<tbody>
					  <c:forEach begin="0" end="4" var="i">
					    <input type="hidden" id="tid${i}">
						<tr id="ttr${i}">
						    <td id="tbh${i}"></td>
							<td id="tidnumber${i}"></td>
							<td id="tname${i}"></td>
							<td><button type="button" class="btn btn-success" onclick="resetPassword('#tidnumber${i}','#tstatus${i}')">重置</button></td>
							<td><button type="button" class="btn btn-primary" onclick="identity(${i})">认证</button></td>
							<td><a href="javascript:void(0)" onclick="deleteUser('#tid'+${i},'1')">删除用户</a></td>
							<td><a id="tstatus${i}" href="javascript:void(0)" onclick="showUser('#tid'+${i},2)"></a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div id="tcountdiv"
				style="background-color:#F5F5F5;height:40px;line-height:75px;position:relative;top:10px;line-height:38px;text-align:right;">
				共${trainerCount}条数据
			</div>
			<div style="margin-left:300px;margin-top:10px;" id="t_Pagination">
			</div>
			</div>
			
			<div class="d1" style="margin-left:20px;margin-top:30px;display:none;">
			  <label style="font-size:15px;">
	           <span>查询类型:</span>
	            <select id="type_1" style="width:200px;margin-left: 10px;display: inline-block;" class="form-control">
	             <option value="all">全部</option>
		         <option value="name">姓名</option>
		         <option value="idnumber">身份证</option>
		        
		      </select>
		       
		        <input style="width: 150px;display:inline-block;" type="text" class="form-control" id="title_1" 
                     placeholder="请输入名称">
                      <select id="status_1" style="width:200px;margin-left: 10px;display: inline-block;" class="form-control">
	             <option value="-1">全部</option>
		         <option value="1">已审核</option>
		         <option value="0">待审核</option> 
		         <option value="3">已结业</option> 
		      </select>
             <button id="search_1" style=";margin-left: 10px;" id="search" type="button" class="btn btn-success">查询</button>
             
             </label>
	
		     <table class="table table-striped" style="margin-top: 30px;border-top:2px solid #114EC9; ">
					<thead>
						<tr>
						    <th >编号</th>
							<th >用户账号</th>
							<th >姓名</th>
							<th >教练姓名</th>
							<th>密码重置</th>
							<th>删除用户</th>
							<th >状态</th>
						</tr>
					</thead>
					<tbody>
					  <c:forEach begin="0" end="4" var="i">
					    <input type="hidden" id="sid${i}">
						<tr id="str${i}">
						    <td id="sbh${i}"></td>
							<td id="sidnumber${i}"></td>
							<td id="sname${i}"></td>
							<td id="ttname${i}"></td>
							<td><button type="button"  class="btn btn-success" onclick="resetPassword('#sidnumber${i}','#sstatus${i}')">重置</button></td>
							<td><a href="javascript:void(0)" onclick="deleteUser('#sid'+${i},'2')">删除用户</a></td>
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

	<jsp:include page="model.jsp"></jsp:include>
	<script>
		$(function() {
			//alert("****");
			flag=0;
			pagination(${trainerCount})
			pagination_1(${studentCount});
			t_pageselectCallback(0);
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
		function deleteUser(obj,role) {
			var uid=$(obj).val();
			//alert(uid+role);
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
				"Manager/deleteUser.do",
				{"uid":uid,"role":role},
				function(data){
					if(role==1){
						$("#tcountdiv").text("共"+data+"条数据");
						pagination(data)
						t_pageselectCallback(0);
					}
					else{
						$("#scountdiv").text("共"+data+"条数据");
						pagination_1(data);
						s_pageselectCallback(0);
					}
						
					Alert("删除成功");
				},
				"text"
				);
				}
				});
		}
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
				//	alert(user.imag);
					 
				 },
				 "json"
			   );
			$('#myModal1').modal({
				keyboard : true
			});
		}
		function identity(id){
			var tid=$("#tid"+id).val();
			var status=$("#tstatus"+id).text();
			var tname=$("#tname"+id).text();
			if(status=="待审核"){
				Alert("该用户还未注册！");
				eturn ;
			}
			$.post(
			    "Manager/showgidentity.do",
			    {"tid":tid},
			    function(data){
			    	$("#trainername").text(tname);
			    	$("#imag1").attr("src","rescourse/imag/trainer/"+data.imag1);	
			    	$("#imag2").attr("src","rescourse/imag/trainer/"+data.imag2);	
			    	$("#year").text(data.year);
			    	$("#ttid").val(data.tid);
			    },
			    "json"
			);
			$('#identityModel').modal({
				keyboard : true
			});	
		}
		$("#search").click(function(){
			pagination(${trainerCount});
			t_pageselectCallback(0);		
		});
		$("#search_1").click(function(){
			s_pageselectCallback(0);
			pagination_1(${studentCount});
			
		});
		 function pagination(rowCount)
		    {
		           $("#t_Pagination").pagination(rowCount, {
	                  callback: t_pageselectCallback,
	                  items_per_page:5,// Show only one item per page
						prev_text:"上一页",
						next_text:"下一页",
						num_display_entries:2,
						num_edge_entries:3,
		           }); 
		    }
		          
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
			function t_pageselectCallback(page_index){
				 var type=$("#type").val();   
				 var title=$("#title").val();  
				 var status=$("#status").val();  
					
				// alert(type+title+status);
				$.post(
					"Manager/getTrainerUser.do",
					{"pageNow":page_index,"type":type,"title":title,"status":status},
					function(data){
						for(var i=0;i<5;i++){
							//alert($("#tname"+i).text());
							 $("#ttr"+i).css("display","none"); 
						}
						for(var i=0;i<data.length;i++){
							//alert($("#tname"+i).text());
							 $("#ttr"+i).css("display","table-row"); 
							 $("#tid"+i).val(data[i].id);
							 $("#tbh"+i).text(page_index*5+i+1);
							 $("#tidnumber"+i).text(data[i].idnumber);
							 $("#tname"+i).text(data[i].name);
							// $("#tstatus"+i).text("已审核并注册");
							 if(data[i].status==0){
							    $("#tstatus"+i).text("待审核");
							 }
							 else if(data[i].status==1)
								$("#tstatus"+i).text("已审核");
							 else if(data[i].status==2)
								$("#tstatus"+i).text("已认证");
							
						}
					},
					"json"
				);
	              return false;
	          }
			function s_pageselectCallback(page_index){
				 var type=$("#type_1").val();   
				 var title=$("#title_1").val();
				 var status=$("#status_1").val();  
				
				$.post(
					"Manager/getStudentUser.do",
					{"pageNow":page_index,"type":type,"title":title,"status":status},
					function(data){
						for(var i=0;i<5;i++){
							//alert($("#str"+i));
				            $("#str"+i).css("display","none");
						}
						for(var i=0;i<data.length;i++){
							//alert($("#tname"+i).text());
							 $("#str"+i).css("display","table-row"); 
							 $("#str"+i).css("display","table-row"); 
							 $("#sid"+i).val(data[i].id);
							 $("#sbh"+i).text(page_index*5+i+1);
							 $("#sidnumber"+i).text(data[i].idnumber);
							 $("#sname"+i).text(data[i].name);
							 $("#ttname"+i).text(data[i].tname);
							 //alert(data[i].status);
							 if(data[i].status==0)
								 $("#sstatus"+i).text("待审核");
							 else if(data[i].status==1)
								$("#sstatus"+i).text("已审核");
							 else if(data[i].status==3)
								$("#sstatus"+i).text("已结业");
							
						}
					},
					"json"
				);
	              return false;
	          }
			function resetPassword(obj,obj1){
				var idnumber=$(obj).text();
				//Alert($(obj1).text()+idnumber);
			    if($(obj1).text()=="待审核"){
			       Alert("该用户还未注册！");
			       return ;
			    }
			   
			    $.post(
			    	"Manager/resetPassword.do",
			    	{"idnumber":idnumber},
			    	function(data){
			    		//alert(data);
			    		if(data==0)
			    			Alert("该用户还未注册！");
			    		else
			    			Alert("***密码重置为:"+data+"***\n已发送至用户邮箱");
			    	},
			    	"text"
			    );
			}
			 $("#tidnumber").blur(function(){
			    	$.post(
			    		"User/varify.do",
			    		{"idnumber":$(this).val()},
			    		function(data){
			    			//alert(data);
			    			if(data!=-1){
			    			  $("#idnumberdiv").addClass("has-error");
			    			  $("#idnumberspan").text("該用戶已存在");
			    			  flag=0;
			    			}
			    			else{
			    				$("#idnumberdiv").removeClass("has-error");
				    			 $("#idnumberspan").text("*");
				    			 flag=1;
			    			}
			    		},
			    		"text"
			    	);
			    });
			 $("#registerok").click(function(){
				    //	alert("***");
				        var idnumber=$("#tidnumber").val();
				    	var name=$("#tname").val();
				        if(flag==0||idnumber==null||name==null||idnumber==""||name==""){
				        	Alert("請正確輸入");
				        	return ;
				        }
				    	
				    	$.ajaxFileUpload({
						 url:"User/upload.do",
						 type:"post",
						 fileElementId:"file",
						 dataType:"text",
						 success: function (data, status){
							// alert(data);
					    	 $.post(
							    		"Manager/takeinTrainer.do",
							    		{"name":name,"idnumber":idnumber,"name":name,"imag":data},
							    		function(data){
							    			Alert("添加成功");
							    			$("#tidnumber").val("");
							    			$("#tname").val("");
							    			$("#tcountdiv").text("共"+data+"条数据");
											pagination(data);
							         		t_pageselectCallback(0);
						
							    		},
							    		"text"
							    	 );
					         },
					});
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
