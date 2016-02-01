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
	<div style="height:578px;width:1055px;margin:0 auto;">
		<jsp:include page="navigation.jsp"></jsp:include>
		<div class="major">
			<div
				style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;">
				添加考试</div>
			 <div style="height:42px;margin-top: 30px;box-shadow:0 0 2px 2px #ccc">
					<ul class="nak" style="">
					   <li name="nk" style="background-color:white;border-top:2px solid #114EC9">考试信息</li>
					   <li name="nk">考试管理</li>
					   <li name="nk">试题添加</li>
					   <li name="nk">题库列表</li>
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
						<tr >
						    <th>编号</th>
							<th>考试名称</th>
							<th>考试科目</th>
							<th>考试时间</th>
							<th>查看考试</th>
							<th>删除考试</th>
						</tr>
					</thead>
					<tbody>
					  <c:forEach begin="0" end="4" var="i">
					    <input type="hidden" id="eid${i}">
						<tr id="etr${i}">
						    <td id="ebh${i}"></td>
							<td id="ename${i}"></td>
							<td id="etype${i}"></td>
							<td id="edate${i}"></td>
							<td><a href="javascript:void(0)" onclick="showExam(${i})">查看考试</a></td>
							<td><a href="javascript:void(0)" onclick="deleteExam('#eid${i}')">删除考试</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div id="ecountdiv"
				style="background-color:#F5F5F5;height:40px;line-height:75px;position:relative;top:10px;line-height:38px;text-align:right;">
				共${examCount}条数据
			</div>
			<div style="margin-left:300px;margin-top:10px;" id="Pagination">
			</div>
			</div>
			
			<div  class="d1" style="margin-left:20px;margin-top:30px;display:none;">
				
					<div>
						<div style="line-height:38px;margin-top:20px;">
							<div>
								<label class="col-sm-2 control-label" style="text-align:right;">考试名称：</label>
								<input style="width:230px;position:relative;" type="text" id="ename"
									class="form-control" id="tname" placeholder="请输入名称">
							</div>
						</div>
						<div style="line-height:38px;margin-top:15px;">
							<div id="idnumberdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">考试科目：</label>
								      <select class="form-control" style="width:230px;" id="etype">
								         <option>科目一</option>
								         <option>科目四</option>
								      </select>
								   
							</div>
						</div>
						<div style="line-height:38px;margin-top:15px;">
								<div id="idnumbdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">考试时间：</label>
								<div style="width:250px;"
									class="input-group date form_date col-md-5" data-date=""
									data-date-format="" data-link-field="dtp_input2"
									data-link-format="yyyy-MM-dd HH:mm:ss">
									<input class="form-control" size="10" type="text" id="edate"
										readonly> <span class="input-group-addon"> <span
										class="glyphicon glyphicon-remove"></span>
									</span> <span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span></span>
								</div>
							</div>
						</div>
						 </div>
					<div id="changePanel"
						style="background-color:#F5F5F5;height:80px;line-height:75px;position:relative;top:20px;">
						<button type="button" class="btn btn-primary"
							style="margin-top: 20px;" id="addExam">提交</button>
					</div>
				</div>
				<div class="d1" style="margin-left:20px;margin-top:30px;display:none;">
				
					<div>
						<div style="line-height:38px;margin-top:20px;">
							<div>
								<label class="col-sm-2 control-label" style="text-align:right;">试题类型：</label>
								  <select class="form-control" style="width:230px;" id="ptype">
								         <option>判断题</option>
								         <option>单选题</option>
								         <option>多选题</option>
								      </select>
							</div>
						</div>
						<div style="line-height:38px;margin-top:15px;">
							<div id="idnumberdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">科目：</label>
								      <select class="form-control" style="width:230px;" id="psubject">
								         <option>科目一</option>
								         <option>科目四</option>
								      </select>
								   
							</div>
						</div>
						
						<div style="line-height:38px;margin-top:15px;">
								<div id="idnumbdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">试题内容：</label>
								  <textarea id="pcontent" style="width: 700px;" class="form-control" rows="4"></textarea>
							</div>
						</div>
						<div style="line-height:38px;margin-top:25px;">
								<div id="idnumbdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">试题图片：</label>
								  <input type="file" id="file" name="file">
							</div>
						</div>
						<div style="line-height:38px;margin-top:50px;">
								<div id="idnumbdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">选项 A：</label>
								<input style="width:700px;position:relative;" type="text" 
									class="form-control" id="pa" placeholder="请输入名称">
							</div>
						</div>
						<div style="line-height:38px;margin-top:15px;">
								<div id="idnumbdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">选项 B：</label>
								<input style="width:700px;position:relative;" type="text" 
									class="form-control" id="pb" placeholder="请输入名称">
							</div>
						</div>
						<div id="dc" style="line-height:38px;margin-top:15px;display:none;">
								<div id="idnumbdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">选项 C：</label>
								<input style="width:700px;position:relative;" type="text" 
									class="form-control" id="pc" placeholder="请输入名称">
							</div>
						</div>
						<div id="dd" style="line-height:38px;margin-top:15px;display:none;">
								<div id="idnumbdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">选项 D：</label>
								<input style="width:700px;position:relative;" type="text" 
									class="form-control" id="pd" placeholder="请输入名称">
							</div>
						</div>
						<div style="line-height:38px;margin-top:15px;" id="result">
								<div id="idnumbdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">正确选项：</label>
								 <div>
							   <label class="checkbox-inline" id="la">
							      <input type="radio" id="a" name="rs" value="A"> 选项 A
							   </label>
							   <label class="checkbox-inline" id="lb">
							      <input type="radio" id="b" name="rs" value="B"> 选项 B
							   </label>
							   <label class="checkbox-inline" id="lc" style="display:none;">
							      <input type="radio" id="c" name="rs" value="C"> 选项 C
							   </label>
							    <label class="checkbox-inline" id="ld" style="display:none;">
							      <input type="radio" id="d" name="rs" value="D"> 选项 D
							   </label>
							   
							</div>
							</div>
						</div>
						 </div>
					<div id="changePanel"
						style="background-color:#F5F5F5;height:80px;line-height:75px;position:relative;top:20px;">
						<button type="button" class="btn btn-primary" id="addPro"
							style="margin-top: 20px;" >提交</button>
					</div>
				</div>
				
				<div id="plist" class="d1" style="margin-left:20px;margin-top:30px;display:none;">
				 <label style="font-size:15px;">
	           <span>查询类型:</span>
	            <select id="type_1" style="width:200px;margin-left: 10px;display: inline-block;" class="form-control">
	             <option value="all">全部</option>
		         <option value="problem">试题</option>
		         <option value="subject">科目</option>
		         <option value="type">类型</option>
		      </select>
		       
		        <input style="width: 150px;display:inline-block;" type="text" class="form-control" id="title_1" 
                     placeholder="请输入名称">
                  
             <button id="search_1" style=";margin-left: 10px;" id="search" type="button" class="btn btn-success">查询</button>
             
             </label>
				  <table class="table table-striped" style="margin-top: 30px;border-top:2px solid #114EC9; ">
					<thead>
						<tr >
						    <th>编号</th>
							<th>试题</th>
							<th>科目</th>
							<th>类型</th>
							<th>修改</th>
							<th>删除</th>
						</tr>
					</thead>
					<tbody>
					  <c:forEach begin="0" end="4" var="i">
					    <input type="hidden" id="pid${i}">
						<tr id="ptr${i}">
						    <td id="pbh${i}"></td>
							<td id="pproblem${i}"></td>
							<td id="pty${i}"></td>
							<td id="ptype${i}"></td>
							<td><a href="javascript:void(0)" onclick="changePro('#pid${i}')">修改</a></td>
							<td><a href="javascript:void(0)" onclick="deletePro('#pid${i}')">删除</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div id="pcountdiv"
				style="background-color:#F5F5F5;height:40px;line-height:75px;position:relative;top:10px;line-height:38px;text-align:right;">
				共${proCount}条数据
			</div>
			<div style="margin:230px;margin-top:10px;" id="Pagination_p">
			</div>
			</div>
				</div>
		</div>
	</div>
    
    
          
	<jsp:include page="model.jsp"></jsp:include>
	<script>
	  var flag=0;
	   $(function(){
		   pagination(${examCount});
		   pageselectCallback(0);
		   pagination_p(${proCount});
		   pageselectCallback_p(0);
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
		$('.form_date').datetimepicker({
			
			minView : 1, //选择日期后，不会再跳转去选择时分秒 
			format : "yyyy-mm-dd hh:mm:00", //选择日期后，文本框显示的日期格式 
			language : 'zh-CN',/*加载日历语言包，可自定义*/
			showSecond: true, //显示秒
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0
		});
		$("#search").click(function(){
			 pagination(${examCount});
			 pageselectCallback(0);
		});
		$("#search_1").click(function(){
			 pagination_p(${proCount});
			 pageselectCallback_p(0);
			
		});
	  function pagination(rowCount){
		$("#Pagination").pagination(rowCount, {
			callback : pageselectCallback,
			items_per_page : 5,// Show only one item per page
			prev_text : "上一页",
			next_text : "下一页",
			prev_show_always : true,
			next_show_always : true

		});
	  }
		function pageselectCallback(page_index) {
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
							  $("#edate"+i).text(data[i].begindate);
						  }
					  },
					  "json"
					);
		            return false;
		}
		
		function pagination_p(rowCount){
			$("#Pagination_p").pagination(rowCount, {
				callback : pageselectCallback_p,
				items_per_page : 5,// Show only one item per page
				prev_text : "上一页",
				next_text : "下一页",
				prev_show_always : true,
				next_show_always : true

			});
		  }
			function pageselectCallback_p(page_index) {
				 var type=$("#type_1").val();   
				 var title=$("#title_1").val();  
				$.post(
						  "Exam/proList.do",
						  {"pageNow":page_index,"type":type,"title":title},
						  function(data){
							  for(var i=0;i<5;i++){
								  $("#ptr"+i).css("display","none");
							  }
						//	  alert(data);
							  for(var i=0;i<data.length;i++){
								
								  $("#ptr"+i).css("display","table-row");
								  $("#pbh"+i).text(page_index*5+i+1);
								  $("#pid"+i).val(data[i].id);
								  $("#pproblem"+i).text(data[i].problem.substr(0,35)+"......");
								 // alert(data[i].id);
								  $("#pty"+i).text(data[i].subject);
								  $("#ptype"+i).text(data[i].type);
							  }
						  },
						  "json"
						);
			            return false;
			}
		function showExam(obj) {
			var eid=$("#eid"+obj).val();
			var ename=$("#ename"+obj).text();
			var etype=$("#etype"+obj).text();
			$("#heid").val(eid);
			$("#name").val(ename);
			$("#subject").val(etype);
		//	alert(eid+ename);
			$.post(
				"Exam/getRate.do",
				{"eid":eid},
				function(data){
				//	alert(data);
					$("#number").val(data[0]);
					if(data[1]=="�")
						$("#rate").val("0.0%");
					else
					    $("#rate").val(data[1]+"%");
					
				},
				"json"
			);
			$('#exammodel').modal({
				keyboard : true
			});
		}
		function deleteExam(obj){
			var eid=$(obj).val();
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
				"Exam/deleteExam.do",
				{"eid":eid},
				function(data){
					$("#ecountdiv").text("共"+data+"条数据");
					pagination(data);
					pageselectCallback(0);
					Alert("删除成功");
				},
				"text"
				);
				}
				});
		}
		$("#addExam").click(function(){
			
			var ename=$("#ename").val();
			var etype=$("#etype").val();
			var edate=$("#edate").val();
			if(ename==null||ename==""||etype==null||etype==""||edate==null||edate==""){
				Alert("请正确输入！");
			}
			else{
				$.post(
				  "Exam/addExam.do",
				  {"examname":ename,"examsubject":etype,"date":edate},
				  function(data){
					  pageselectCallback(0);
					  $("#ecountdiv").text("共"+data+"条数据");
					  pagination(data);
					  Alert("添加成功");
				  }
				);
			}
			
			
		});
		$("#ptype").click(function(){
			var ptype=$(this).val();
			//alert(ptype);
			if(ptype=="判断题"){
				$("input[name='rs']").attr("type","radio");
				$("#lc").css("display","none");
				$("#ld").css("display","none");
				$("#dc").css("display","none");
				$("#dd").css("display","none");
				flag=0;
			}else if(ptype=="单选题"){
				$("input[name='rs']").attr("type","radio");
				$("#lc").css("display","inline-block");
				$("#ld").css("display","inline-block");
				$("#dc").css("display","block");
				$("#dd").css("display","block");
				flag=1;
			}else if(ptype=="多选题"){
				$("input[name='rs']").attr("type","checkbox");
				$("#lc").css("display","inline-block");
				$("#ld").css("display","inline-block");
				$("#dc").css("display","block");
				$("#dd").css("display","block");
				flag=1;
			}
		});
		$("#addPro").click(function(){
			
			var ptype=$("#ptype").val();
			var psubject=$("#psubject").val();
			var pcontent=$("#pcontent").val();
			var pa=$("#pa").val();
			var pb=$("#pb").val();
			var pc=$("#pc").val();
			var pd=$("#pd").val();
			var result="";
		  //  var result=$("input[name='rs']:checked").val();
		 
		    $("input[name='rs']").each(function() { 
		    	//alert($(this).val());    
	            if ($(this).is(':checked')) {     
	            	result+=$(this).val();     	
	            }
	        });  
//	    alert(result+ptype+psubject+pcontent+pa+pb+pc+pd);
		   // alert(result);
		    if(flag==1&&(ptype==""||ptype==null||psubject==""||psubject==null||pcontent==""||pcontent==null|pa==null||pa==""||pb==""||pb==null||pc==""||pc==null||pd==null||pd==""||result==""||result==null)){
	        	 Alert("请正确输入！");
	        	 return ;
	         }
		    if(flag==0&&(ptype==""||ptype==null||psubject==""||psubject==null||pcontent==""||pcontent==null||pa==null||pa==""||pb==""||pb==null||result==""||result==null)){
	        	 Alert("请正确输入！");
	        	 return ;
	         }
		    $.ajaxFileUpload({
				
				url:"Exam/upload.do",
				type:"post",
				fileElementId:"file",
				dataType:"text",
				success: function (data, status){
					// alert("*****");
					 $.post(
							    "Exam/addPro.do",
							    {"psubject":psubject,"pcontent":pcontent,"pimag":data,"pa":pa,"pb":pb,"pc":pc,"pd":pd,"result":result,"ptype":ptype},
							    function(data){
							    	$("#pcountdiv").text("共"+data+"条数据");
									pagination_p(data);
									pageselectCallback_p(0);
							    	Alert("添加成功");
							    	 ptype=$("#ptype").val("");
									 psubject=$("#psubject").val("");
									 pcontent=$("#pcontent").val("");
									 pa=$("#pa").val("");
									 pb=$("#pb").val("");
									 pc=$("#pc").val("");
									 pd=$("#pd").val("");
							    },
							    "text"
							    );
			         },
			});
		   
    	
		});
		function changePro(obj){
		//	alert($(obj).val());
			$.post(
				"Exam/getPro.do",
				{"pid":$(obj).val()},
				function(data){
					// ptype=$("#cptype").val("");
					
					//	alert(data.subject);
					 $("#pid").val(data.id);
					 $("#cpsubject").val(data.subject);
					 $("#cpcontent").val(data.problem);
					 $("#cpa").val(data.a);
					 $("#cpb").val(data.b);
					 $("#cpc").val(data.c);
					 $("#cpd").val(data.d);
					 $("#cptype").val(data.type);
					
				
						 if(data.type=="多选题"){
						    $("input[name='crs']").attr("type","checkbox");
							$("#clc").css("display","inline-block");
							$("#cld").css("display","inline-block");
							$("#cdc").css("display","block");
							$("#cdd").css("display","block");
						 }
						 else if(data.type=="单选题"){
							$("input[name='crs']").attr("type","radio");
							$("#clc").css("display","inline-block");
							$("#cld").css("display","inline-block");
							$("#cdc").css("display","block");
							$("#cdd").css("display","block");
						 }
					
					 $("#eld").text("原来答案："+data.result);
					
				},
				"json"
			);
			$('#promodel').modal({
				keyboard : true
			});
			
			   
		}
		function deletePro(obj){
		//	alert($(obj).val());
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
				       "Exam/deletePro.do",
				       {"pid":$(obj).val()},
				       function(data){
				    	  pagination_p(data);
						  pageselectCallback_p(0);
						  $("#pcountdiv").text("共"+data+"条数据");
				    	   Alert("删除成功");
				    	   
				       },
				       "text"
				    );
				}});
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
