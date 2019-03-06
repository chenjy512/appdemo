<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

    <title>滑动到底部加载下一页内容</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<script src="<%=basePath%>/bootstrap/jquery-1.3.2.min.js"></script>
	<script src="<%=basePath%>/bootstrap/zepto.min.js"></script>
	<link rel="stylesheet" href="<%=basePath%>/bootstrap/bootstrap.min.css">  
	<script src="<%=basePath%>/bootstrap/bootstrap.min.js"></script>
<style type="text/css">


</style>
  </head>
  <body>
	<input type="hidden" name="preNo" id="preNo" value="10" />
	<input type="hidden" name="pageNo" id="pageNo" value="10" />
	<input type="hidden" name="type" id="type" value="1" />
    
    <div class="white" >
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
		<div id='load'></div>
	</div>


  </body>
</html>
<script>
$(function(){
	query('01',1);//第一次加载
});

/**
 * type:判断是否首次加载
   status：判断上滑下滑
 */
function query(type,status)
{

    var num;
    if(status == 1){
        num = $("#pageNo").val();  //下滑吗
        }else{          
        num = $("#preNo").val();   //上滑吗
            }
	
	$.ajax({
		type: "post",   
		url : "<%=path%>/hello/query.do",
		data : {
		    pageNo : num,
		    type : 1//滑动类型
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
			    if(status == 1){
			    	$("#pageNo").val(parseInt($("#pageNo").val())-1);	
			    }else{
			    	$("#preNo").val(parseInt($("#preNo").val())+1);	
				    }
				
			}else
				{		
				var content="";
				//判断是否是初次加载数据
				if(type=="00")
				{
			
					if(data.length==0)
					{
					    if(status == 1){
					    	$("#pageNo").val(parseInt($("#pageNo").val())-1);	
					    }else{
					    	$("#preNo").val(parseInt($("#preNo").val())+1);	
						    }	
						 return "";
					}
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
				  		+   '<td><a href=<%=path%>/hello/showinfo.do?id='+data[i].id+'>'+data[i].time+'</a></td>'
				 		+	'<td>'+data[i].amount+'</td>'
				  		+	'</tr>';
					}


				    if(status == 1){
				    	$("#wrapper").append(content); //下滑追加
				    }else{ 
				    	$("#wrapper").prepend(content);//上滑追顶
					    }
			 		
			 	//	
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
					  		+   '<td><a href=<%=path%>/hello/showinfo.do?id='+data[i].id+'>'+data[i].time+'</a></td>'
					 		+	'<td>'+data[i].amount+'</td>'
					  		+	'</tr>';
					}
			 		$("#wrapper").html(content);
				}
			}
		},
		error : function(){
			loading=true;
			//$("#pageNo").val(parseInt($("#pageNo").val())-1);	

		    if(status == 1){
		    	$("#pageNo").val(parseInt($("#pageNo").val())-1);	
		    }else{
		    	$("#preNo").val(parseInt($("#preNo").val())+1);	
			    }	
			alert("查询数据出错啦，请刷新再试");
		}
	});
}


//监测是否滑到底部--到底部则加载数据
Zepto(function($){

 $(window).scroll(function(){
	 
 if(($(window).scrollTop()+$(window).height() > $(document).height()-10)){
	 
	    $("#pageNo").val(parseInt($("#pageNo").val())+1);
	 	query("00");//数据加载
       }
 
    });
 });


//上滑，下滑的一个测试版，有点问题
/** Zepto(function($){
	 
	 $(window).scroll(function(){


		 //$(window).scrollTop()：窗口滑动高度
		 //$(window).height()：窗口高度
		 //$(document).height()：文档高度
		 
	 if($(window).scrollTop() == 0){
		 if($("#preNo").val() < 1){
			 alert('已经到达首页'+$("#preNo").val())
			 return ;
			 }
					//	alert('已经到达顶部了~~~');
						//
			$("#preNo").val(parseInt($("#preNo").val())-1);
			query("00",2);//数据加载
		 }	 
	 if(($(window).scrollTop()+$(window).height() > $(document).height()-10)){
		 
		    $("#pageNo").val(parseInt($("#pageNo").val())+1);
		 	query("00",1);//数据加载
	       }
     
	    });
	 });
**/


 //监测是否滑到底部 --ios下的ifame中使用此监测时间
/**function change() {
	
    //var y = document.scrollingElement.scrollTop
    // or
    // var y = window.pageYOffset
    //var ratio = Math.min(0.8, y / 100)
    //topnode.style.opacity = ratio

	 if(($(window).scrollTop()+$(window).height() > $(document).height()-10)){
		// alert(111);
		    $("#pageNo").val(parseInt($("#pageNo").val())+1);
		 	query("00");//数据加载
	       }

}
document.addEventListener('touchmove', change);
*/


</script>
