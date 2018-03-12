$(document).ready(function(){
	$("#cancel").click(function(){ //注销
		//window.location.href = "../HomeBook";
		// window.location.href="homeBook/home.jsp"; 
		history.back(-1);
	});
});