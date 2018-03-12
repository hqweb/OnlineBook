<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<script charset="utf-8" type="text/javascript" src="js/jquery-3.2.1.js"></script>
 	    <script charset="utf-8" type="text/javascript" src="js/register.js"></script>
		<title></title>
		<link href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<style type="text/css">
			*{
				margin: 0;
				padding: 0;
			}
			ul{
				list-style: none;
			}
			body{
						background-color:transparent;
						background: url(../img/register.jpg);
						background-attachment: fixed;/*固定图片*/
				        background-repeat: no-repeat;/*图片不重复*/
				        background-size: cover;/*覆盖页面大小*/
				        background-position:center center ;/*图片居中*/
					}
			.sign{
				  height: 980px;
				  border-radius: 1.4em;
				  background-color: rgba(256, 256, 256, 0.8);
				  box-shadow: 0 0 10px 5px #aaa;
			}
					
			input{
                border: 1px solid #ccc;
                padding: 7px 0px;
                border-radius: 3px;
                padding-left:5px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
            }
            /*焦点事件*/
            input:focus{
                    border-color: #66afe9;
                    outline: 0;
                    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
                    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
            }
            
            		.li4 > div{
			float: left;
		}
		
		/*单选按钮的设置*/
		.radiono{
			margin-left: 150px;
		}
		.radiono >div {
            position: relative;
            line-height: 30px;
            float: left;
            margin-left: 30px;
        }
        
        input[type="radio"] {
            width: 20px;
            height: 20px;
            opacity: 0;
        }
        label {
            position: absolute;
            left: 5px;
            top: 3px;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            border: 1px solid #999;
        }
        
        input:checked+label { 
            background-color: #fe6d32;
            border: 1px solid #fe6d32;
        }
        
        input:checked+label::after {
            position: absolute;
            content: "";
            width: 5px;
            height: 10px;
            top: 3px;
            left: 6px;
            border: 2px solid #fff;
            border-top: none;
            border-left: none;
            transform: rotate(45deg)
        }
		
		.li4{
			margin-left: 480px;
		}
		.li5{
			margin-top: 120px;
			margin-left:592px;
			margin-bottom:80px;
			position: relative;
		}
		button{
            border: 0;
			border-radius:0.7em;
	        color:#FFF;/*字体颜色*/
	        padding: 10px 20px;
	        font-weight: 350;
		}
		/*按钮的触发事件*/
		button:hover {
            box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
        } 
		.btn1{
			background-color:#3366CC;
		}
		.btn2{
			background-color:#f00000;
		}
		.btn3{
			background-color:dimgrey;
		}
		 body ul{
		 	
		 }
		body ul li{
			margin-left:450px ;
			margin-top: 60px;
		}
		.zc{
			margin-top: 21px;
			margin-left: 716px;
			padding-top: 20px;
			font-size:18px ;
		}
		.li1{
			float: left;
			margin-right: 68px;
		}
		</style>
	</head>
	<body>
		<ul>
			<li class="zc">用户注册</li>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-mobile"></i>&nbsp;账号:&nbsp;&nbsp;<input type="text" name="username" value="" size="80" maxlength="15" placeholder="请输入手机号码"></li>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-lock"></i>&nbsp;密码:&nbsp;&nbsp;<input type="password" name="password" value="" size="80" maxlength="15" placeholder="请输入密码"></li>
			<li class="li1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-address-book-o"></i>&nbsp;姓名:&nbsp;&nbsp;&nbsp;<input type="text" name="name" value="" size="30" maxlength="5" placeholder="请输入姓名"></li>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-smile-o"></i>&nbsp;年龄:&nbsp;&nbsp;<input type="text" name="age" value="" size="10" maxlength="3" placeholder="请输入年龄"></li>
			<li><i class="fa fa-id-card"></i>用户地址:&nbsp;&nbsp;<input type="text" name="card_id" value="" size="80" maxlength="15" placeholder="请输入用户地址"></li>
			<li><i class="fa fa-id-card"></i>邮箱地址:&nbsp;&nbsp;<input type="text" name="card_id" value="" size="80" maxlength="15" placeholder="请输入邮箱地址"></li>
			<li class="li4">	
				<div><i class="fa fa-user"></i>&nbsp;性别:</div>
				<div class="radiono">
					<div>
						<input id="item1" type="radio" name="sex" value="男" checked>
						<label for="item1"></label>
						&nbsp;&nbsp;
						<span>男</span>
					</div>
					<div>
						<input id="item2" type="radio" name="sex" value="女">
						<label for="item2"></label>
						&nbsp;&nbsp;
						<span>女</span>
					</div>
				</div>
				<br>
				<li><i class="fa fa-id-card"></i>设置密保问题:&nbsp;&nbsp;<input type="text" name="card_id" value="" size="80" maxlength="15" placeholder="请输入密保问题"></li>
				<li><i class="fa fa-id-card"></i>设置密保答案:&nbsp;&nbsp;<input type="text" name="card_id" value="" size="80" maxlength="15" placeholder="请输入密保答案"></li>
			</li>
			
			<li class="li5">
				&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
				<button class="btn1" type="submit"><i class="fa fa-check-square-o"></i>&nbsp;保存</button> &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
				<button class="btn2" id="cancel"><i class="fa fa-minus-square-o"></i>&nbsp;取消</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
				<button class="btn3" type="reset"><i class="fa fa-refresh"></i>&nbsp;重置</button> 
			</li>
		</ul>
	</body>
</html>

