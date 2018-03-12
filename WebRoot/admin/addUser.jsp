
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="#CED3FE">
      <img  src="img/th.png"/>
<center>

    <hr>
   <h1>请输入用户信息</h1>
   <form action="UserAdmin?flag=addUser" method="post">
   <table border="1">
   <tr><td bgcolor="pink">用户名</td><td><input type="text" name="userName"/></td></tr>
   <tr><td bgcolor="silver">密码</td><td><input type="password" name="passwd"/></td></tr>
   <tr><td bgcolor="pink">电子邮件</td><td><input type="text" name="email"/></td></tr>
   
   <tr><td bgcolor="silver">地址</td><td><input type="text" name="address"/></td></tr>
   <tr><td bgcolor="pink">电话</td><td><input type="text" name="phone"/></td></tr>
   <tr><td bgcolor="silver">余额</td><td><input type="text" name="balance"/></td></tr>
   
  <tr><td><input type="submit" value="添加用户"></td><td><input type="reset" value="重置"></td></tr>
   </table>
   </form>
    <hr>
    
    </center>
    <img  src="img/logo.png" />
  </body>
</html>