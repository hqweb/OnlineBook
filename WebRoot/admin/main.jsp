
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
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
   <h1>请选择操作</h1>
   <a href="UserAdmin?pageNow=1&&flag=cutpage">管理用户</a><br>
   <a href="admin/addUser.jsp">添加用户</a><br>
   <a href="">查找用户</a><br>
   <a href="">注销用户</a><br>
    <a href="">管理书籍</a><br>
    <hr>
    
    </center>
    <img  src="img/logo.png" />
  </body>
</html>