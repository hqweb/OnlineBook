$(document).ready(function(){
	
	var bookNa = $(".bookNa");
	var bookAur = $(".bookAur");
	var bookSy = $(".bookSy");
	var bookPr = $(".bookPr");
	var bookIb = $(".imgBook");
	var bookSe = $(".bookSe"); //销售额
	var bookSk = $(".bookSk");//库存
	var buyBook = $(".buyBook");//购买书籍
	var buyNum = $(".buyNum");//购买数量
	
	var i = 0;
	var page = 1;
	var PageCount = $("#PageCount").text();
	var bookAjax = function(){ 
		$.ajax({    
            type: "post",//使用post方法访问后台    
            dataType: "json",//返回json格式的数据    
            url: "HomeBook",//要访问的后台地址    
            //contentType: "application/json;charset=utf-8",    
            data: {
            	pageSer:page,
            },//要发送的数据    
            beforeSend: function() {},    
            complete :function(){},//AJAX请求完成时    
            success: function(data){//data为返回的数据，在这里做数据绑定   
            	/*$.each(data,function(key,value){   
            		 alert(key+":"+value);
		        }); */
		    	$.each(data.jsonArray,function(index){   
		            $.each(data.jsonArray[index],function(key,value){ 
		            	if(key == 'name'){
			            	var $book = $(bookNa[i]);
			            	$book.text(value);
		            	}else if(key == 'author'){
		            		var $book = $(bookAur[i]);
			            	$book.text(value);
		            		
		            	}else if(key == 'synopsis'){
		            		var $book = $(bookSy[i]);
			            	$book.text(value);
		            		
		            	}else if(key == 'price'){
		            		var $book = $(bookPr[i]);
			            	$book.text(value);
			            	
		            		
		            	}else if(key == 'cover'){
		            		var $book = $(bookIb[i]);
		            		$book.attr('src',"img/"+value); 
		            		
		            	}else if(key == 'salesvolume'){
		            		var $book = $(bookSe[i]);
			            	$book.text(value);
		            		
		            	}else if(key == 'stock'){
		            		var $book = $(bookSk[i]);
			            	$book.text(value);
		            		i++;
		            	}
		            	
		            	
		            	
		            });      
		        }); 
            },    
            error: function(XMLResponse) {alert(XMLResponse.responseText)}    
        });     
	};
	
	var payAjax = function(x){
		$.ajax({    
		    type: "get",//使用post方法访问后台    
		    dataType: "json",//返回json格式的数据    
		    url: "ByBook",//要访问的后台地址     
		    data: {
		    	bookName:encodeURI(x.bookNA),
		    	bookPrice:x.bookPR,
		    	bookNum:x.buyNU
		    },//要发送的数据    
		    beforeSend: function() {},    
		    complete :function(){},//AJAX请求完成时    
		    success: function(data){//data为返回的数据，在这里做数据绑定   
		    			if(data == -1){
		    				alert("购买失败");
		    			} else if(data == 0){
		    				alert("请登陆");
		    			} else {
			        		$.each(data,function(key,value){ 
			        			if(key == 'stock')
			        				$(bookSk[x.index]).text(value);
			        			else if(key == 'balance')
			        				$("#balance").text(value);
			        			else if(key == 'salesvolume'){
			        				$(bookSe[x.index]).text(value);
			        			}
			        				
			        				
			        			
			        		});
		    			}
		    		},    
		    error: function(XMLResponse) {alert(XMLResponse.responseText)}                    
		});
	};
	
	var userAjax = function(x){
		$.ajax({    
		    type: "post",//使用post方法访问后台    
		    dataType: "json",//返回json格式的数据    
		    url: "UsersClServlet",//要访问的后台地址     
		    data: {
		    	userName : encodeURI(x.userName)
		    },//要发送的数据    
		    beforeSend: function() {},    
		    complete :function(){},//AJAX请求完成时    
		    success: function(data){//data为返回的数据，在这里做数据绑定   
				    	$.each(data,function(key,value){ 
				    		if(key == 'name')
				    			$("input[name='username']").val(value);
		        			else if(key == 'phone'){
		        				$("input[name='tel']").val(value);
		        			}else if(key == 'address'){
		        				$("input[name='address']").val(value);
		        			}else if(key == 'email'){
		        				$("input[name='postcode']").val(value);
		        			}
		        		});
		    		},    
		    error: function(XMLResponse) {}                    
		});
	};
	
	
	$("#upPage").click(function(){
		i = 0;
		page--;
		if(page < 1 )
			page = PageCount;
		bookAjax();
		                
	});

	
	$("#doPage").click(function(){
		i = 0;
		page++;
		if(page > PageCount)
			page = page%PageCount;
		bookAjax();  
	});
	
	
	/*for (var i = 0; i < 6; i++) {
		var $buybook = $(buyBook[i]);
		var $book = $(bookSe[i]);
		$buybook.click(function(){
			alert($book.text());
			console.log($buybook);
		});
	}*/
	var indexs = 0;
	$("#confirm").click(function (event) {
		
		
        $("#racePop").hide(300);
        $.LoadPay({
			bookNA : $(bookNa[indexs]).text(),//书名
			bookPR : $(bookPr[indexs]).text(),//单价
			buyNU : $(buyNum[indexs]).val(),//购买数量
			index : indexs
		});
    });
	

	
	$(".buyBook").each(function(index,domEle){  //此处 this 指代的是 DOM 对象而非 jQuery 对象。
		 $(this).click(function(){
			 
			
			var na = $(bookNa[index]).text();
			var num = $(buyNum[index]).val();
			var pr = $(bookPr[index]).text();
			var all = num*pr;
			$("#orBname").text(na);
			$("#orBnum").text(num);
			$("#orBpr").text(pr);
			$("#orBall").text(all);
				
			var userName = $("#namesucc").text();
			if( userName != ""){
				$.LoadPay = payAjax;
				$.LoadUser = userAjax;
				indexs = index;
				$.LoadUser({
					userName : userName,//书名
				});
				$("#racePop").show(300);
				//隐藏层
			} else {
				alert("请登陆");
			}
		});
	});
	
	
});

