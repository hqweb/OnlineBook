<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user.jsp' starting page</title>
    
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
	<div class="login" id="users">
		<div id="user">
			<ul>
				<li>&nbsp;&nbsp;<i class="fa fa-user-o"></i>用户名：<input type="text" id="username" size=15 placeholder="请输入用户名"></li>
				<li>&nbsp;&nbsp;<i class="fa fa-spinner"></i>密码：&nbsp;&nbsp;&nbsp;<input type="password" id="passname" maxlength="8" size="15" placeholder="请输入密码" ></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn1" id="login">登录</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="register">注册</button>
				</li>	
			</ul>
		</div>
		<div id="usersucc" style="display:none;" align="center">
			   <p>欢迎<span id="namesucc"></span>登陆成功</p>
			   <p>余额：<span id="balance">500</span></p>
		</div>	
	</div>
  </body>
</html>
