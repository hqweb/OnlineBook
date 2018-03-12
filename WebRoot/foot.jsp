<%@ page language="java" import="java.util.*,com.sp.model.*,java.text.*,java.io.*,javax.servlet.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'foot.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <%ArrayList<BookBean> ListBook=(ArrayList<BookBean>)request.getAttribute("ListBook");
  Integer PageCount = (Integer)request.getAttribute("PageCount");
  %>
  
  <body>
    <div class="foot">
	    <%
			for(int i=0;i<ListBook.size();i++)
			{
				BookBean bb=(BookBean)ListBook.get(i);
		%>
			<%-- <div class="book1">
				书名:<span class="bookNa"><%=bb.getName()%></span></br></br>
				作者:<span class="bookAur"><%=bb.getAuthor()%></span></br></br>
				简介:<span class="bookSy"><%=bb.getSynopsis()%></span></br></br>
				价格:<span class="bookPr"><%=bb.getPrice()%></span></br>
			</div> --%>
				<div class="book1">
					<div>
						<img src="img/<%=bb.getCover()%>" width="190" height="186" alt="" class="imgBook"/>
					</div>
					<div class="text">
						<ul>
							<li>书名:<span class="bookNa"><%=bb.getName()%></span></li>
							<li>作者:<span class="bookAur"><%=bb.getAuthor()%></span></li>
							<li>简介:<span class=""></span></li>
							<li>库存:<span class="bookSk"><%=bb.getStock()%></span></li>
							<li>销售额:<span class="bookSe"><%=bb.getSalesvolume()%></span></li><br>
							<li>价格:<span class="bookPr"><%=bb.getPrice()%></span></li>
							<li>
								<td width="104">
									<a href="javascript:void(0);" class="buyBook" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;购买</a>
									 
								</td>
								
								<input class="buyNum" value="1"></input>
							</li>
						</ul>
					</div>
				</div>
				
		<%
			}
		 %>
		
		 <div  class="pageS">
			 <button id="upPage" >上一页</button><button id="doPage"  >下一页</button>
		 </div>
		 
	</div>
	
	<div id="PageCount" style="display:none;"><%=PageCount%></div>
	
    <div id="racePop" class="raceShow">
        <div class="div" style="width: 100%; height: 100%; overflow-y: auto;">
        	<body>
		<table align="center" border="1" class="cart" cellspacing="1"cellpadding="4" width="770">
			<tr class="cover">
				<td colspan="6">订单明细表</td>
			</tr>
			<tr class="tdbag">
					<td class="11">图书名</td>
					<td class="11">数量</td>
					<td class="11">单价</td>
					<td class="11">下单日期</td>
			</tr>
			<tr class="tdbg">
				<td><span id="orBname"></span></td>
				<td>&nbsp;<span id="orBnum"></span></td>
				<td><span id="orBpr"></span></td>
				<td>
	   <%
   Date dNow = new Date( );
   SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
   out.print( ft.format(dNow));
%>
     			</td>
			</tr>
			<tr>
				<td colspan="5" align="center" class="total">总额：<span id="orBall">30</span></td>
			</tr>
			
		</table>
	        <table border="1" align="center"  class="order" width="770">
				<tr>
						<td height="35" colspan="2" align="center">
							<strong><font color="brown">收货人信息</font></strong>
						</td>
				</tr>
				<tr>
					<td class="011">用户名：</td>
					<td class="012"><input type="text" name="username" size="15" maxlength="25" value=""></td>
				</tr>
				<tr>
					<td class="011">联系电话：</td>
					<td class="012"><input type="text" name="tel" size="15" maxlength="64"><span>*</span></td>
				</tr>
				<tr>
					<td class="011">收货地址：</td>
					<td class="012"><input type="text" name="address" size="40" maxlength="128"><span>*</span></td>
				</tr>
				<tr>
					<td class="011">邮编：</td>
					<td class="012"><input type="text" name="postcode" size="15" maxlength="25"><span>*</span></td>
				</tr>
				<tr>
					<td class="011">付款方式：</td>
					<td class="012"><select name="payment" ><option value="1">网上支付</option><option value="2">货到付款</option></select><span>*</span></td>
				</tr>
				<tr>
					<td class="011">备注：</td>
					<td class="012"><textarea name="userremark" cols="70" row="10"></textarea><span>*<span></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" id="confirm" value="提交订单"><input type="button" value="返回订单"></td>
				</tr>
			</table>
        </div>
    </div>
	
  </body>
</html>
