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
  
    <!-- 查看考试（Modal） -->
	<div class="modal fade" id="exammodel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 style="margin-left:50px;" class="modal-title" id="myModalLabel">
						模拟考试信息</h4><input type="hidden" id="heid">
				</div>
				<div class="modal-body" style="height:250px;">
					<div style="margin-left:70px;">
						<div style="line-height:38px;margin-top:20px;">
							<label class="col-sm-2 control-label"
								style="text-align:right;width:130px;">考试名称：</label> <input
								style="width:230px;position:relative;" type="text"
								class="form-control" readonly id="name" placeholder="请输入名称">
						</div>
						<div style="line-height:38px;margin-top:15px;">
							<label class="col-sm-2 control-label"
								style="text-align:right;width:130px;">考试科目：</label> <input
								style="width:230px;position:relative;" type="text"
								class="form-control" readonly id="subject" placeholder="请输入名称">
						</div>
						<div style="line-height:38px;margin-top:15px;">
							<label class="col-sm-2 control-label"
								style="text-align:right;width:130px;">参与考试人数：</label> <input
								style="width:230px;position:relative;" type="text"
								class="form-control" readonly id="number" placeholder="请输入名称">
						</div>
						<div style="line-height:38px;margin-top:15px;">
							<label class="col-sm-2 control-label"
								style="text-align:right;width:130px;">考试通过率：</label> <input
								style="width:230px;position:relative;" type="text"
								class="form-control" readonly id="rate" placeholder="请输入名称">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div
						style="background-color:#F5F5F5;height:60px;padding-right:50px;padding-top:15px; ">
						<button type="button" class="btn btn-primary" id="clearData">清空数据</button>
					</div>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
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
	
	<!-- 修改题目（Modal） -->
	<div class="modal fade" id="promodel" tabindex="-1" role="dialog" 
	
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog"  style="width:1000px;" >
			<div class="modal-content" >
				 <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h3 style="margin-left:50px;" class="modal-title" id="myModalLabel">
                                            修改试题<input type="hidden" id="pid">
            </h3>
         </div>
         <div class="modal-body" style="">
		     <div id="cg"  style="margin-left:20px;margin-top:30px;">			
					<div>
						<div style="line-height:38px;margin-top:20px;">
							<div>
								<label class="col-sm-2 control-label" style="text-align:right;">试题类型：</label>
								  <select class="form-control" style="width:230px;" id="cptype">
								         <option>判断题</option>
								         <option>单选题</option>
								         <option>多选题</option>
								      </select>
							</div>
						</div>
						<div style="line-height:38px;margin-top:15px;">
							<div id="idnumberdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">科目：</label>
								      <select class="form-control" style="width:230px;" id="cpsubject">
								         <option>科目一</option>
								         <option>科目四</option>
								      </select>
								   
							</div>
						</div>
						
						<div style="line-height:38px;margin-top:15px;">
								<div id="idnumbdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">试题内容：</label>
								  <textarea id="cpcontent" style="width: 700px;" class="form-control" rows="4"></textarea>
							</div>
						</div>
						<div style="line-height:38px;margin-top:25px;">
								<div id="idnumbdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">试题图片：</label>
								  <input type="file" id="cfile" name="cfile">
							</div>
						</div>
						<div style="line-height:38px;margin-top:50px;">
								<div id="idnumbdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">选项 A：</label>
								<input style="width:700px;position:relative;" type="text" 
									class="form-control" id="cpa" placeholder="请输入名称">
							</div>
						</div>
						<div style="line-height:38px;margin-top:15px;">
								<div id="idnumbdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">选项 B：</label>
								<input style="width:700px;position:relative;" type="text" 
									class="form-control" id="cpb" placeholder="请输入名称">
							</div>
						</div>
						<div id="cdc" style="line-height:38px;margin-top:15px;display:none;">
								<div id="idnumbdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">选项 C：</label>
								<input style="width:700px;position:relative;" type="text" 
									class="form-control" id="cpc" placeholder="请输入名称">
							</div>
						</div>
						<div id="cdd" style="line-height:38px;margin-top:15px;display:none;">
								<div id="idnumbdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">选项 D：</label>
								<input style="width:700px;position:relative;" type="text" 
									class="form-control" id="cpd" placeholder="请输入名称">
							</div>
						</div>
						<div style="line-height:38px;margin-top:15px;" id="cresult">
								<div id="idnumbdiv">
								<label class="col-sm-2 control-label" style="text-align:right;">正确选项：</label>
								 <div>
							   <label class="checkbox-inline" id="cla">
							      <input type="radio" id="ca" name="crs" value="A"> 选项 A
							   </label>
							   <label class="checkbox-inline" id="clb">
							      <input type="radio" id="cb" name="crs" value="B"> 选项 B
							   </label>
							   <label class="checkbox-inline" id="clc" style="display:none;">
							      <input type="radio" id="cc" name="crs" value="C"> 选项 C
							   </label>
							    <label class="checkbox-inline" id="cld" style="display:none;">
							      <input type="radio" id="cd" name="crs" value="D"> 选项 D
							   </label>
							    <label class="checkbox-inline" id="eld" >
							      
							   </label>
							   
							</div>
							</div>
						</div>
						 </div>	
						 <div 
						style="background-color:#F5F5F5;height:80px;line-height:75px;position:relative;top:20px;">
						<button type="button" class="btn btn-primary" id="updatePro"
							style="margin-top: 20px;" >提交</button>
					</div>		
	         	</div>
	        	 </div>
				<div class="modal-footer">
					
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	  <!-- 教练资格认证（Modal） -->
	<div class="modal fade" id="identityModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 777px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 style="margin-left:50px;" class="modal-title" id="myModalLabel">
						教练资格认证（<span id="trainername"></span>）</h4>
						<input type="hidden" id="ttid">
				</div>
				<div class="modal-body" style="">
				  <div style="width:300px;height: 200px;border:1px solid #ccc;display:inline-block;vertical-align:top;margin-left: 40px;">
		       <img id="imag1" src="rescourse/imag/trainer/${tr.imag1}" style="width:300px;height: 200px;"></img>
		       <div style="line-height:38px;margin-top:15px;">
		          <label style="width:100px;float:left;margin-left: 120px;">驾照图片</label>
		        
		         </div>
		      </div>
		      
		      <div style="height: 200px;display:inline-block;margin-left: 60px;">
		         <img id="imag2" src="rescourse/imag/trainer/${tr.imag2}" style="width:300px;height: 200px;"></img>
		           <div style="line-height:38px;margin-top:15px;">
		          <label  style="width:100px;float:left;margin-left: 120px;">教练证图片</label>
		        
		         </div>
		      </div>
		       <div style="width:250px;height: 70px;margin-left: 100px;margin-top: 50px;display:inline-block;vertical-align:top;margin-left: 200px;">
		  
		          <div style="line-height:38px;margin-top:25px;margin-left: 100px;">
			       <label  style="width:200px;color:#17A05D;">驾驶年限：<span id="year">无数据</span></label>
				  </div>
				</div>
				
				<div class="modal-footer">
					<div
						style="background-color:#F5F5F5;height:60px;padding-right:50px;padding-top:15px; ">
						<button type="button" class="btn btn-primary" id="renzhen">认证</button>
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
		  role=$("#role").val();
		  var uid=$("#uid").val();
		//  alert(role);
		//  alert(uid);
		  $.post(
			"Manager/checkUser.do",
			{"uid":uid,"role":role},
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
	   $("#renzhen").click(function(){
		    //Alert("***");
		    var tid=$("#ttid").val();
		    //Alert(tid);
		    $.post(
				    "Manager/comfirmIdentity.do",
				    {"tid":tid},
				    function(data){
				    	Alert("认证成功！");
				    	t_pageselectCallback(0);
						s_pageselectCallback(0);
				    },
				    "text"
				);
	   });
	   $("#cptype").click(function(){
			var ptype=$(this).val();
			//alert(ptype);
			if(ptype=="判断题"){
				$("input[name='crs']").attr("type","radio");
				$("#clc").css("display","none");
				$("#cld").css("display","none");
				$("#cdc").css("display","none");
				$("#cdd").css("display","none");
				flag=0;
			}else if(ptype=="单选题"){
				$("input[name='crs']").attr("type","radio");
				$("#clc").css("display","inline-block");
				$("#cld").css("display","inline-block");
				$("#cdc").css("display","block");
				$("#cdd").css("display","block");
				flag=1;
			}else if(ptype=="多选题"){
				$("input[name='crs']").attr("type","checkbox");
				$("#clc").css("display","inline-block");
				$("#cld").css("display","inline-block");
				$("#cdc").css("display","block");
				$("#cdd").css("display","block");
				flag=1;
			}
		});
	   
	   $("#clearData").click(function(){
		   var eid=$("#heid").val();
		  // alert(eid);
		   $.post(
					"Exam/deleteData.do",
					{"eid":eid},
					function(data){
					   Alert("操作成功");
					   $("#number").val("0.0");
					    $("#rate").val("�");
					},
					"text"
					);
	   });
	   $("#updatePro").click(function(){
		   var ptype=$("#cptype").val();
			var psubject=$("#cpsubject").val();
			var pcontent=$("#cpcontent").val();
			var pa=$("#ca").val();
			var pb=$("#cb").val();
			var pc=$("#cc").val();
			var pd=$("#cd").val();
			var result="";
		  //  var result=$("input[name='rs']:checked").val();
		 
		    $("input[name='crs']").each(function() { 
		    	//alert($(this).val());    
	            if ($(this).is(':checked')) {     
	            	result+=$(this).val();     	
	            }
	        });  
	    alert(result+ptype+psubject+pcontent+pa+pb+pc+pd);
		   // alert(result);
		    if(flag==1&&(ptype==""||ptype==null||psubject==""||psubject==null||pcontent==""||pcontent==null|pa==null||pa==""||pb==""||pb==null||pc==""||pc==null||pd==null||pd==""||result==""||result==null)){
	        	 Alert("请正确输入！");
	        	 return ;
	         }
		    if(flag==0&&(ptype==""||ptype==null||psubject==""||psubject==null||pcontent==""||pcontent==null|pa==null||pa==""||pb==""||pb==null||result==""||result==null)){
	        	 Alert("请正确输入！");
	        	 return ;
	         }
		    $.ajaxFileUpload({
			
			url:"Exam/upload1.do",
			type:"post",
			fileElementId:"cfile",
			dataType:"text",
			success: function (data, status){
				// alert("*****");
				 $.post(
						    "Exam/updatePro.do",
						    {"pid":$("#pid").val(),"psubject":psubject,"pcontent":pcontent,"pimag":data,"pa":pa,"pb":pb,"pc":pc,"pd":pd,"result":result,"ptype":ptype},
						    function(data){
						    	$("#pcountdiv").text("共"+data+"条数据");
								pagination_p(data);
								pageselectCallback_p(0);
						    	Alert("修改成功");
						    	
						    },
						    "text"
						    );
		         },
		});
	   });
	</script>
  </body>
</html>
