<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'model.jsp' starting page</title>
    
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
              <input type="hidden" id="role">
            </h3>
         </div>
         <div class="modal-body" style="height:580px;">
		 <div style="float:left;">
            <div style="line-height:38px;margin-top:20px;">
		     <label class="col-sm-2 control-label" style="text-align:right;width:130px;">联系人：</label>
			  <input style="width:230px;position:relative;" readonly="true"  type="text" class="form-control" id="uname" placeholder="请输入名称">
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
		    <div style="line-height:38px;margin-top:15px;">
		      <label class="col-sm-2 control-label" style="text-align:right;width:130px;">身份信息：</label>
			  <div style="width: 250px;height: 150px;border: 1px solid #ccc;margin-left: 130px;">
			     <img style="width: 250px;height: 150px;" id="idimag" ></img>
			  </div>
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
						<button type="button" class="btn btn-primary" onclick="checkUser()">招收</button>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
	
	<script>
	   var flag=0;
	   function checkUser(){
		  // alert(status);
		  var uid=$("#uid").val();
		//  alert(uid);
		  $.post(
			"Manager/checkUser.do",
			{"uid":uid,"role":3},
			function(data){
				Alert("招收成功");
				s_pageselectCallback(0);
			},
			"text"
		  );
	   }
	   
	 
	</script>
  </body>
</html>
