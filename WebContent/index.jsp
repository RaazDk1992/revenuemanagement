<%@ page language="java" contentType="text/html;"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<meta charset="UTF-8">
<title>Insert title here</title>
	 <script src="vendor/jquery/jquery.min.js"></script>
	  <script src="js/index.js"></script>
	  <script src="datepicker/datepicker.js"></script>
	   <script src="js/digit.js"></script>
	    <script src="js/prototypes.js"></script>
    <link rel="stylesheet" href="css/index.css">
    
<style>
#quicklinks_container{
position: relative;

}
</style>
</head>
<body>
						<div class="date_and_time" style="position:absolute; top:30px; right:30px; border: 2px solid #0e336e; border-radius:5px; width:200px;height:50px; text-align: center; color: #0e336e;">
							<span id="date">आज : </span><br>
							<span id="time"></span>
						</div>
						<div class="quicklinks_container">
								<div class="quicklinks_header"></div>
								<div class="quicklinks_contents"></div>
						</div>

<div class="materialContainer">

   <div class="box">

      <div class="title">LOGIN</div>

     <form id="login_form" method="post" action="./InventoryBase">
     <input type="hidden" name="task" value="login"/>
     	 <div class="input">
         <label for="name">Username</label>
         <input type="text" name="uname" id="name">
         <span class="spin"></span>
      </div>

      <div class="input">
         <label for="pass">Password</label>
         <input type="password" name="pass" id="pass">
         <span class="spin"></span>
      </div>

      <div class="button login">
         <button type="submit"><span>GO</span> <i class="fa fa-check"></i></button>
      </div>
     	
     </form>
      <a href="" class="pass-forgot">Forgot your password?</a>

   </div>

   <div class="overbox">
      <div class="material-button alt-2"><span class="shape"></span></div>

      <div class="title">REGISTER</div>

      <div class="input">
         <label for="regname">Username</label>
         <input type="text" name="regname" id="regname">
         <span class="spin"></span>
      </div>

      <div class="input">
         <label for="regpass">Password</label>
         <input type="password" name="regpass" id="regpass">
         <span class="spin"></span>
      </div>

      <div class="input">
         <label for="reregpass">Repeat Password</label>
         <input type="password" name="reregpass" id="reregpass">
         <span class="spin"></span>
      </div>

      <div class="button">
         <button><span>NEXT</span></button>
      </div>


   </div>

</div>

<script>

var currentDate = new Date();
var d = AD2BS(currentDate.getFullYear()+"-"+parseInt(currentDate.getMonth()+1)+"-"+currentDate.getDate());

var e = d.split("-");
$("#date").text(convertToNepaliDigit(e[0])+"-"+convertToNepaliDigit(e[1])+"-"+convertToNepaliDigit(e[2]));

var fxn = function() {
	
	  var secs = new Date().getSeconds() ;
	  var hrs = new Date().getHours() ;
	  var minutes = new Date().getMinutes() ;
	  document.getElementById('time').innerHTML = convertToNepaliDigit(hrs)+" : "+convertToNepaliDigit(minutes)+" : "+convertToNepaliDigit(secs);
	  //alert("#");
	}
	setInterval(fxn, 1000);
	
	$("#login_form").submit(function(e){
		
		e.preventDefault(); // avoid to execute the actual submit of the form.
		   //console.log("event occured");
		    var form = $(this);
		    var _url = form.attr('action');
		    $.ajax({
		        url:_url,
		        type: "POST", //send it through get method
		        dataType: 'json',
		        contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		        data: form.serialize(),
		        success: function(response) {
		          console.log(response);
		          var msg = response.status;
		          if(msg == "success"){
		        	  window.location.replace("./main.jsp");
		            
		          }else if( msg == "fail"){
		            
		          }else {
		            
		          }
		          
		        },
		        error: function(xhr) {
		          //Do Something to handle error
		          console.log(xhr);
		        }
		      });
		
	});
	
</script>
</body>
</html>