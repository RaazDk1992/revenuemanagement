
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <script src="vendor/jquery/jquery.min.js"></script>
</head>
<style>
	#menu_trigger{
	position:relative;
	left:0px;
	top:80px;
	width:80px;
	height:80px;
	
	 background-image: url("./assets/window.svg"); 
	 
	border-radius: 40px;
	}
	#menu_wrapper{
	position: relative;
	left: 20px;
	top: 60px;
	width : 200px;
	height: 300px;
	background:#0e336e;}
	#menu_items{
	margin:0;
	padding:0;
	list-style: none;
	text-align:center;
	
	color: white;
	}
	li{
	display:block;
	height: 50px;
	border-bottom: 1px solid white;
	}
	#nav{
	float: left;}
</style>
<body>
<div id="nav">

<button id="menu_trigger"></button>
<div id="menu_wrapper" >
	<ul id="menu_items">
		<li>Profile</li>
		<li>Settings</li>
		<li>Reports</li>
		<li>Charts and Summary</li>
	</ul>

</div>
</div>


</body>
<script>
$(document).ready(function(){
	$("#menu_trigger").click(function(){
		$("#menu_wrapper").toggleClass("active");
		
		$("#menu_wrapper").slideToggle("slow");
	});
	
	
});
</script>
</html>