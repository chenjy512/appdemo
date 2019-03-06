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
<link rel="stylesheet" href="<%=basePath%>/bootstrap/jquery.mobile-1.4.5.min.css">

<%--注意jquery版本不宜过高--%>
<script src="<%=basePath%>/bootstrap/jquery.min.js"></script>
	
<script src="<%=basePath%>/bootstrap/jquery.mobile-1.4.5.min.js"></script>
    <script src="<%=basePath%>/mdate/iScroll.js"></script>
    <script src="<%=basePath%>/mdate/Mdate.js"></script>
    <link rel="stylesheet" href="<%=basePath%>/mdate/needcss/Mdate.css">

  </head>
  <body>
  
  
  
  
  
  
  
  
<input type="hidden" name="pageNo" id="pageNo" value="0" />



   <!-- data-role="page":左右滑动特效容器必须的属性 -->
    <div class="white" id="pageone" data-role="page">
    <input type="text" readonly="readonly" id="dateSelectorOne" placeholder="选择日期">
    
    <div id="mydiv" style="width:100px; height:100px; background:#ddd;">out</div>  
    
		 <table class="table table-hover">
			    <thead><!-- 表头 -->
			        <tr>
			            <th><p>序号</p></th>
			            <th><p>主题</p></th>
			            <th><p>编号</p></th>
			        </tr>
    			</thead>
    			 <tbody id="wrapper">
    			 
    			 </tbody>
		</table>

	</div>
  </body>
</html>
<script>

//日期控件引用
new Mdate("dateSelectorOne",{
	
});



$("tr").on({
    touchstart: function(e) {   
        // 长按事件触发    
        timeOutEvent = setTimeout(function() {    
            timeOutEvent = 0;
            var obj = $(this);    
            obj.innerHTML="";
            alert('你长按了');    
        }, 1000);    
        //长按400毫秒     
        // e.preventDefault();      
    }, 
    /**滑动监控事件
    touchmove: function() {    
        clearTimeout(timeOutEvent);    
        timeOutEvent = 0;    
        alert(1111);
    },    */
    touchend: function() {    
        clearTimeout(timeOutEvent);    
        if (timeOutEvent != 0) {    
            // 点击事件    
             //location.href = 'www.baidu.com';    
          //  alert('你点击了');    
        }    
        return false;    
    }    
});



//--------------

//------------------
//左滑
$(document).on("pagecreate","#pageone",function(){
	  $("#pageone").on("swipeleft",function(){
		  $("#pageNo").val(parseInt($("#pageNo").val())+1);
		 	query("00");//数据加载
	  });                       
	});
//右滑
$(document).on("pagecreate","#pageone",function(){
	  $("#pageone").on("swiperight",function(){
		  $("#pageNo").val(parseInt($("#pageNo").val())-1);
		 	query("00");//数据加载
	   // alert("向右滑动!");
	  });                       
	});
//长按
$(document).on("pagecreate","#pageone",function(){
	  $("p").on("taphold",function(){
	//    $(this).hide();
			//alert('长按1111');
	  });                       
	});

//下滑分页获取数据
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
			
			 		//$("#wrapper").append(content);
					$("#wrapper").html(content);
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