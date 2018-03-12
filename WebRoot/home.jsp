<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <script charset="utf-8" type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <script charset="utf-8" type="text/javascript" src="js/user.js"></script>
    <script charset="utf-8" type="text/javascript" src="js/foot.js"></script>
    <script charset="utf-8" type="text/javascript" src="js/jquery.json.min.js"></script>
    <script charset="utf-8" type="text/javascript" src="js/body.js"></script>
    <link href="css/homebook.css" rel="stylesheet" type="text/css"/>
    <link href="css/reveal.css" rel="stylesheet" type="text/css"/>
    
    <title>My JSP 'home.jsp' starting page</title>
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
  	 <jsp:include page="head.jsp" flush="true"/>
  	 <jsp:include page="body.jsp" flush="true"/>
  	 <jsp:include page="foot.jsp" flush="true"/>
  </body>
</html>
