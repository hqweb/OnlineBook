$(document).ready(function(){
	var speed = 30 //速度数值越大速度越慢
	butong_net_right2.innerHTML = butong_net_right1.innerHTML

	function Marquee4() {
	if(butong_net_right.scrollLeft <= 0)
			butong_net_right.scrollLeft += butong_net_right2.offsetWidth
		else {
			butong_net_right.scrollLeft--
		}
	}
	var MyMar4 = setInterval(Marquee4, speed)
		butong_net_right.onmouseover = function() {
		clearInterval(MyMar4)
	}
	butong_net_right.onmouseout = function() {
		MyMar4 = setInterval(Marquee4, speed)
	}
});