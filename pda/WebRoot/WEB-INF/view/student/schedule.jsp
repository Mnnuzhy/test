<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="rescourse/css/jquery-confirm.min.css" rel="stylesheet" />
<script src="rescourse/js/jquery-confirm.min.js"></script>
</head>

<body>
	<jsp:include page="../public/head.jsp"></jsp:include>
	<div style="height:578px;width:1055px;margin:0 auto;">
		<jsp:include page="navigation.jsp"></jsp:include>
		<div class="major">
			<div
				style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;">
				预约进度</div>
			<div style="margin:20px;">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>预约编号</th>
							<th>预约时间</th>
							<th>预约项目</th>
							<th>预约进度</th>
							<th>取消预约</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="id">${order.id}</td>
							<td id="date">${order.date}</td>
							<td id="subject">${order.subject}</td>
							<td id="permision">${order.permision}</td>
							<td id="can"><a href="javascript:void(0)" id="cancle">取消预约</a></td>
						</tr>


					</tbody>
				</table>
			</div>
			<div id="changePanel"
				style="background-color:#F5F5F5;height:40px;line-height:75px;position:relative;top:20px;line-height:38px;text-align:right;">
				共1条数据</div>

		</div>
	</div>
	
	<script>
		$('.form_date').datetimepicker({
			minView : 2, //选择日期后，不会再跳转去选择时分秒 
			format : "yyyy-mm-dd", //选择日期后，文本框显示的日期格式 
			language : 'zh-CN',/*加载日历语言包，可自定义*/
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0
		});
		$("#Pagination").pagination(50, {
			callback : pageselectCallback,
			items_per_page : 10,// Show only one item per page
			prev_text : "上一页",
			next_text : "下一页",
			prev_show_always : false,
			next_show_always : false

		});
		function pageselectCallback(page_index, jq) {

			return false;
		}
		$("#cancle").click(function() {
          //  alert("${order.subject}");
          
			if ($("#subject").text() == "") {
				Alert("您当期没有预约！");
				return;
			}
			if ("${order.permision}" == "通过") {
				Alert("您已约考成功，不能取消");
				return;
			}
			$.confirm({
				columnClass : 'col-md-4 col-md-offset-4',
				title : '確認預約',
				content : '确认预约',
				confirmButton : '确认',
				cancelButton : '取消',
				confirmButtonClass : 'btn-info',
				cancelButtonClass : 'btn-danger',
				confirm : function() {

					$.post("Order/deleteOrder.do", "", function(data) {
						$("#id").text("");
						$("#date").text("");
						$("#subject").text("");
						$("#permision").text("");
					

						Alert("取消成功");

					}, "text"

					);
				}
			});
		});
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
