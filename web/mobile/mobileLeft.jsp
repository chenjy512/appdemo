<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="<%=basePath%>/bootstrap/jquery-1.3.2.min.js"></script>
<link rel="stylesheet" href="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

    <title>滑动到底部加载下一页内容</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">


	<script src="<%=basePath%>/bootstrap/zepto.min.js"></script>
	<link rel="stylesheet" href="<%=basePath%>/bootstrap/bootstrap.min.css">  
	<script src="<%=basePath%>/bootstrap/bootstrap.min.js"></script>
  </head>
  <body>
  
  <div data-role="page" id="pageone">
  <div data-role="header">
    <h1>swipeleft 事件</h1>
  </div>

  <div data-role="main" class="ui-content">
    <p style="border:1px solid black;margin:5px;">向左滑动 - 不要超出边框！</p>
  </div>

  <div data-role="footer">
    <h1>页脚文本</h1>
  </div>
</div> 

	<input type="hidden" name="pageNo" id="pageNo" value="1" />

    <div class="white" id="pageone1">
		 <table class="table table-hover">
			    <thead><!-- 表头 -->
			        <tr>
			            <th>序号</th>
			            <th>主题</th>
			            <th>编号</th>
			        </tr>
    			</thead>
    			 <tbody id="wrapper">
    			 
    			 </tbody>
		</table>

	</div>


  </body>
</html>
<script>

$(document).on("pagecreate","#pageone",function(){
	  $("#pageone").on("swipeleft",function(){
	    alert("您向左滑动!");
	  });                       
	});

$(function(){
	query('01');//第一次加载
});

function query(type)
{
	//alert(type);
	$.ajax({
		type: "post",   
		url : "<%=path%>/hello/query.do",
		data : {
		    pageNo : $("#pageNo").val(),
		    type : 2
		},
		async: true,
        dataType:'json',
        beforeSend:function(XMLHttpRequest){ 
					//$("#load").html("<img src='bootstrap/loading.gif' />");
			},
		success : function(data) {
				//$("#load").html(); 
			//alert("第几次请求:"+$("#pageNo").val());
			loading=true;
			//加载数据是否有误
			if(data==null)
			{
				$("#pageNo").val(parseInt($("#pageNo").val())-1);	

			}else{		
				var content="";
				//判断是否是初次加载数据
				if(type=="00"){
			
					if(data.length==0){
						 $("#pageNo").val(parseInt($("#pageNo").val())-1);	
						 return "";
					}
					
					for(var i=0;i<data.length;i++){

					 var color;
					 if(i % 3==0){
						color='active';
						 }else if(i % 13==0){
							 color='success';
							 }else if(i % 5==0){
							 color='warning';
							 }else{
								 color = 'danger';
								 }
					  content=content
					  	+	'<tr class='+color+'>'
				  		+	'<td>'+data[i].id+'</td>'
				  		+   '<td>'+data[i].time+'</td>'
				 		+	'<td>'+data[i].amount+'</td>'
				  		+	'</tr>';
					}
			
			 		$("#wrapper").append(content);
				}else{

					//初次加载数据
					for(var i=0;i<data.length;i++)
					{
						
						var color;
						 if(i % 3==0){
							color='active';
							 }else if(i % 13==0){
								 color='success';
								 }else if(i % 5==0){
								 color='warning';
								 }else{
									 color = 'danger';
									 }
						  content=content
						  	+	'<tr class='+color+'>'
					  		+	'<td>'+data[i].id+'</td>'
					  		+   '<td>'+data[i].time+'</td>'
					 		+	'<td>'+data[i].amount+'</td>'
					  		+	'</tr>';
					}
			 		$("#wrapper").html(content);
				}
			}
		},
		error : function(){
			loading=true;
			$("#pageNo").val(parseInt($("#pageNo").val())-1);	
			alert("查询数据出错啦，请刷新再试");
		}
	});
}


//监测是否滑到底部

 
	/** var ua = navigator.userAgent.toLowerCase();	
	 if (/android/.test(ua)) {
		$('.date>div>img:last').css({"margin-left":"-25px"});
	 }*/
</script>