
<%@ page language="java" import="java.util.*,com.sp.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateUser.jsp' starting page</title>
    
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

	<%
		String str = new String(request.getParameter("address").getBytes("iso-8859-1"), "utf-8"); 
		String name = new String(request.getParameter("userName").getBytes("iso-8859-1"), "utf-8"); 
	%>
    <hr>
   <h1>请输入用户信息</h1>
   <form action="UserAdmin?flag=updateUser" method="post">
   <table border="1">
   <tr><td bgcolor="pink">用户ID</td><td><input type="text" readonly="readonly" name="userId" value="<%=request.getParameter("userId")%> "/></td></tr>
   <tr><td bgcolor="pink">用户名</td><td><input type="text" name="userName" value="<%=name%>"/></td></tr>
   <tr><td bgcolor="silver">密码</td><td><input type="password" name="passwd" value="<%=request.getParameter("passwd") %>"/></td></tr>
   <tr><td bgcolor="pink">电子邮件</td><td><input type="text" name="email" value="<%=request.getParameter("email") %>"/></td></tr>
   
   <tr><td bgcolor="pink">地址</td><td><input type="text" name="address" value="<%=str%>"/></td></tr>
   <tr><td bgcolor="pink">电话</td><td><input type="text" name="phone" value="<%=request.getParameter("phone") %>"/></td></tr>
   <tr><td bgcolor="pink">余额</td><td><input type="text" name="balance" value="<%=request.getParameter("balance") %>"/></td></tr>
   
  <tr><td><input type="submit" value="修改用户"></td><td><input type="reset" value="重置"></td></tr>
   </table>
   </form>
    <hr>
    
    </center>
    <img  src="img/logo.png" />
  </body>
</html>