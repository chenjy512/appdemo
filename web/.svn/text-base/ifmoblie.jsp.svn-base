<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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

  </body>
</html>

<script type="text/javascript">

//https://zhidao.baidu.com/question/433798340214196964.html

　　var browser = {
　　versions : function() {
　　var u = navigator.userAgent, app = navigator.appVersion;
　　return {//移动终端浏览器版本信息
　　trident : u.indexOf('Trident') > -1, //IE内核
　　presto : u.indexOf('Presto') > -1, //opera内核
　　webKit : u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
　　gecko : u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
　　mobile : !!u.match(/AppleWebKit.*Mobile.*/)
　　|| !!u.match(/AppleWebKit/), //是否为移动终端
　　ios : !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
　　android : u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
　　iPhone : u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器
　　iPad: u.indexOf('iPad') > -1, //是否iPad
　　webApp : u.indexOf('Safari') == -1,
　　//是否web应该程序，没有头部与底部
　　google:u.indexOf('Chrome')>-1
　　};
　　}(),
　　language : (navigator.browserLanguage || navigator.language).toLowerCase()
　　}
　　//document.writeln("语言版本: "+browser.language);


　　//平台、设备和操作系统
　　var system = {
　　win: false,
　　mac: false,
　　xll: false,
　　ipad:false
　　};
　　//检测平台
　　var p = navigator.platform;
　　system.win = p.indexOf("Win") == 0;
　　system.mac = p.indexOf("Mac") == 0;
　　system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);
　　system.ipad = (navigator.userAgent.match(/iPad/i) != null)?true:false;
　　//跳转语句，如果是手机访问就自动跳转到" "里的页面
　　if (system.win || system.mac || system.xll||system.ipad) {
　　   alert(111);
 　　document.writeln(" 当前访问终端为pc端: "+browser.versions.mobile);
　　} else {
	document.writeln(" 当前访问终端为手机端: "+browser.versions.mobile);
　　alert(222);
　　//window.location.href = "<%=path%>/hello/query.do";
　　}
　　
　　</script>