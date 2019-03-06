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
    <!-- 引入日历插件与样式 -->
    <script src="<%=basePath%>/mdate/iScroll.js"></script>
    <script src="<%=basePath%>/mdate/Mdate.js"></script>
    <link rel="stylesheet" href="<%=basePath%>/mdate/needcss/Mdate.css">
</head>
  <style type="text/css">
    html,
    body {
        font-size: 14px;
    }
    
    body {
        background-image: url(bg.png);
        background-size: 100vw 100vh;
        background-attachment: fixed;
        padding: 20px;
    }
    
    .demoBox {
        color: #fff;
        background-color: rgba(0, 0, 0, 0.4);
        border-radius: 5px;
        margin-bottom: 15px;
        padding: 8px 8px 20px;
    }

    .demoBox >p{
        padding-top: 10px;
    }
    
    .demoBox >ol {
        padding-top: 15px;
        border-top: 1px dashed rgba(255, 255, 255, 0.3);
    }
    
    .demoBox >ol>li {
        padding-top: 10px;
        margin-left: 7%;
    }
    
    .demoBox >ol>li>span {
        font-size: 12px;
        color: rgba(255, 255, 255, 0.4);
        display: block;
    }
    
    .demo {
        height: 35px;
        margin: 15px 0;
        display: flex;
        display: -webkit-flex;
        display: -moz-flex;
    }
    
    .demo >input {
        display: block;
        border: 0;
        border-radius: 3px;
        padding: 0 8px;
        height: 100%;
        flex: 1;
        -webkit-flex: 1;
        -moz-flex: 1;
        font-size: 14px;
    }
    
    .demo >button {
        background-color: #00c599;
        color: #fff;
        border: 0;
        height: 100%;
        margin-left: 8px;
        padding: 0 15px;
        border-radius: 3px;
        font-size: 14px;
    }
    </style>
  <body>
  ${args }
  
  
  <form action="<%=basePath%>/hello/date.do" method="post">
         <div class="demoBox">
        <p>案例1：默认项</p>
        <div class="demo">
            <input type="text" readonly="readonly" name="dateSelectorOne" id="dateSelectorOne" placeholder="选择日期">
        </div>
    </div>
    <div class="demoBox">
        <p>案例2：自定义项</p>
        <div class="demo">
            <input type="text" name="dateSelectorTwo" id="dateSelectorTwo" placeholder="请填写：xxxx-xx-xx">
            <button type="button" id="dateShowBtn">选择日期</button>
        </div>
    </div>
    11111111
  <button type="submit" value="提交">提交</button>
    
     </form>
  </body>
</html>
<script type="text/javascript">
new Mdate("dateSelectorOne",{
	
});

new Mdate("dateShowBtn", {
    acceptId: "dateSelectorTwo",
    beginYear: "2018",
    beginMonth: "1",
    beginDay: "1",
    endYear: "2027",
    endMonth: "1",
    endDay: "1",
    format: "-"  
})
</script>