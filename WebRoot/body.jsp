<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'body.jsp' starting page</title>
    
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
    <div class="body">
			<div class="book">
				 <td width="104"><img src="img/1.png" alt="1" width="14" height="16"> &nbsp;<a href="jianjie.html">&nbsp;图书类别</a></td>
				 <br>
				  <td width="104"><img src="img/1.png" alt="1" width="14" height="16"> &nbsp;<a href="jianjie.html">&nbsp;玄幻</a></td>&nbsp;&nbsp;&nbsp;&nbsp;
				  <td width="104"><img src="img/1.png" alt="1" width="14" height="16"> &nbsp;<a href="jianjie.html">&nbsp;修真</a></td>&nbsp;&nbsp;&nbsp;&nbsp;
				  <td width="104"><img src="img/1.png" alt="1" width="14" height="16"> &nbsp;<a href="jianjie.html">&nbsp;悬疑</a></td>
				  <br>
				  <br>
				  <td width="104"><img src="img/1.png" alt="1" width="14" height="16"> &nbsp;<a href="jianjie.html">&nbsp;玄幻</a></td>&nbsp;&nbsp;&nbsp;&nbsp;
				  <td width="104"><img src="img/1.png" alt="1" width="14" height="16"> &nbsp;<a href="jianjie.html">&nbsp;修真</a></td>&nbsp;&nbsp;&nbsp;&nbsp;
				  <td width="104"><img src="img/1.png" alt="1" width="14" height="16"> &nbsp;<a href="jianjie.html">&nbsp;悬疑</a></td>
				  <br>
				  <br>
				  <td width="104"><img src="img/1.png" alt="1" width="14" height="16"> &nbsp;<a href="jianjie.html">&nbsp;玄幻</a></td>&nbsp;&nbsp;&nbsp;&nbsp;
				  <td width="104"><img src="img/1.png" alt="1" width="14" height="16"> &nbsp;<a href="jianjie.html">&nbsp;修真</a></td>&nbsp;&nbsp;&nbsp;&nbsp;
				  <td width="104"><img src="img/1.png" alt="1" width="14" height="16"> &nbsp;<a href="jianjie.html">&nbsp;悬疑</a></td><br>
				  <td width="104"><img src="img/1.png" alt="1" width="14" height="16"> &nbsp;<a href="jianjie.html">&nbsp;购书须知</a></td><br>
				  <td width="104"><img src="img/1.png" alt="1" width="14" height="16"> &nbsp;<a href="jianjie.html">&nbsp;热门书籍</a></td><br>
				  <td width="104"><img src="img/1.png" alt="1" width="14" height="16"> &nbsp;<a href="jianjie.html">&nbsp;简要新闻</a></td><br>
			</div>
			
			<div class="image-group">
				<div id="butong_net_right" style="overflow:hidden;width:;height: 360px;">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td id="butong_net_right1" valign="top" align="center">
								<table cellpadding="2" cellspacing="0" border="0">
									<tr align="center">
										<td><img src="img/2.jpg" height="360px"></td>
										<td><img src="img/3.jpg" height="360px"></td>
										<td><img src="img/4.jpg" height="360px"></td>
										<td><img src="img/5.jpg" height="360px"></td>
										<td><img src="img/1.png" height="360px"></td>
									</tr>
								</table>
							</td>
							<td id="butong_net_right2" valign="top"></td>
						</tr>
					</table>
				</div>
			</div>
			
			
			<jsp:include page="user.jsp" flush="true"/>
		</div>
  </body>
</html>
