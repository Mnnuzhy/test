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
 <link href="rescourse/ueditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="rescourse/ueditor/third-party/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="rescourse/ueditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="rescourse/ueditor/umeditor.min.js"></script>
    <script type="text/javascript" src="rescourse/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>

<body>
	<jsp:include page="../public/head.jsp"></jsp:include>
	<div style="height:750px;width:1055px;margin:0 auto;">
		<jsp:include page="navigation.jsp"></jsp:include>
		<div class="major">
			<div
				style="border-top:2px solid #114EC9;background-color:#F5F5F5;height:46px;line-height:38px;font-size:18px;">
				首页管理</div>
		
			 <div style="height:42px;margin-top: 30px;box-shadow:0 0 2px 2px #ccc">
					<ul class="nak" style="">
					   <li name="nk" style="background-color:white;border-top:2px solid #114EC9">轮播板块</li>
					   <li name="nk">交通安全宣传板块</li>
					   <li name="nk">最新动态模块</li>
					   <li name="nk">其他模块</li>
					</ul>
			 </div>
			 <div>
			 <div class="d1" style="margin-left:20px;margin-top:30px;">
			    <div style="display: inline-block;">
				<div class="thumbnail" style="width:280px;height:200px;">
				  <img style="width:278px;height:190px;" alt="" id="car1">
				</div>
				  <input type="file" id="file1" name="file1">
				  <button style="margin-top: 20px;margin-left: 80px;" onclick="upLoad(1)" type="button" class="btn btn-primary">上传</button>
				</div>
				
				<div style="display: inline-block;">
				<div class="thumbnail" style="width:280px;height:200px;">
				  <img style="width:278px;height:190px;" alt="" id="car2">
				</div>
				  <input type="file" id="file2" name="file2">
				  <button onclick="upLoad(2)" style="margin-top: 20px;margin-left: 80px;" type="button" class="btn btn-primary">上传</button>
				</div>
				
				<div style="display: inline-block;">
				<div class="thumbnail" style="width:280px;height:200px;">
				  <img style="width:278px;height:190px;" alt="" id="car3">
				</div>
				  <input type="file" id="file3" name="file3">
				  <button onclick="upLoad(3)" style="margin-top: 20px;margin-left: 80px;" type="button" class="btn btn-primary">上传</button>
				</div>
			</div>
			<div class="d1" style="margin-left:20px;margin-top:30px;display:none;">
			      <div class="thumbnail" style="width:510px;;height:330px;border-top: 2px solid #114EC9;display: inline-block;">
			       <h3 style="background-color: #F5F5F5;">当期播放视频</h3>
			      <div style="display: inline-block;width: 200px;">
			      <video id="car4" src="s.mp4"  width="500" height="250" controls="controls">
			      </video>
			       </div>
			     </div>
			     
			      <div style="display: inline-block;margin-left: 600px;">
			        <input type="file" name="file4" id="file4"> 
				    <button onclick="upLoad(4)" style="margin-top: 20px;margin-left: 80px;" type="button" class="btn btn-primary">上传</button>
			       </div>
			</div>
			<div class="d1" style="margin-left:20px;margin-top:30px;display:none;">
				  <label style="font-size:15px;">
	           <span>查询类型:</span>
	            <select id="type" style="width:200px;margin-left: 10px;display: inline-block;" class="form-control">
	              <option value="all">全部</option>
		         <option value="title">标题</option>
		         <option value="author">来源</option>
		        
		      </select>
		        <input style="width: 150px;display:inline-block;" type="text" class="form-control" id="title" 
                     placeholder="请输入名称">
             <button style=";margin-left: 10px;" id="search" type="button" class="btn btn-success">查询</button>
             </label>
	
		     <table class="table table-striped" style="margin-top: 30px;border-top:2px solid #114EC9; ">
					<thead>
						<tr>
						    <th>编号</th>
							<th>文章标题</th>
							<th>来源</th>
							<th>发表时间</th>
							<th>删除文章</th>
						</tr>
					</thead>
					<tbody>
					  <c:forEach begin="0" end="4" var="i">
					    <input type="hidden" id="aid${i}">
						<tr id="atr${i}">
						    <td id="abh${i}"></td>
							<td id="atitle${i}"></td>
							<td id="aauthor${i}"></td>
							<td id="adate${i}"></td>
							<td><a href="javascript:void(0)" onclick="deleteArticle('#aid${i}')">删除文章</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div id="tcountdiv"
				style="background-color:#F5F5F5;height:40px;line-height:75px;position:relative;top:10px;line-height:38px;text-align:right;">
				共${rowCount}条数据
			</div>
			<div style="margin-left:300px;margin-top:10px;" id="Pagination">
			</div>
			</div>	
			<div class="d1" style="margin-left:20px;margin-top:30px;display:none;">
			     <div class="thumbnail" style="">
			      <div class="caption">
			      <h3 style="background-color: #F5F5F5;">公告</h3>
			         <div>
		             <script type="text/plain" id="gg" style="width:600px;height:150px;">  </script>
		             </div>
 					<div>
		           <button onclick="changeArt('gg',6)" style="margin-top: 50px;" type="button" class="btn btn-primary">修改</button>		     </div>
                     </div>
			     </div>
			      <div class="thumbnail" style="">
			      <div class="caption">
			      <h3 style="background-color: #F5F5F5;">驾校招生</h3>
			         <div>
		             <script type="text/plain" id="zs" style="width:600px;height:150px;">  </script>
		             </div>
                   <div>
		           <button onclick="changeArt('zs',5)" style="margin-top: 20px;" type="button" class="btn btn-primary">修改</button>		     </div>
                     </div>
			     </div>
			      <div class="thumbnail" style="">
			      <div class="caption">
			      <h3 style="background-color: #F5F5F5;">教练招聘</h3>
			          <div>
		             <script type="text/plain" id="zp" style="width:600px;height:150px;">  </script>
                       </div>
		           <div style="height: 100px;">
		           <button onclick="changeArt('zp',7)" style="margin-top: 20px;" type="button" class="btn btn-primary">修改</button>		     </div>
                     </div>
			     </div>
			  </div>
			     
			</div>
									

		</div>
	</div>

	<jsp:include page="model.jsp"></jsp:include>
	<script>
	 var um = UM.getEditor('gg');
	 var  um1 = UM.getEditor('zs');
	  var um2 = UM.getEditor('zp');
		$(function() {
			$.post(
					   "Manager/Index.do",
					   {},
					   function(data){
						   d=eval("("+data+")");
						  // alert($("#v").text());
						   $("#car4").attr("src","rescourse/imag/ad/"+d.m2);
						   um.setContent(d.m3);
						   um1.setContent(d.m4);
						   um2.setContent(d.m5);
						   $("#car1").attr("src","rescourse/imag/ad/"+d.m1[0]);
						   $("#car2").attr("src","rescourse/imag/ad/"+d.m1[1]);
						   $("#car3").attr("src","rescourse/imag/ad/"+d.m1[2]);
						/*   for(var i=0;i<d.m5.length;i++){
							   $("#arc").append("<div>·<a href=#>"+d.m5[i].content+"</a></div>");
						   }*/
					   },
					   "text"
					);
			
			
			//alert("****");
			
    	  
			pagination(${rowCount});
			pageselectCallback(0);
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

		 function pagination(rowCount)
		    {
		           $("#Pagination").pagination(rowCount, {
	                  callback: pageselectCallback,
	                  items_per_page:5,// Show only one item per page
						prev_text:"上一页",
						next_text:"下一页",
						num_display_entries:2,
						num_edge_entries:3,
		           }); 
		    }
		          

			function pageselectCallback(page_index){	
				var type=$("#type").val();
				var title=$("#title").val();
				//alert(type+title);
				$.post(
				      "Manager/getArtList.do",
						   {"pageNow":page_index,"type":type,"title":title},
						   function(d){
						     // alert(d);
							   for(var i=0;i<5;i++){
								   $("#atr"+i).css("display","none");
							   }
							   //alert(d.length);
							   for(var i=0;i<d.length;i++){
								   $("#atr"+i).css("display","table-row");
								   $("#aid"+i).val(d[i].id);
								   $("#atitle"+i).html("<a href=User/article.do?aid="+d[i].id+" target='view_window'>"+repalceHtml(d[i].title)+"</a>");
								   $("#aauthor"+i).text(d[i].author);
								   $("#adate"+i).text(d[i].date);
								   $("#abh"+i).text(page_index*5+i+1);				   
							   }
						   },
						   "json"
						);
	              return false;
	          }
			$("#search").click(function(){
				
				pageselectCallback(0);
				pagination(${rowCount});
			})
			function upLoad(flag){	
				var flag1=$("#file"+flag).val();
				//alert(flag1);
				if(flag1==null||flag1==""){
					Alert("請選擇！");
					return ;
				}
                 $.ajaxFileUpload({
					url:"Manager/upload"+flag+".do",
					type:"post",
					fileElementId:"file"+flag,
					dataType:"text",
					 success: function (data, status){
						// alert(data);
						if(data!=""){
					    	$("#car"+flag).attr("src","rescourse/imag/ad/"+data);
						}
				    	 $.post(
						    		"Manager/updateAd.do",
						    		{"id":flag,"name":data},
						    		function(data){
						    			Alert("修改成功");
						    		},
						    		"text"
						    	 );
				         },
				});
			}
			function changeArt(obj1,id){
				  var content=UM.getEditor(obj1).getContent();
				  var content1=UM.getEditor(obj1).getContentTxt();
				  if(content1.trim()==null||content1.trim()==""){
					  Alert("请正确输入！");
					  eturn ;
				  }
				  $.post(
					"Manager/updateAd.do",
					{"id":id,"name":content},
					function(data){
					//	alert(data);
						Alert("修改成功！");
						
					},
					"text"
				  );
				  
			}
			function deleteArticle(obj){
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
					       "Manager/deleteArt.do",
					       {"id":$(obj).val()},
					       function(data){
					    	  pagination(data);
							  pageselectCallback(0);
							  $("#tcountdiv").text("共"+data+"条数据");
					    	   Alert("删除成功");
					    	   
					       },
					       "text"
					    );
					}});
			}
			function repalceHtml(t){
				te=t.replace(/({|})/g,''); //过滤{}
				te=te.replace("&nbsp;",''); //过滤{}
				te=te.replace(/</g,'<'); //置换符号<
				te=te.replace(/>/g,'>'); //置换符号>*/
				te=te.replace(/<\/?[^>]*>/g,''); //*<\/?[^>]*>可以匹配<script></style></body>等，并置空。而不是替换<和>两个符号
				return te;
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
