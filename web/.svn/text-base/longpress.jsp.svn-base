<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'longpress.jsp' starting page</title>
    
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
    This is my JSP page. <br>
<div style="width:100%;">  
	<div style="width:100%; height:100px; background-color:#CCC;" 
	ontouchstart="gtouchstart()" ontouchmove="gtouchmove()" ontouchend="gtouchend()">长按我
	</div>   
	
	<div style="width:100%;margin-top: 50px" class='tb'>
	         <table style="width:100%;" border='1'>
	               <tr style="width:100%;height: 80px" ontouchstart="gtouchstart(0)" ontouchmove="gtouchmove()" ontouchend="gtouchend()">
	                      <th style="width:10%;">序号</th>
	                      <th style="width:40%;">主题</th>
	                      <th style="width:25%;">编号</th>
	                      <th style="width:25%;">时间</th>
	               </tr>
	               <tr style="width:100%;height: 80px" ontouchstart="gtouchstart(1)" ontouchmove="gtouchmove()" ontouchend="gtouchend()">
	                      <td>1</td>
	                      <td>孩子小升初无法入学问题</td>
	                      <td>20170503056</td>
	                      <td>2017-05-03</td>
	               </tr>
	               <tr style="width:100%;height: 80px" ontouchstart="gtouchstart(2)" ontouchmove="gtouchmove()" ontouchend="gtouchend()">
	                      <td>2</td>
	                      <td>孩子小升初无法入学问题2</td>
	                      <td>20120503056</td>
	                      <td>2012-05-03</td>
	               </tr>
	               <tr style="width:100%;height: 80px" ontouchstart="gtouchstart(3)" ontouchmove="gtouchmove()" ontouchend="gtouchend()">
	                      <td>3</td>
	                      <td>孩子小升初无法入学问题3</td>
	                      <td>20130503056</td>
	                      <td>2013-05-03</td>
	               </tr>
	         </table>
	</div>
</div>  
    
  </body>
</html>
<script>

var timeOutEvent=0;//定时器   
//开始按   
function gtouchstart(id){   
    timeOutEvent = setTimeout("longPress("+id+")",593);//这里设置定时器，定义长按500毫秒触发长按事件，时间可以自己改，个人感觉500毫秒非常合适   
	
    return false;   
};   
//手释放，如果在500毫秒内就释放，则取消长按事件，此时可以执行onclick应该执行的事件   
function gtouchend(){

    clearTimeout(timeOutEvent);//清除定时器   
    if(timeOutEvent!=0){   
        //这里写要执行的内容（尤如onclick事件）   
        alert("你这是点击，不是长按");   
    }
    return false;   
};   
//如果手指有移动，则取消所有事件，此时说明用户只是要移动而不是长按   
function gtouchmove(){   
    clearTimeout(timeOutEvent);//清除定时器   
    timeOutEvent = 0;   
      
};   
   
//真正长按后应该执行的内容   
function longPress(id){   
    timeOutEvent = 0;   
    //执行长按要执行的内容，如弹出菜单   
    alert("长按事件触发发:"+id);   
}   

</script>
