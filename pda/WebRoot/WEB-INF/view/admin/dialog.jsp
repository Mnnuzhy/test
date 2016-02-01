<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dialog.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
 
	<!-- 审核用户（Modal） -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				 <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h3 style="margin-left:50px;" class="modal-title" id="myModalLabel">
                                             用户详细资料<input type="hidden" id="uid">
            </h3>
         </div>
         <div class="modal-body" style="height:380px;">
		 <div style="float:left;">
            <div style="line-height:38px;margin-top:20px;">
		     <label class="col-sm-2 control-label" style="text-align:right;width:130px;">联系人：</label>
			  <input style="width:230px;position:relative;" readonly="true"  type="text" class="form-control" id="name" placeholder="请输入名称">
		  </div>
          <div style="line-height:38px;margin-top:15px;">
		     <label class="col-sm-2 control-label" style="text-align:right;width:130px;">身份证号：</label>
			  <input style="width:230px;position:relative;" readonly="true"   type="text" class="form-control" id="idnumber" placeholder="请输入名称">
		  </div>
          
          <div style="line-height:38px;margin-top:15px;">
		    <label class="col-sm-2 control-label" style="text-align:right;width:130px;">注册时间：</label>
			  <input style="width:230px;position:relative;" readonly="true"  type="text" class="form-control" id="registertime" placeholder="请输入名称">
		  </div>
          <div style="line-height:38px;margin-top:15px;">
		      <label class="col-sm-2 control-label" style="text-align:right;width:130px;">上次更新时间：</label>
			  <input style="width:230px;position:relative;" readonly="true"  type="text" class="form-control" id="updatetime" placeholder="请输入名称">
		  </div>
          <div style="line-height:38px;margin-top:15px;" >
		      <label class="col-sm-2 control-label" style="text-align:right;width:130px;">电子邮箱：</label>
			  <input style="width:230px;position:relative;" readonly="true"  type="text" class="form-control" id="email" placeholder="请输入名称">
		  </div>	  
		  <div style="line-height:38px;margin-top:15px;">
		      <label class="col-sm-2 control-label" style="text-align:right;width:130px;">联系地址：</label>
			  <input style="width:230px;position:relative;" readonly="true"  type="text" class="form-control" id="address" placeholder="请输入名称">
		  </div>
	      <div style="line-height:38px;margin-top:15px;">
		      <label class="col-sm-2 control-label" style="text-align:right;width:130px;">电话号码：</label>
			  <input style="width:230px;position:relative;" readonly="true"  type="text" class="form-control" id="tel" placeholder="请输入名称">
		  </div>
         </div>
		    <div style="width:120px;height:200px;float:right;margin-right:40px;">
			  <div style="border:1px solid #ccc;width:120px;height:150px;float:right;"> 
			      <img style="width:120px;height:150px;" id="imag" ></img>
		      </div>
			   <div  id="imagdiv" style="width:120px;height:50px;float:right; margin-top:10px;display:none;">
			      <input type="file" id="file" name="file">
		      </div>
		   </div>
		 </div>
				<div class="modal-footer">
					<div id="changePanel"
						style="background-color:#F5F5F5;height:60px;padding-right:50px;padding-top: 15px;">
						<button type="button" class="btn btn-primary" onclick="checkUser()">通过审核</button>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<script>
	   function checkUser(){
		  // alert(status);
		  var uid=$("#uid").val();
		//  alert(uid);
		  $.post(
			"Manager/checkUser.do",
			{"uid":uid},
			function(data){
				if(data==0)
					Alert("已通过审核，无需重复审核");
				else
					Alert("审核成功");
				t_pageselectCallback(0);
				s_pageselectCallback(0);
			},
			"text"
		  );
	   }
	</script>
  </body>
</html>
