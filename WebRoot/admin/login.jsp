
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
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
	String err=request.getParameter("err");
	if(err!=null)
	{
		if(err.equals("1"))
		{
			out.println("<h1>用户没有正常登录，请登录！</h1>");
		}
	}
 %>

    <hr>
    用户登录 <br>
    <form action="LoginAdmin" method="post">
    用户名：<input type="text" name="username"><br>
    密 码： <input type="password" name="passname"><br>
    <input type="submit" value="登录">
    <input type="reset" value="重置">
    </form>
    <hr>
    
    </center>
    <img  src="img/logo.png" />
  </body>

</html>