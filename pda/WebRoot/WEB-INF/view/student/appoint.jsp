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

</head>

<body>
	<jsp:include page="../public/head.jsp"></jsp:include>
	<div style="height:578px;width:1055px;margin:0 auto;">
		<jsp:include page="navigation.jsp"></jsp:include>
		<div class="major">
			<div
				style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;">
				考试预约</div>
			<div style="line-height:38px;margin-top:20px;">
				<div class="progress">
					<div class="progress-bar progress-bar-success" role="progressbar"
						aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
						style="width: 33%;">
						<span class="sr-only">33% 完成</span>
					</div>
					<div id="one" class="progress-bar progress-bar-info"
						role="progressbar" aria-valuenow="60" aria-valuemin="0"
						aria-valuemax="100" style="width: 0%;">
						<span class="sr-only">33% 完成（信息）</span>
					</div>
					<div id="tow" class="progress-bar progress-bar-warning"
						role="progressbar" aria-valuenow="60" aria-valuemin="0"
						aria-valuemax="100" style="width: 0%;">
						<span class="sr-only">34% 完成（警告）</span>
					</div>
				</div>
				<div id="firststep">
					<div style="margin-bottom:20px;">
						<span style="float:left;padding-left:10px;padding-right:10px;">请选择考试科目：</span>
						<input type="radio" name="subject" value="1"> 科目一 
						<input style="margin-left:20px;" type="radio" name="subject" value="2">科目二 
						<input style="margin-left:20px;" type="radio" name="subject" value="3"> 科目三
						<input style="margin-left:20px;" type="radio" name="subject" value="4"> 科目四<br />
					</div>
					<div style="margin-top:20px;">
						<span style="float:left;padding-left:10px;padding-right:10px;">请选择考试时间：</span>
						<div style="width:190px;"
							class="input-group date form_date col-md-5" data-date=""
							data-date-format="" data-link-field="dtp_input2"
							data-link-format="yyyy-mm-dd">
							<input class="form-control" size="10" type="text" id="date"
								readonly> <span class="input-group-addon"> <span
								class="glyphicon glyphicon-remove"></span>
							</span> <span class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
						<span style="padding-left:10px;padding-right:10px;color:red">提示：预约考试时间需大于十天：</span>
					</div>
					<div
						style="background-color:#F5F5F5;height:50px;line-height:50px;position:relative;top:50px;">
						<button type="button" style="margin-left: 50px;"class="btn btn-primary" id="first">下一步</button>
					</div>
				</div>

				<div id="secondstep" style="display:none;">
					<div style="margin-bottom:20px;">
						<div style="line-height:38px;margin-top:20px;">
							<div>
								<label class="col-sm-2 control-label" style="text-align:right;">姓名：</label>
								<input style="width:230px;position:relative;" readonly="true"
									type="text" class="form-control" id="name"
									placeholder="${sessionScope.user.name}">
							</div>
						</div>
						<div style="line-height:38px;margin-top:15px;">
							<div>
								<label class="col-sm-2 control-label" style="text-align:right;">身份证号：</label>
								<input style="width:230px;position:relative;" readonly="true"
									type="text" class="form-control" id="idnumber"
									placeholder="${sessionScope.user.idnumber}">
							</div>
						</div>
						<div style="line-height:38px;margin-top:15px;">
							<div>
								<label class="col-sm-2 control-label" style="text-align:right;">预约科目：</label>
								<input style="width:230px;position:relative;" readonly="true"
									type="text" class="form-control" id="ordersubject"
									placeholder="请输入名称">
							</div>
						</div>
						<div style="line-height:38px;margin-top:15px;">
							<div>
								<label class="col-sm-2 control-label" style="text-align:right;">预约时间：</label>
								<input style="width:230px;position:relative;" readonly="true"
									type="text" class="form-control" id="orderdate"
									placeholder="请输入名称">
							</div>
						</div>
					</div>
					<div
						style="padding-left:150px;background-color:#F5F5F5;height:50px;line-height:50px;position:relative;top:20px;">
						<button type="button" class="btn btn-primary" id="prev">上一步</button>
						<button type="button" class="btn btn-primary" id="second">确认信息</button>
					</div>
				</div>

				<div id="endstep" style="display:none;">
					<div class="jumbotron" style="padding-left:80px;">
						<h1>预约成功</h1>
						<p>请等待预约结果</p>
					</div>
				</div>

			</div>
		</div>
	</div>

	

	<script>
	$(function(){
		$.post("Order/order.do", {
			"subject" :null,
			"date" : null
		}, function(data, status) {
			//Alert(data);
		   if (data == 1) {
				Alert("您当期可预约项目为科目一");
				$("input[name='subject']").eq(0).attr("checked","checked");
			} else if (data == 2) {
				Alert("您当期可预约项目为科目二");
				$("input[name='subject']").eq(1).attr("checked","checked");
			} else if (data == 3) {
				Alert("您当期可预约项目为科目三");
				$("input[name='subject']").eq(2).attr("checked","checked");
			} else if (data == 4) {
				Alert("您当期可预约项目为科目四");
				$("input[name='subject']").eq(3).attr("checked","checked");
			} else if (data == -1) {
				Alert("您已有预约，请耐心等待！");
			} else {
				Change();
			}
		}, "text");
	});
		$("#first").click(function() {

			//	 var subject=$("input[name='subject']");
			var subjectval = null;
			var subject = document.getElementsByName("subject");
			for (var i = 0; i < subject.length; i++) {
				if (subject.item(i).checked) {
					subjectval = subject.item(i).value;
				}
			}
			var date = $("#date").val();
			if (subjectval == null) {
				Alert("请选择科目");
				return;
			}
			if (date == "") {
				Alert("请选择日期");
				return;
			}

			$.post("Order/order.do", {
				"subject" : subjectval,
				"date" : date
			}, function(data, status) {
				//Alert(data);
				if (data == 0) {
					Alert("只能预约10天后");
				} else if (data == 1) {
					Alert("您当期可预约项目为科目一");
				} else if (data == 2) {
					Alert("您当期可预约项目为科目二");
				} else if (data == 3) {
					Alert("您当期可预约项目为科目三");
				} else if (data == 4) {
					Alert("您当期可预约项目为科目四");
				} else if (data == -1) {
					Alert("您已有预约，请耐心等待！");
				} else {
					Change();
				}
			}, "text");
			function Change() {
				//	Alert(subjectval);
				$("#ordersubject").val("科目" + subjectval);
				$("#orderdate").val(date);
				$("#one").css({
					"width" : "33%"
				});
				$("#secondstep").css({
					"display" : "block"
				});
				$("#firststep").css({
					"display" : "none"
				});
			}
		});

		$("#prev").click(function() {
			$("#one").css({
				"width" : "0%"
			});
			$("#tow").css({
				"width" : "0%"
			});
			$("#secondstep").css({
				"display" : "none"
			});
			$("#firststep").css({
				"display" : "block"
			});
		});
		$("#second").click(function() {
			$.confirm({
				columnClass : 'col-md-4 col-md-offset-4',
				title : '確認預約',
				content : '确认预约',
				confirmButton:'确认',
				cancelButton:'取消',
				confirmButtonClass : 'btn-info',
				cancelButtonClass : 'btn-danger',
				confirm : function() {
					$.post("Order/confirmOrder.do", {
						"subject" : $("#ordersubject").val(),
						"date" : $("#orderdate").val()
					}, function(data) {
						$("#tow").css({
							"width" : "34%"
						});
						$("#secondstep").css({
							"display" : "none"
						});
						$("#firststep").css({
							"display" : "none"
						});
						$("#endstep").css({
							"display" : "block"
						});
					}, "text");
				},

			});

		});
		$(".form_date").datetimepicker({
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
