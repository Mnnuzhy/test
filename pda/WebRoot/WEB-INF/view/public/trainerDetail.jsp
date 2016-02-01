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

<title>My JSP 'login.jsp' starting page</title>


</head>

<body>
	<jsp:include page="head.jsp"></jsp:include>
	 <div style="height:600px;width:1055px;margin:0 auto;margin-top:40px;">
		   
			<div>
			     <div style="height:40px;border-top:2px solid #114EC9;margin-top:5px;line-height:32px;font-size:18px;padding-left:10px;">
			     <span ></span>教练信息
			    </div>
			    <div style="height:255px;padding-top:20px;padding-left:110px;">
				 <div style="width:260px;height:170px;float:left;border:1px solid #ccc;">
				     <img style="width:260px;height:170px;" src="rescourse/imag/trainer/${map.tr.imag}">
				 </div>
				  <div style="width:410px;height:170px;float:left;margin-left:20px;padding-top:20px;">
				     <div><label style="font-size:20px;">优惠价格：${map.tr.price}元/全部</label></div>
					 <div><label style="font-size:20px;">所属地区：${map.tr.place} </label></div>
					 <div><label style="font-size:20px;">咨询电话：${map.user.tel}</label></div>
					 <div><label style="font-size:20px;">通过人数：${map.count}&nbsp;人</label></div>
				 </div>
				  <div style="width:164px;height:170px;float:left;margin-left:20px;padding-top:40px;">
				    <label>${map.user.name}(${map.user.sex}) (${map.year}年驾龄)</label>
				    <c:if test="${map.user.status==2}">
					<img style="width:135px;height:33px;" src="rescourse/imag/7.png">
					</c:if>
				 </div>
				
				</div>
			    <div style="height:40px;border-top:2px solid #114EC9;margin-top:5px;background-color:#F5F5F5;line-height:32px;font-size:18px;padding-left:10px;">
			    <span ></span>详情简介
			   </div>
				<div style="width:900px;margin:0 auto;">${map.tr.instruction}</div>
				 <div style="height:40px;border-top:2px solid #114EC9;margin-top:5px;background-color:#F5F5F5;line-height:32px;font-size:18px;padding-left:10px;">
			    <span ></span>学车问答
			   </div>
		<div style="">
	          <div class="form-group" style="margin-top:30px;">
	          <input type="hidden" id="tid" value="${map.user.id}">
			<textarea class="form-control" rows="3" id="content"></textarea>
		  </div>
		  <div> 
		       <button type="button" class="btn btn-primary" id="leaveQuestion" style="margin-left: 10px;">提问</button>
		       <button type="button" class="btn btn-default" id="close" style="float:right;">收起列表</button>
          </div>	 
		  <div id="comentdiv"  style="margin-top:15px;font-size:15px;">
	

		  </div>
		  
		  </div>
		    
				</div>
				 <div style="height:40px;border-top:2px solid #114EC9;margin-top:5px;background-color:#F5F5F5;line-height:32px;font-size:18px;padding-left:10px;margin-top: 20px;">
			    <span ></span>网上报名
			  </div>
				<div style="">
				   <div style="line-height:38px;margin-top:15px;">
		          <div> <label class="col-sm-2 control-label" style="text-align:right;">姓名：</label>
			      <input style="width:230px;position:relative;float:left;" id="sname" type="text" class="form-control"></div>
			      <span id="namespan" style="margin-left:10px;color:#A94442;">
								* </span>
		            </div>
			       <div style="line-height:38px;margin-top:15px;">
		          <div id="idnumberdiv"> <label class="col-sm-2 control-label" style="text-align:right;">身份证号：</label>
			      <input style="width:230px;position:relative;float:left;" id="sidnumber" type="text" class="form-control">
			      <span id="idnumberspan" style="margin-left:10px;color:#A94442;">
								* </span>
						
			      </div>
		            </div>
		             <div style="line-height:38px;margin-top:20px;">
		      <div> <label class="col-sm-2 control-label" style="text-align:right;">身份信息：</label>
			  <input type="file" name="file" id="file" >
			   <span  style="margin-left:10px;color:#A94442;">
								身份信息用于身份证信息的验证 ，请将身份证正面拍照上传</span>
			  </div>
		  </div>
					 <div style="line-height:38px;margin-top:30px;">
				   <label class="col-sm-2 control-label" style="text-align:right;">性别：</label>
				   <label class="checkbox-inline">
					  <input type="radio" name="optionsRadiosinline" name="sex" 
						 value="男" checked> 男
				   </label>
				   <label class="checkbox-inline">
					  <input type="radio" name="optionsRadiosinline" name="sex" 
						 value="女"> 女
				   </label>
				</div>
		         <div id="teldiv" style="line-height:38px;margin-top:15px;">
		          <div> <label class="col-sm-2 control-label" style="text-align:right;">联系电话：</label>
			      <input style="width:230px;position:relative;float:left;" id="stel" type="text" class="form-control" ></div>
			      <span id="telspan" style="margin-left:10px;color:#A94442;">
								* </span>
		         </div>
		         
		         <div id="emaildiv" style="line-height:38px;margin-top:15px;">
		          <div> <label class="col-sm-2 control-label" style="text-align:right;">邮箱：</label>
			      <input style="width:230px;position:relative;float:left;" id="semail" type="text" class="form-control" ></div>
			      <span id="emailspan" style="margin-left:10px;color:#A94442;">
								* </span>
		         </div>
				 
				  <div style="line-height:38px;margin-top:15px;">
		          <div> <label class="col-sm-2 control-label" style="text-align:right;">备注：</label>
				  <textarea style="width:400px;" class="form-control" id="sremark" rows="4" id="content"></textarea>
				  
				  </div>
				  </div>
			     <div id="changePanel" style="background-color:#F5F5F5;height:80px;line-height:75px;position:relative;top:20px;padding-left:180px;"> 
		         <button type="button" class="btn btn-success" id="register">提交</button>
				 <button type="button" class="btn btn-default" id="cancle" style="margin-left:20px;">取消</button>
                </div>	 
		         
				
              </div>
	</div>
	<script>
		$(function() {
			showQuestion();
		});
		  var flag = 0;
		  var flag1 = 0;
		  var flag2 = 0;
				    $("#stel").blur(function(){
						if($(this).val()==null||$(this).val()==""){
							return ;
						}
					 var tel=$(this).val();	 
					// alert(tel);
					 var bValidate = RegExp(/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/).test(tel);  
					     if (bValidate) {  	
						   $("#teldiv").removeClass("has-error");
						   flag=1;
					    }  
					    else{
					         $("#teldiv").addClass("has-error");
					         flag=0; 
					    } 
					        
				 });
				 $("#semail").blur(function(){
						if($(this).val()==null||$(this).val()==""){
							return ;
						}
					 var email=$(this).val();
					// alert("1111");
					 var bValidate = RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(email);  
					  if (bValidate) {  
						  $("#emaildiv").removeClass("has-error");
						   flag1=1; 
					    }  
					    else  {
					    	 $("#emaildiv").addClass("has-error");
						     flag1=0; 
				
					    }	 
				 });
		function showQuestion(){
			$.post(
					  "Coment/showQuestion.do",
					  {"tid":${map.user.id}},
					  function(data){
						  
						  for(var i=0;i<data.length;i++){
							  //alert(data.sname);
							  var str=" <div style='border-top:1px solid #ccc;height:100px;padding-left:20px;padding-top: 10px;'>";
							  str+="<div>["+data[i].comentdate+"]游客问:  "+data[i].coment+"</div>";
							  if(data[i].replycoment!=null)
							   str+="<div style='color:#F25F08;margin-top: 10px;'>["+data[i].replydate+"]"+data[i].tname+"回复："+data[i].replycoment+"</div></div>"
							  $("#comentdiv").append(str);
						  }
					  },
					  "json"
					);
		}
		$("#close").click(function() {
			//alert("00");
			var text=$(this).text();
			if(text=="收起列表"){
			  $("#comentdiv").css("display","none");
			  $(this).text("展开列表");
			}else if(text=="展开列表"){
				  $("#comentdiv").css("display","block");
				  $(this).text("收起列表");
				}
		});
		$("#leaveQuestion").click(function() {
			var tid=$("#tid").val();
			var content=$("#content").val();
			//alert(tid+content);
			if(content==null||content==""){
				alert("请正确输入！");
				return ;
			}
			$.post(
					  "Coment/leaveQuestion.do",
					  {"tid":tid,"content":content},
					  function(data){
						   alert("提问成功！");
						   $("#content").val("");
						   $("#comentdiv").html("");
						   showQuestion();
					  },
					  "json"
					);
		});
		  $("#register").click(function(){
			
			  var name=$("#sname").val();
			  var idnumber=$("#sidnumber").val();
			  var sex=$("input:checked").val();
			  var tel=$("#stel").val();
			  var remark=$("#sremark").val();
			  var file=$("#file").val();
			  var email=$("#semail").val();
			  //alert(remark);
			  if(name.trim().length==0||idnumber.trim().length==0||tel.trim().length==0||email.trim().length==0||file.length==0||flag==0||flag1==0||flag2==0){
				  alert("请正确输入！");
				  return;
			  }
	           $.ajaxFileUpload({
					
					url:"User/upload1.do",
					type:"post",
					fileElementId:"file",
					dataType:"text",
					 success: function (data, status){
						// alert(data);
			       $.post(
				"Manager/takeinStudent.do",
				{"tid":$("#tid").val(),"name":name,"idnumber":idnumber,"sex":sex,"tel":tel,"email":email,"remark":remark,"idimag":data},
				function(data){
					alert("报名成功！");
					$("#sname").val("");
					$("#sidnumber").val("");
					$("#stel").val("");
					$("#sremark").val("");
					email=$("#semail").val("");
				},
				"text"
			  );
			         },
				});
		  });
		  $("#cancle").click(function(){
				$("#sname").val("");
				$("#sidnumber").val("");
				$("#stel").val("");
				$("#sremark").val("");
				$("#file").val("");
		  });
		  $("#sidnumber").blur(function(){
				if($(this).val()==null||$(this).val()==""){
					return ;
				}
		    	$.post(
		    		"User/varify.do",
		    		{"idnumber":$(this).val()},
		    		function(data){
		    			//alert(data);
		    			 if(data!=-1){
			    			  $("#idnumberdiv").addClass("has-error");
			    			  $("#idnumberspan").text("该身份证已被使用！");
			    			  flag2=0;
			    			}
		    			 else{
		    				  $("#idnumberdiv").removeClass("has-error");
		    				  $("#idnumberspan").text("*");
		    				  flag2=1;
		    			 }
		    		},
		    		"text"
		    	);
		    });
		  
	</script>
</body>
</html>
