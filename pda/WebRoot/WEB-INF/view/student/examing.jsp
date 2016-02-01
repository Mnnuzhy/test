<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'home.jsp' starting page</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
   <link href="rescourse/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <script src="rescourse/js/jquery-2.1.1.min.js"></script>
   <script src="rescourse/bootstrap/js/bootstrap.min.js"></script>
   <link href="rescourse/css/main.css" rel="stylesheet"/>
   <link href="rescourse/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet"/>
   <link href="rescourse/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
   <script src="rescourse/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
   <script src="rescourse/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
   <script src="rescourse/bootstrap/js/modal.js"></script>
   <link href="rescourse/css/pagination.css" rel="stylesheet"/>
   <script src="rescourse/js/jquery.pagination.js"></script>
   <link href="rescourse/css/jquery-confirm.min.css" rel="stylesheet" />
   <script src="rescourse/js/jquery-confirm.min.js"></script>

  </head>
  
  <body>
      <div class="head">
       <div style="height:60px;top:16px;position:relative;">
        <div style="height:80px;top:16px;position:relative;color:white;font-size:35px;padding-left:200px;line-height:5px;"> 
                       <img style="height:70px;width:70px;" src="rescourse/imag/exam.png"> 模拟考试
       </div>
   </div>
    <div style="border:1px solid #CCCCCC;height:550px;width:1055px;margin:0 auto;font-weight:bold;margin-top: 30px;">
       <div style="height:305px;width:1055px;">
       <div style="border:1px solid #CCCCCC;height:300px;width:290px;margin-left:10px;float:left;">
	       <div style="border:1px solid #CCCCCC;height:160px;width:130px;margin:0 auto;margin-top:10px;">
		      <img style="height:158px;width:128px;" src="rescourse/imag/user/${sessionScope.user.imag}">
	       </div>
		   <div style="border:1px solid #CCCCCC;height:110px;width:250px;margin-top:10px;margin-left:auto;margin-right:auto;">
		  <p>考试科目：${examname}<p>
		  <p>考生姓名：${sessionScope.user.name}</p>
		  <p>考生身份证号：${sessionScope.user.idnumber}</p>
		  
		  <div id="CountMsg" class="HotDate"> 
			考试时间:&nbsp;<span id="t_m">00分</span> <span id="t_s">00秒</span> 
		  </div> 
	       </div>
	   </div>
	   <c:forEach items="${problemlist}" var="list" varStatus="status">
	   <c:choose>
	     <c:when test="${status.count==1}">
	    <div id="div${status.count}" style="border:1px solid #CCCCCC;height:300px;width:742px;float:right;display: block">
	    </c:when>
	    <c:otherwise>
	      <div id="div${status.count}" style="border:1px solid #CCCCCC;height:300px;width:742px;float:right;display: none">
	    </c:otherwise>
	    </c:choose>
		<div style="border:1px solid #CCCCCC;height:50px;width:666px;margin-left:10px;margin-top:10px;padding-left: 5px;padding-top: 5px;">
		${status.count}、(${list.type})${list.problem}
		</div>
		<div style="border:1px solid #CCCCCC;height:215px;width:450px;float:left;margin-top:10px;margin-left:10px;padding-left:30px;padding-top: 20px;">
		        <c:if test="${list.type=='判断题'}">
				<input type="radio" name="result" value="A" style="float:left;"><p>A、${list.a}</p>
				<input type="radio" name="result" value="B" style="float:left;"></p>B、${list.b}</p>
				  </c:if>
				  <c:if test="${list.type=='单选题'}">
				<input type="radio" name="result" value="A" style="float:left;"><p>A、${list.a}</p>
				<input type="radio" name="result" value="B" style="float:left;"></p>B、${list.b}</p>
				<input type="radio" name="result" value="C" style="float:left;"><p>C、${list.c}</p>
				<input type="radio" name="result" value="D" style="float:left;"></p>D、${list.d}</p>
				  </c:if>
				  <c:if test="${list.type=='多选题'}">
				<input type="checkbox" name="result" value="A" style="float:left;"><p>A、${list.a}</p>
				<input type="checkbox" name="result" value="B" style="float:left;"></p>B、${list.b}</p>
				<input type="checkbox" name="result" value="C" style="float:left;"><p>C、${list.c}</p>
				<input type="checkbox" name="result" value="D" style="float:left;"></p>D、${list.d}</p>
				  </c:if>
				<button style="margin-left:300px;margin-top:15px;" type="button" class="btn btn-primary" onclick="Next(${status.count},${list.id})">下一题</button>
		</div>
		<div style="border:1px solid #CCCCCC;height:215px;width:250px;float:right;margin-top:10px;margin-right:10px;">
		  <img src="rescourse/imag/user/${list.imag}">
		</div>
	   </div>
	   </c:forEach>
	    <div id="divf" style="border:1px solid #CCCCCC;height:300px;width:742px;float:right;display: none">

				<div class="container" style="width: 700px;margin-top: 35px;margin-left: -5px;">
					<div class="jumbotron">
						<h2 id="sb">您已完成做答，请交卷！！！</h2>
						<p>
							<button class="btn btn-primary btn-lg" onclick="finish()">交卷</button>
						</p>
					</div>
				</div>

	   </div>
	   <div>
	     <table  height="250px;" width="1000px" class="table table-bordered">
	      <c:if test="${examsubject=='科目一'}">
		   <tbody class="table-w"> 
			  <tr>
			    <c:forEach begin="1" end="20" var="i">
			       <td id="${i}">${i}</td>
			    </c:forEach>
				
			  </tr>
			  <tr>
				  <c:forEach begin="21" end="40" var="i">
			       <td id="${i}">${i}</td>
			    </c:forEach>
			  </tr>
			  <tr>
				  <c:forEach begin="41" end="60" var="i">
			       <td id="${i}">${i}</td>
			    </c:forEach>
			  </tr>
			  <tr>
				  <c:forEach begin="61" end="80" var="i">
			       <td id="${i}">${i}</td>
			    </c:forEach>
			  </tr>
			  <tr>
				  <c:forEach begin="81" end="100" var="i">
			       <td id="${i}">${i}</td>
			    </c:forEach>
			  </tr>	
		   </tbody>
		   </c:if>
		   <c:if test="${examsubject=='科目四'}">
		   <tbody class="table-w"> 
			  <tr>
			    <c:forEach begin="1" end="10" var="i">
			       <td id="${i}">${i}</td>
			    </c:forEach>
				
			  </tr>
			  <tr>
				  <c:forEach begin="11" end="20" var="i">
			       <td id="${i}">${i}</td>
			    </c:forEach>
			  </tr>
			  <tr>
				  <c:forEach begin="21" end="30" var="i">
			       <td id="${i}">${i}</td>
			    </c:forEach>
			  </tr>
			  <tr>
				  <c:forEach begin="31" end="40" var="i">
			       <td id="${i}">${i}</td>
			    </c:forEach>
			  </tr>
			  <tr>
				  <c:forEach begin="41" end="50" var="i">
			       <td id="${i}">${i}</td>
			    </c:forEach>
			  </tr>	
		   </tbody>
		   </c:if>
         </table>
		</div>
   </div>
 

   <script>
       
       var f=0;
       var f1=0;
       $(function(){
    	  
    	 //  alert(${problemlist});
    	 if(${problemlist==null}){
    	   $.alert({
    		   title:'Hello',
				columnClass : 'col-md-4 col-md-offset-4',
				content : '题目还未准备好',
				confirmButton : '确定',
				confirm : function() {
					window
							.open("ChangeOver/student.do?flag=4",
									"_self");
				}
    	   });
    	   
    	   }
    	 //  javascript:window.history.forward(1); 
     
       });
       function Next(i,id){
    	   
    	    var result=$("input:checked").val();
    	    if(result==null){
    	    	Alert("答案不能为空！");
    	    	return ;
    	    }
    	    $.post(
    	       "Exam/examjudge.do",		
    	       {"result":result,"pid":id},
    	       function(data){
    	    //	   alert(data);
    	    	    f++;  
    	    	    if(data==1){
    				  $("#"+f).css({"background-color":"#5CB85C","color":"white"});
    					$("#div"+[i+1]).css({"display":"block"});
    	    	    }
    	    	    else if(data==0){
    	    	    	$("#"+f).css({"background-color":"red","color":"white"});
    	    	    	$("#div"+[i+1]).css({"display":"block"});
    	    	    }
    	    	    else{
    	    	    	//对话框
    	    	    	$("#sb").text("您已完成做答，请交卷！！！");
    	    	    	$("#divf").css({"display":"block"});
    	    	    	$("#div"+[i+1]).css({"display":"none"});
    	    	    }
    	    	    if(i==5){
    	    	    	$("#sb").text("您已完成做答，请交卷！！！");
    	    	    	$("#divf").css({"display":"block"});
    	    	    	$("#div"+[i+1]).css({"display":"none"});
    	    	    }
    				$("#div"+i).css({"display":"none"});
    				$("input[name='result']").attr("checked",false);
    	       },
    	       "text"
    	       
    	       
    	    );
		   
		 }
	  function getRTime(t){ 
			var EndTime= new Date(t); //截止时间 
			var NowTime = new Date(); 
			var t =EndTime.getTime() - NowTime.getTime(); 
		    
		
				var m = Math.floor(t / 1000 / 60 % 60);
					var s = Math.floor(t / 1000 % 60);
					if (m == 0 && s == 0) {
						clearTimeout(timeout);
						//对话框
						if(f1!=1)
						   postResult(${eid});
						f1=0;
					}
					document.getElementById("t_m").innerHTML = m + "分";
					document.getElementById("t_s").innerHTML = s + "秒";
				}
				var d = new Date();
				var t = d.getTime() + 360000;
				timeout = setInterval(getRTime, 1000, t);
				function Alert(text) {
					$.alert({
						title : 'Hello',
						columnClass : 'col-md-4 col-md-offset-4',
						content : text,
						confirmButton : '确定',
						animation : 'zoom',
						animationSpeed : 200,
						confirmButtonClass : 'btn-info',
					//  backgroundDismiss:false

					});
				}
				function Confirm(tl, score) {
					
					var subject="${examsubject}";
				    if(subject=="科目四")
				    	score*=2;
					$.confirm({
						title : tl,
						theme : 'supervan',
						content : '考试成绩：' + score,
						confirmButton : false,
						cancelButton : '确定',
						cancel : function() {
							window
									.open("ChangeOver/student.do?flag=4",
											"_self");
						}
					});
				}
				function finish()
				{
					postResult(${eid});
				}
				 function postResult(eid)
				  {
					    f1=1;
						$.post(
			   	    	     "Exam/result.do",
			   	    	     {"eid":eid},
			   	    	     function(data){
			   	    	    	// alert(data);
			   	    	    	if(data<60)
			   	    	    	 Confirm("很遗憾，考试不合格",data);
			   	    	    	else
			   	    	          Confirm("恭喜您，考試合格",data);
			   	    	     },
			   	    	     "text"
			   	    	);
				  }
			</script>
   
</body>
</html>
