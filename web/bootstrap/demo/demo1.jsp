<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'demo1.jsp' starting page</title>
    <!-- 保证触屏缩放 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  <link rel="stylesheet" href="<%=basePath%>/bootstrap/bootstrap.min.css">  
	<script src="<%=basePath%>/bootstrap/jquery-1.3.2.min.js"></script>
	<script src="<%=basePath%>/bootstrap/bootstrap.min.js"></script>
  </head>
  
  <body>
    <table class="table table-hover">
   
    <thead>
        <tr>
            <th>序号</th>
            <th>主题</th>
            <th>编号</th>
        </tr>
    </thead>
    
    <tbody>
        <tr class="active">
            <td>1</td>
            <td>反映八家嘉苑低保费及残疾人补助费尚未发放的问题</td>
            <td>13359071335907</td>
        </tr>
        <tr class="success">
            <td>2</td>
            <td>10/11/2013</td>
            <td>发货中</td>
        </tr>
        <tr  class="warning">
            <td>3</td>
            <td>20/10/2013</td>
            <td>待确认</td>
        </tr>
        <tr  class="danger">
            <td>4</td>
            <td>20/10/2013</td>
            <td>已退货</td>
        </tr>
          <tr  class="danger">
            <td>4</td>
            <td>20/10/2013</td>
            <td>已退货</td>
        </tr>
          <tr  class="danger">
            <td>5</td>
            <td>20/10/2013</td>
            <td>已退货</td>
        </tr>
          <tr  class="danger">
            <td>6</td>
            <td>20/10/2013</td>
            <td>已退货</td>
        </tr>
          <tr  class="danger">
            <td>7</td>
            <td>20/10/2013</td>
            <td>已退货</td>
        </tr>
          <tr  class="danger">
            <td>8</td>
            <td>20/10/2013</td>
            <td>已退货</td>
        </tr>
          <tr  class="success">
            <td>9</td>
            <td>20/10/2013</td>
            <td>已退货</td>
        </tr>
             <tr  class="info">
            <td>10</td>
            <td>20/10/2013</td>
            <td>已退货</td>
        </tr>
             <tr  class="danger">
            <td>11</td>
            <td>20/10/2013</td>
            <td>已退货</td>
        </tr>
                  <tr  class="success">
            <td>12</td>
            <td>20/10/2013</td>
            <td>已退货</td>
        </tr>
             <tr  class="info">
            <td>13</td>
            <td>20/10/2013</td>
            <td>已退货</td>
        </tr>
             <tr  class="danger">
            <td>14</td>
            <td>20/10/2013</td>
            <td>已退货</td>
        </tr>
    </tbody>
</table>
  </body>
</html>
