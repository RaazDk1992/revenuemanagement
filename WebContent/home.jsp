<%@ page language="java" contentType="text/html; charset=UTF-8"
    %>
    
    <%@include file="profile.html" %>
<!DOCTYPE html>
<html>
<head>
  <title></title>
<script src="js/jquery.js"></script>
<script src="bootstrap-4/js/bootstrap.bundle.min.js"></script>
<script src="js/multiselect.js"></script>

<script src="js/popper.js"></script>
<script src="datepicker/datepicker.js"></script>
<link rel="stylesheet" type="text/css" href="styles/homestyle.css">
<link rel="stylesheet" type="text/css" href="styles/multiselect.css">

 <link rel="stylesheet" href="bootstrap-4/css/bootstrap.min.css">
<link rel="stylesheet" href="font-awesome/css/all.css">
<link rel="stylesheet" href="datepicker/datepicker.css">


<META http-equiv="Content-Type" content="text/html;charset=UTF-8">

</head>
<body>


<header class="header" role="banner">


  <h1 class="logo">


    
    <div id="pic">
      
        <div id="avtar"></div>
        <div id="details">
          <span class="user_details" id="user_n">Welcome, User</span>
          <span class="user_details" id="user_designation">Admin</span>
        </div>

    </div>
   
 

    <a href="#">कर्मचारी<span>ब्यवस्थापन</span></a>
  </h1>

  <div class="nav-wrap">
    <nav class="main-nav" role="navigation">
      <ul class="unstyled list-hover-slide">
        <li ><a id="default" class="selected-menu" href="#staffs">कर्मचारी</a></li>
        <li><a href="#payroll">PayRoll</a></li>
        <li><a href="#settings">Settings</a></li>
        <li><a href="#">yy</a></li>
      </ul>
    </nav>
    
  </div>

  <div class="main-content">

    <section id="staffs" style="width: 1000px;">
    <div id="staffs_pane" class="container">
    	<div class="card">
  <h5 class="card-header">Add Employee</h5>
  <div class="card-body">
	
	<form action="" role="form">
		<div class="form-row">
		
		<div class="form-group col-md-4">
      <label for="employee_name">कर्मचारी को नाम</label>
      <input type="text"  class="form-control" id="main_title_ref" name="employee_name"/>
    </div>
    <div class="form-group col-md-4">
      <label for="service_name">पद</label>
      <select class="form-control" id="employee_post"  name="employee_designation"></select>
    </div>
    <div class="form-group col-md-4">
      <label for="service_name">तह/ श्रेणी</label>
      <select class="form-control" id="designation_level"  name="designation_level"></select>
    </div>
    
		
		</div>
		<div class="form-row">
		
		<div class="form-group col-md-4">
      <label for="employee_name">शाखा </label>
      <select  class="form-control" id="employee_dept_ref" name="employee_dept_ref"></select>
    </div>
		
		<div class="form-group col-md-2">
      <label for="employee_name">आधारभुत तलब</label>
      <input type="text"  class="form-control" id="basic_salary" name="basic_salary"/>
    </div>
    <div class="form-group col-md-2">
      <label for="employee_name">ग्रेड </label>
      <select  class="form-control" id="grade_value" name="grade_value"></select>
    </div>
   <div class="form-group col-md-4">
      <label for="employee_name">भत्ता</label>
      <select class="selectpicker form-control" multiple data-live-search="true" id="benificiary" name="benificiary">
      <option>Item 1</option>
  <option>Item 2</option>
  <option>Item 3</option>
      </select>
    </div>
    
		</div>
		
		<div class="form-row">
		
		<div class="form-group col-md-3">
      <label for="employee_name">हाँजिर भएको मिति</label>
      <input type="text"  class="form-control" id="join_date" name="join_date"/>
    </div>
    <div class="form-group col-md-3">
      <label for="employee_name">अन्तिम तलब लिएको</label>
      <input type="text"  class="form-control" id="last_paid_on" name="last_paid_on"/>
    </div>
    <br>
    <div class="form-group col-md-1">
     	<label for="employee_name">-</label>
      <input  type="submit" class="btn btn-danger form-control" value="+"/>
    </div>
   
    
		
		</div>
	</form>
	
    
  </div>
</div>
    </div>
    <!-- Panel that contains employees details -->
    <div id="employees_details">
    
    </div>
    
    <div id="floating_button"><a class="fas fa-plus" style="cursor: pointer; display:block;float:left;left:10px; top:15px;position:relative;"></a> &nbsp;&nbsp; &nbsp;&nbsp;<a class="fas fa-file" style="cursor: pointer; display:block;float:left;left:30px; top:15px;position:relative;"></a>  &nbsp;&nbsp;<a class="fas fa-download" style="cursor: pointer; display:block;float:left;left:60px; top:15px;position:relative;"></a>
    </div></section>
    <section id="payroll"> </section>
    <section id="settings" style="width: 1000px;">
    
    		<div class="container">
    		
    		 <a href="#designation" data-toggle="collapse">पद</a>

			<div id="designation" class="collapse">
					
					<form action="">
					
					<div class="form-row">
		
					<div class="form-group col-md-4">
      				<label for="employee_name">पद</label>
   					   <input type="text"  class="form-control" id="desg_name" name="desg_name"/>
   					 </div>
   		
   					 <div class="form-group col-md-1">
     					 <label for="service_name">-</label>
    				<input type="submit" name="submit_desg" value="+" class="form-control btn btn-danger"/>
   					 </div>
    
		
					</div>
					
					
					</form>
					
			</div> 
			<br>
			<a href="#level" data-toggle="collapse">श्रेणी/तह</a>

			<div id="level" class="collapse">
					<div class="form-row">
		
					<div class="form-group col-md-4">
      				<label for="employee_name">श्रेणी</label>
   					   <input type="text"  class="form-control" id="level_name" name="level_name"/>
   					 </div>
   		
   					 <div class="form-group col-md-1">
     					 <label for="service_name">-</label>
    				<input type="submit" name="submit_level" value="+" class="form-control btn btn-danger"/>
   					 </div>
    
		
					</div>
			</div> 
			<br>
			<a href="#grade" data-toggle="collapse">ग्रेड</a>

			<div id="grade" class="collapse">
					
					<form>
					
					<div class="form-row">
		
					<div class="form-group col-md-2">
      				<label for="employee_name">ग्रेड</label>
   					   <input type="text"  class="form-control" id="grade_name" name="grade_name"/>
   					 </div>
   					 
   					 <div class="form-group col-md-2">
      				<label for="employee_name">रकम</label>
   					   <input type="text"  class="form-control" id="grade_value" name="grade_value"/>
   					 </div>
   		
   					 <div class="form-group col-md-1">
     					 <label for="service_name">-</label>
    				<input type="submit" name="submit_desg" value="+" class="form-control btn btn-danger"/>
   					 </div>
    
		
					</div>
					
					</form>
					
			</div> 
			<br>
			<a href="#bhatta" data-toggle="collapse">भत्ता</a>

			<div id="bhatta" class="collapse">
					
					<form>
					
					<div class="form-row">
		
					<div class="form-group col-md-4">
      				<label for="employee_name">भत्ताको शिर्षक</label>
   					   <input type="text"  class="form-control" id="grade_name" name="grade_name"/>
   					 </div>
   					 
   					 <div class="form-group col-md-2">
      				<label for="employee_name">रकम</label>
   					   <input type="text"  class="form-control" id="bhatta_value" name="bhatta_value"/>
   					 </div>
   		
   					 <div class="form-group col-md-1">
     					 <label for="service_name">-</label>
    				<input type="submit" name="submit_bhatta" value="+" class="form-control btn btn-danger"/>
   					 </div>
    
		
					</div>
					
					</form>
					
			</div> 
			
			<br>
			<a href="#dept" data-toggle="collapse">शाखा</a>

			<div id="dept" class="collapse">
					<form>
					<div class="form-row">
		
					<div class="form-group col-md-4">
      				<label for="employee_name">शाखाको नाम</label>
   					   <input type="text"  class="form-control" id="dept_name" name="dept_name"/>
   					 </div>
   		
   					 <div class="form-group col-md-1">
     					 <label for="service_name">-</label>
    				<input type="submit" name="submit_dept" value="+" class="form-control btn btn-danger"/>
   					 </div>
    
		
					</div>
					
					
					</form>
			</div> 
			<br>
			<a href="#salary_scale" data-toggle="collapse">तलब मान</a>

			<div id="salary_scale" class="collapse">
					<form>
					
						<div class="form-row">
		
				
   					 <div class="form-group col-md-3">
   					   <label for="employee_name">पद </label>
     					 <select  class="form-control" id="desg_ref_sal" name="desg_ref_sal"></select>
   					 </div>
   					<div class="form-group col-md-3">
  					    <label for="employee_name">तह/ श्रेणी</label>
   					   <select class=" form-control" id="level_ref_sal" name="level_ref_sal"></select>
      					</div>
      					<div class="form-group col-md-2">
     				 <label for="employee_name">आधारभुत तलब</label>
     				 <input type="text"  class="form-control" id="basic_salary" name="basic_sal"/>
   					 </div>
   					 
   					 <div class="form-group col-md-1">
     				 <label for="employee_name">-</label>
     				 <input type="submit"  class="form-control btn btn-danger" id="submit_sal" name="submit_sal" value="+"/>
   					 </div>
   					
    
				</div>
					
					
					</form>
			</div> 
    		
    		
    		</div>
    
    
    </section>
    <section id="blog"></section>

  </div>
</header>


</body>

<script>

  //Menu item Trigger
  $(function(){
   $('li a').click(function(){
     $('li a').each(function(a){
       $( this ).removeClass('selected-menu');
     });
     $( this ).addClass('selected-menu');
   });
  
  $('ul a').click(function(){
     $('ul a').each(function(a){
      $( this ).removeClass('selected-menu')
     });
     $( this ).addClass('selected-menu');
   });
    // Trigger click

    currLoc = $(location).attr('href'); 
    temp = currLoc.split("#");
    if(temp.length<2){

     // window.location.replace(currLoc+"#staffs");
    }
   

});
  
 
</script>
</html>

