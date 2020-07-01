<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap-4/css/bootstrap.css">
<link rel="stylesheet" href="bootstrap-4/css/bootstrap.min.css">
<link rel="stylesheet" href="styles/global/jquery.colorwheel.css">
<link rel="stylesheet" href="styles/datatables.css">
<link rel="stylesheet" href="font-awesome/css/all.css">
<script src="js/jquery.js"></script>
<script src="js/popper.js"></script>

<script src="bootstrap-4/js/bootstrap.js"></script>

<script src="js/datatables.js"></script>
<script src="js/datatables.min.js"></script>
<script src="bootstrap-4/js/bootstrap.min.js"></script>
<script src="js/chart.js"></script>
<META http-equiv="Content-Type" content="text/html;charset=UTF-8">

<style type="text/css">

</style>
</head>
<body>

<div class="header"></div>
<br>
<div class="container">
<ul class="nav nav-pills" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="pill" href="#home">सुचना &nbsp;&nbsp;<i class="fas fa-home"></i></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#services">सेवा&nbsp;&nbsp;<i class="fas  fa-briefcase"></i></a>
    </li>
    
     <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#elected_candidates">जन प्रतिनिधि&nbsp;&nbsp;<i class="fas fa-user-plus"></i></a>
    </li>
    
    
    <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#staffs">कर्मचारी&nbsp;&nbsp;<i class="fas fa-user-tie"></i></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#plans_and_budget">बजेट तथा योजना &nbsp;&nbsp;<i class="fas fa-coins"></i></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#settings">Settings &nbsp;&nbsp;<i class="fas fa-cog"></i></a>
    </li>
    
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
    
     
    </div>
    <div id="services" class="container tab-pane"><br>
      	
    
     
    </div>
    <div id="elected_candidates" class="container tab-pane fade"><br>
     <h3>जन प्रतिनिधि विवरण</h3>
    
     
    </div>
    <div id="staffs" class="container tab-pane fade"><br>
      <h3>कर्मचारी विवरण</h3>
     	
    </div>
    <div id="plans_and_budget" class="container tab-pane fade"><br>
     
      
    </div>
    
     <div id="settings" class="container tab-pane fade"><br>
      <h3>Settings</h3>
     	
     	
    </div>
    
  </div>
</div>

</body>
<script>
$(document).ready(function(){
	$.ajax({
		  url: "/AppBase/Base",
		  type: "get", //send it through get method
		  dataType: 'json',
		  contentType: "application/json",
		  data: { 
			  'required':'services',
			  'device_type':'tv'
		  },
		  success: function(response) {
		    //Do Something
		    var body = $("#service_table").find("tbody");
		    var row = "";
		    for(var i = 0 ; i < response.length; i++){
		    	 row ="<tr>"+
		    	 "<td>"+response[i].service_title+"</td>"+
		    	 "<td>"+response[i].required_document+"</td>"+
		    	 "<td>"+response[i].process+"</td>"+
		    	 "<td>"+response[i].fee+"</td>"+
		    	 "<td>"+response[i].res_employee+"</td>"+
		    	 "<td>"+"<a id='edit_services' class=' fa fa-edit' href='#' data-toggle='modal' data-target='#updateServices' data-ref='"+JSON.stringify(response[i])+"'></a>"+"</td>"
		    	 +"</tr>" 
		    	 body.append(row);
		    }
		    
		    
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	$.ajax({
		  url: "/AppBase/Base",
		  type: "get", //send it through get method
		  dataType: 'json',
		  contentType: "application/json",
		  data: { 
			  'required':'newsfeed',
			  'device_type':'tv'
		  },
		  success: function(response) {
		    //Do Something
		    var body = $("#notice_table").find("tbody");
		    var row = "";
		    for(var i = 0 ; i < response.length; i++){
		    	 row ="<tr>"+
		    	 "<td>"+response[i].notice_title+"</td>"+
		    	 "<td>"+response[i].notice_body+"</td>"+
		    	 "<td>"+"<a id='edit_newsfeed' class=' fa fa-edit' href='#' data-toggle='modal' data-target='#updateNewsFeed' data-ref='"+JSON.stringify(response[i])+"'></a>"+"&nbsp;&nbsp;&nbsp;<a class=' fa  fa-trash ' href='#'></a>"+"</td>"
		    	 +"</tr>" 
		    	 body.append(row);
		    }
		    
		    
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	$.ajax({
		  url: "/AppBase/Base",
		  type: "get", //send it through get method
		  dataType: 'json',
		  contentType: "application/json",
		  data: { 
			  'required':'elected_candidates',
			  'device_type':'tv'
		  },
		  success: function(response) {
		    //Do Something
		   // console.log(response)
		    var body = $("#candidate_table").find("tbody");
		    var row = "";
		    for(var i = 0 ; i < response.length; i++){
		    	 row ="<tr>"+
		    	 "<td>"+response[i].candidate_name+"</td>"+
		    	 "<td>"+response[i].candidate_post+"</td>"+
		    	 "<td>"+response[i].candidate_contact+"</td>"+
		    	 "<td>"+response[i].candidate_image+"</td>"+
		    	 "<td>"+response[i].candidate_weight+"</td>"+
		    	 "<td>"+"<a id='edit_candidate' class=' fa fa-edit' href='#' data-toggle='modal' data-target='#updateCandidate' data-ref='"+JSON.stringify(response[i])+"'></a>"+"&nbsp;&nbsp;&nbsp;<a class=' fa  fa-trash ' href='#'></a>"+"</td>"
		    	 +"</tr>" 
		    	 body.append(row);
		    }
		    
		    
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
		
	$.ajax({
		  url: "/AppBase/Base",
		  type: "get", //send it through get method
		  dataType: 'json',
		  contentType: "application/json",
		  data: { 
			 
			  'device_type':'tv',
			  'required':'settings'
		  },
		  success: function(response) {
		    //Do Something
		//   console.log(response);
		   // var body = $("#settings_table").find("tbody");
		    var i = 0;
		    $.each(response, function(index,value){
		    	
		    	$("#settings_table > tbody").append(
		    			"<tr>"+
	    				  "<td>"+response[index].field_name+"</td>"+
	    				  "<td>"+response[index].field_value+"</td>"+
	    				  "<td> <a class='fa fa-edit' id='edit_settings' href='#' data-toggle='modal' data-ref='"+JSON.stringify(value)+"' data-target='#updateSettings'></a>"+"&nbsp;&nbsp;&nbsp;<a class=' fa  fa-trash ' href='#'></a>"+"</td>"+

	    				  "</tr>");
		    	
		    });

		    
		    
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
});

</script>
</html>