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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="rescourse/js/jquery-confirm.min.js"></script>
	<script src="rescourse/js/ajaxfileupload.js"></script>

  </head>
  
  <body>
     <!-- 查看详细信息（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h3 style="margin-left:50px;" class="modal-title" id="myModalLabel">
                                             学员详细资料<input type="hidden" id="sid">
            </h3>
         </div>
         <div class="modal-body" style="height:380px;">
		 <div style="float:left;">
            <div style="line-height:38px;margin-top:20px;">
		     <label class="col-sm-2 control-label" style="text-align:right;width:130px;">联系人：</label>
			  <input style="width:230px;position:relative;" readonly="true"  type="text" class="form-control" id="sname" placeholder="请输入名称">
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
			  <div id="changePanel" style="background-color:#F5F5F5;height:60px;line-height:60px;padding-right:50px;"> 
		       <button type="button" class="btn btn-primary" id="change" style="margin-top: 18px;">修改信息</button>
             </div>	
		   <div id="subchangePanel"  style="background-color:#F5F5F5;height:60px;line-height:59px;padding-right:50px;display:none;"> 
		       <button type="button" class="btn btn-default" id="calchange">取消</button>
		       <button type="button" class="btn btn-primary" id="subchange">提交修改</button>
          </div>	  
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>

   <!-- 学员预约（Modal） -->
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
                                                   学员预约信息<input type="hidden" id="oid">
            </h3>
         </div>
         <div class="modal-body" style="height:250px;">
		 <div style="float:left;">
            <div style="line-height:38px;margin-top:20px;">
		     <label class="col-sm-2 control-label" style="text-align:right;width:130px;">联系人：</label>
			  <input style="width:230px;position:relative;" readonly="true" type="text" class="form-control" id="oname" placeholder="没有预约">
		  </div>
          <div style="line-height:38px;margin-top:15px;">
		     <label class="col-sm-2 control-label" style="text-align:right;width:130px;">身份证号：</label>
			  <input style="width:230px;position:relative;" readonly="true" type="text" class="form-control" id="oidnumber" placeholder="没有预约">
		  </div>
          
          <div style="line-height:38px;margin-top:15px;">
		    <label class="col-sm-2 control-label" style="text-align:right;width:130px;">预约科目：</label>
			  <input style="width:230px;position:relative;" readonly="true" type="text" class="form-control" id="osubject" placeholder="没有预约">
		  </div>
		   <div style="line-height:38px;margin-top:15px;">
		    <label class="col-sm-2 control-label" style="text-align:right;width:130px;">预约考试时间：</label>
			  <input style="width:230px;position:relative;" readonly="true"  type="text" class="form-control" id="odate" placeholder="没有预约">
		  </div>
         </div>
		    <div style="width:120px;height:200px;float:right;margin-right:40px;">
			  <div style="border:1px solid #ccc;width:120px;height:150px;float:right;"> 
			      <img style="width:120px;height:150px;" id="oimag"></img>
		      </div>
		   </div>
		 </div>
         <div class="modal-footer">
			  <div id="changePanel" style="background-color:#F5F5F5;height:60px;line-height:60px;padding-right:50px;"> 
		       <button type="button" class="btn btn-primary" id="agree" value="1">同意</button>
			   <button type="button" class="btn btn-primary" id="noagree" value="0">不同意</button>
             </div>	
		   	  
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
<!-- 查看成绩单 -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h3 id="stitle" style="margin-left:50px;" class="modal-title" id="myModalLabel">
              XXX学员成绩单
            </h3>
            <input type="hidden" id="ssid">
             <input type="hidden" id="suid">
         </div>
         <div class="modal-body" style="height:250px;">
		 <div style="float:left;">
            <div style="line-height:38px;margin-top:20px;">
		     <label class="col-sm-2 control-label" style="text-align:right;width:130px;">科目一：</label>
			  <input style="width:230px;position:relative;" type="text" class="form-control" id="sone" placeholder="请输入名称">
		  </div>
          <div style="line-height:38px;margin-top:15px;">
		     <label class="col-sm-2 control-label" style="text-align:right;width:130px;">科目二：</label>
			  <input style="width:230px;position:relative;"  type="text" class="form-control" id="stow" placeholder="请输入名称">
		  </div>
          
          <div style="line-height:38px;margin-top:15px;">
		    <label class="col-sm-2 control-label" style="text-align:right;width:130px;">科目三：</label>
			  <input style="width:230px;position:relative;"  type="text" class="form-control" id="sthree" placeholder="请输入名称">
		  </div>
		   <div style="line-height:38px;margin-top:15px;">
		    <label class="col-sm-2 control-label" style="text-align:right;width:130px;">科目四：</label>
			  <input style="width:230px;position:relative;"  type="text" class="form-control" id="sfour" placeholder="请输入名称">
		  </div>
         </div>
		    <div style="width:120px;height:200px;float:right;margin-right:40px;">
			  <div style="border:1px solid #ccc;width:120px;height:150px;float:right;"> 
			      <img style="width:120px;height:150px;" id="simag"></img>
		      </div>
		   </div>
		 </div>
         <div class="modal-footer">
			  <div id="changePanel" style="background-color:#F5F5F5;height:60px;line-height:60px;padding-right:50px;"> 
		       <button type="button" class="btn btn-primary" id="inputScore" style="margin-top: 20px;">录入成绩</button>
              </div>	
   
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
  </body>
  <script>
	function check(){
		  var one=$("#sone").val();
		  var tow=$("#stow").val();
		  var three=$("#sthree").val();
		  var four=$("#sfour").val();
		  if(one<90){
			  $("#sone").removeAttr("readonly");
			  $("#stow").attr("readonly","true");
			  $("#sthree").attr("readonly","true");
			  $("#sfour").attr("readonly","true");
		  }else{
			  if(tow<90){
				  $("#sone").attr("readonly","true");
				  $("#stow").removeAttr("readonly");
				  $("#sthree").attr("readonly","true");
				  $("#sfour").attr("readonly","true");
			  }else{
				  if(three<90){
					  $("#sone").attr("readonly","true");
					  $("#stow").attr("readonly","true");
					  $("#sthree").removeAttr("readonly");
					  $("#sfour").attr("readonly","true");
				  }else{
					  if(four<90){
						  $("#sone").attr("readonly","true");
						  $("#stow").attr("readonly","true");
						  $("#sthree").attr("readonly","true");
						  $("#sfour").removeAttr("readonly");
						  
					  }
				  }
			  }
		  }
	}
  $("#change").click(function(){
      // alert("****");
	   
	    $("#tel").removeAttr("readonly");
	    $("#email").removeAttr("readonly");
	    $("#address").removeAttr("readonly");
       $("#changePanel").css({"display":"none"});
	    $("#subchangePanel").css({"display":"block"});
	    $("#imagdiv").css({"display":"block"});
  });
  
   $("#calchange").click(function(){
      // alert("****");
       $("#tel").attr("readonly","readonly");
	    $("#email").attr("readonly","readonly");
	    $("#address").attr("readonly","readonly");
       $("#changePanel").css({"display":"none"});
       $("#changePanel").css({"display":"block"});
	    $("#subchangePanel").css({"display":"none"});
	    $("#imagdiv").css({"display":"none"});
  });
  $("#subchange").click(function(){
	     var sid=$("#sid").val();
 	     var tel=$("#tel").val();
		 var email=$("#email").val();
		 var address=$("#address").val();
		// alert(sid);
			$.ajaxFileUpload({
				
				url:"User/upload.do",
				type:"post",
				fileElementId:"file",
				dataType:"text",
				 success: function (data, status){
					//alert(data);
				  	if(data!="")
					  $("#imag").attr("src","rescourse/imag/user/"+data);
				      $.post(
					    		"Manager/changeUser.do",
					    		{"sid":sid,"tel":tel,"email":email,"address":address,"filename":data},
					    		function(data){
					    			Alert("修改成功");
					    		},
					    		"text"
					    	 );
			         },
			});
 	
 });
  
  $("#agree").click(function(){
	  
	var per=$(this).val();
	var id=$("#oid").val();
//	alert(id);
     $.post( 
       "Order/perOrder.do",
       {"id":id,"per":per},
       function(data){
    	   Alert("操作成功！");
       },
       "text"
		);
	  
  });
  
  $("#noagree").click(function(){
	  
	  var per=$(this).val();
		var id=$("#oid").val();
//		alert(id);
	     $.post( 
	       "Order/perOrder.do",
	       {"id":id,"per":per},
	       function(data){
	    	   Alert("操作成功！");
	       },
	       "text"
			);
  });
  
  $("#inputScore").click(function(){
	  
	  var one=$("#sone").val();
	  var tow=$("#stow").val();
	  var three=$("#sthree").val();
	  var four=$("#sfour").val();
	  var id=$("#ssid").val();
	  var sid=$("#suid").val();
	 // alert(ssid);
	  $.post(
		"Manager/inputScore.do",
		{"id":id,"sid":sid,"one":one,"tow":tow,"three":three,"four":four},
		function(data){
			
			$.confirm({
				title : 'hello',
				content : '操作成功',
				confirmButton : false,
				cancelButton : '确定',
				cancel : function() {
				window.open("ChangeOver/trainer.do?flag=4","_self");
				}
			});
		
			
			//window.open("ChangeOver/trainer.do?flag=4","_self");
		},
		"text"
	  );
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
</html>
