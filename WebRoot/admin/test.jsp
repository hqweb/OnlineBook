<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.2.1.js"></script>
<script language="JavaScript" src="js/test.js"></script>
<link rel="stylesheet" type="text/css" href="css/test.css" media="screen" />
</head>
<body>
<p>如果您点击我，我会消失。</p>
<p>点击我，我会消失。</p>
<p>也要点击我哦。</p>
</body>
</html>
