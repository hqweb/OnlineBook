$(document).ready(function(){
	$("#login").click(function(){ //登陆
		$.ajax({    
            type: "get",//使用post方法访问后台    
            dataType: "json",//返回json格式的数据    
            url: "LoginClServlet",//要访问的后台地址    
            contentType: "application/json;charset=utf-8",    
            data: {
            	username:$('#username').val(),
				passname:$('#passname').val()
            },//要发送的数据    
            beforeSend: function() {},    
            complete :function(){},//AJAX请求完成时    
            success: function(data){//data为返回的数据，在这里做数据绑定   
	            	if(data != 0){
	            		$("#user").hide();
	            		$("#usersucc").show();
	            		$("#namesucc").text($('#username').val());
	            		$("#balance").text(data);
	            		//$("#namesucc").append($('#username').val());
		            }else {
		            	alert("失败");
		            }
                },    
             error: function(XMLResponse) {alert(XMLResponse.responseText)}    
         });                     
	});
	
	$("#cancel").click(function(){ //注销
		$("#user").show();
		$("#namesucc").text("");
		$("#usersucc").hide();
		$.ajax({    
            type: "get",//使用post方法访问后台    
            dataType: "json",//返回json格式的数据    
            url: "CancleUser",//要访问的后台地址    
            contentType: "application/json;charset=utf-8",    
            data: {},//要发送的数据    
            beforeSend: function() {},    
            complete :function(){},//AJAX请求完成时    
            success: function(data){//data为返回的数据，在这里做数据绑定   
	            
                },    
             error: function(XMLResponse) {}    
         });
	});
	
	$("#register").click(function(){ //注销
		window.location.href="register.jsp"; 
	});
	
});