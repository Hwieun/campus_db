<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>광운대학교</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="packed.js"></script>

</head>
<body>
	<div class="grid">
		<a href="../kwmain/kwmain.jsp"><img src="image/kwui.jpg" width="200"></a>
		<div id="campus">
			<a href="../LogInOut/ucampus_log.jsp"><strong>U-CAMPUS</strong></a>
		</div>
		<div id="life">
			<a href="../kwlife/login_kwlife.jsp" style="color: maroon"><strong>KW-LIFE</strong></a>
		</div>
	</div>

	<div id="wrapper">
		<div style="position: relative;">
			<div id="slider">
				<ul>
					<li><img src="image/example4.jpg" alt="1"></li>
					<li><img src="image/example1.jpg" alt="2"></li>
					<li><img src="image/example3.jpg" alt="3"></li>
					<li><img src="image/example2.jpg" alt="4"></li>
				</ul>
			</div>
			<div id="sliderbutton">
				<img src="image/left.png" alt="Previous"
					onclick="slideshow.move(-1)"> <br> <img
					src="image/right.png" alt="Next" onclick="slideshow.move(1)">
			</div>
		</div>
		<ul id="pagination" class="pagination">
			<li onclick="slideshow.pos(0)"></li>
			<li onclick="slideshow.pos(1)"></li>
			<li onclick="slideshow.pos(2)"></li>
			<li onclick="slideshow.pos(3)"></li>
		</ul>

	</div>
	<script type="text/javascript">
		var slideshow = new TINY.slider.slide('slideshow', {
			id : 'slider',
			auto : 3,
			resume : true,
			vertical : false,
			navid : 'pagination',
			activeclass : 'current',
			position : 0
		});
	</script>

</body>
</html>