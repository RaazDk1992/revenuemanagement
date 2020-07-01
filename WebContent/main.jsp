<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap-4/css/bootstrap.css">
<link rel="stylesheet" href="bootstrap-toggle/css/bootstrap-toggle.css">
<link rel="stylesheet" href="datepicker/datepicker.css">
<link rel="stylesheet" href="css/recieptstyle.css">
<link rel="stylesheet" href="css/togglebutton.css">
<link rel="stylesheet" href="css/loader.css">
<link rel="stylesheet" href="css/card.css">
<link rel="stylesheet" href="font-awesome/css/all.css">
<script src="js/jquery.js"></script>
<script src="bootstrap-4/js/bootstrap.min.js"></script>
<script src="js/popper.js"></script>
<script src="datepicker/datepicker.js"></script>
<META http-equiv="Content-Type" content="text/html;charset=UTF-8">

<style type="text/css">


#search_bar{
position:absolute !important;
top:16% !important;
}

#report_details{
position:absolute !important;
top:35% !important;
width:90% !important;
}
@media print {
        input,select,button,label,.nav {visibility:hidden;}
        table, td,th{ border-collapse: collapse;border: 1px solid black; table-layout: fixed ;
  width: 100% ;word-wrap:break-word;}
  td,th{
  	 width: 5% ;word-wrap:break-word;
  }
 
       
        @page {
 margin: 0; 
size: landscape;
}


      }
  
</style>
</head>
<body>

<div class="header"></div>
<br>
<div class="container">
<ul class="nav nav-pills" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="pill" href="#home">गृह &nbsp;&nbsp;<i class="fas fa-home"></i></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#service_charge">दर रेट&nbsp;&nbsp;<i class="fas fa-coins"></i></a>
    </li>
    
     <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#reports">रिपोर्ट्स&nbsp;&nbsp;<i class="fas fa-file-alt"></i></a>
    </li>
    
    
    <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#staffs">कर्मचारी ब्यवस्थापन&nbsp;&nbsp;<i class="fas fa-user-tie"></i></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#summary">सारांश &nbsp;&nbsp;<i class="fas fa-chart-bar"></i></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#settings">Settings &nbsp;&nbsp;<i class="fas fa-cog"></i></a>
    </li>
    
  </ul>

<!-- 
 -->
 
  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
    
    	<!-- ---
    	
    	
    	
    	  -- ---
    	 -->
    	 
    	 <% 
String rasid=(String)session.getAttribute("current_rasid"); 
    	 //office_id
   int  office_id=(int )session.getAttribute("office_id"); 
    	 String user = (String)session.getAttribute("full_name");
    	 String designation = (String)session.getAttribute("designation");
    //	System.err.println(designation);
    	 
    	 
%> 
    	 
    	 <form id="revenue_bill_form" action="./InventoryBase" method="POST">
    	 
    	            <input type="hidden" name="current_rasid" id="current_rasid" value="<%=rasid %>"/>
    	            <input type="hidden" name="office_ref" id="office_ref" value="<%=office_id %>"/>
    	           
    	            <input type="hidden" name="host_name_hidden" id="host_name"/>
					<input type="hidden" name="task" value="new_bill"/>
					<input type="hidden" name="service_ref_hidden" id="rev_ref_hidden"/>
					<input type="hidden" name="date_hidden" id="date_hidden"/>
					<input type="hidden" name="total_amount_hidden" id="total_amount_hidden"/>
										 <div class="form-row">
				<div class="form-group col-md-7">
     			 <label for="service_name">सेवा ग्राहीको नाम</label>
      			<input type="text" class="form-control" id="customer_name" name="customer_name" placeholder="सेवा ग्राहीको नाम"/>
   				 </div>
    <div class="form-group col-md-4">
      <label for="category_id">ठेगाना</label>
      <select  class="form-control" id="_customer_address" name="customer_addresss"></select>
    </div>
   
  </div>
   <div class="form-row">
   <div class="form-group col-md-2">
      <label for="category_id">आर्थिक वर्ष</label>
      <select  class="form-control" id="fiscal_year" name="fiscal_year_ref"></select>
    </div>
    <div class="form-group col-md-6">
      <label for="category_id">राजश्व शिर्षक</label>
      <select  class="form-control" id="revenue_title_ref_drop" name="revenue_title_ref"></select>
    </div>
    
    <div class=" form-group col-md-1">
    <div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
     <button id="process_to_bill" class="btn btn-danger" type="button" class="form-control" >+</button>
   </div>
  </div>
  
  				<div id="bill_holder">
					
							<div id="reciept">
							
								<span id="client_name"></span>
								<span id="client_address">address</span>
								<span id="trans_date"></span>
								
									<div id="bill_body"></div>
								
								<span id="rev_amount_total">xx</span>
								<span id="user"> <%=user %></span>
								<span id="designation"> <%=designation %></span>
									
							
							</div>
							<br>
							<div id="bill_status_message"></div>	
							<div class="container">
							
  								<div class="row">
   									 <div class="col text-center">
   									   
      									<input id="confirm_print" type="submit" class="btn btn-primary" value="प्रिन्ट"/>
      									
    								</div>
  								</div>
							</div>					
					</div>	
  				
	    </form>
    	 
    	 <a href="#" class=" fas fa-plus toggle_link" data-toggle="collapse" data-target="#search_rec"> &nbsp;&nbsp;खोजी</a>

				<div id="search_rec" class="collapse">
				
					
					<table id="rasid_table" class="table table-bordered">
    							     
    							     <thead>
    									<tr>
   												  <th scope="col">#</th>
   								   				  <th scope="col" >सेवा ग्राही</th>
   								   				 <th scope="col" nowrap>ठेगाना</th>
      											<th scope="col" >शिर्षक</th>
      											 <th scope="col" nowrap>दर</th>
      							  				<th scope="col" nowrap>मिति</th>
      											 <th scope="col" nowrap>Task</th>
      							
    								</tr>
  									</thead>
    							     <tbody id="bill_table_body">
    							     </tbody>
    							     <tfoot id="bill_table_footer">
    							     </tfoot>
    							     </table>
				
				
				</div>
    	 
    	
     
    </div>
    <div id="service_charge" class="container tab-pane"><br>
      		
    		 <a href="#" class=" fas fa-plus toggle_link" data-toggle="collapse" data-target="#service_category"> &nbsp;&nbsp;मुख्य शिर्षक</a>

				<div id="service_category" class="collapse">
							<br>	
					<form id="service_category_form" action="./InventoryBase" method="post">
					<input type="hidden" name="task" id="tsk" value="new_main_title"/>
  						<div class="form-row">
  						<label> राजश्व मुख्य शिर्षक</label>
   							 <div class="col-6">
     							 <input  type="text"  id=" revenue_main_title" name = "revenue_main_title" class="form-control" placeholder="राजश्व मुख्य शिर्षक"/>
   							 </div>
  							
   							 
    						<div class="col-1">
      							<button class="btn btn-danger" type="submit" class="form-control" >+</button>
   							 </div>
  						</div>
					</form>
					<br>
					<div id="main_title_status"></div>
					<div class="container">
						<br>
						<table id="table_revenue_maintable" class="table table-sm">
 						 <thead>
    						<tr>
   								  <th scope="col">#</th>
   								   <th scope="col">शिर्षक</th>
   								   <th scope="col">Task</th>
      							<th scope="col">Status</th>
    						</tr>
  						</thead>
  						<tbody id="revenue_main_title_table">
  						</tbody>
  					</table>
					
					
					</div>
								
				</div>
				
				<br>
				
				 <a href="#" class=" fas fa-plus toggle_link" data-toggle="collapse" data-target="#service_fare"> &nbsp;&nbsp;दर रेट</a>

				<div id="service_fare" class="collapse">
					<!--    
					
					----------------------------------------
					
					Revenue Title form.
					----------------------------------------
					
					
					
					 -->			
					<form id="new_revenue_title_form" action="./InventoryBase" method="POST">
					<input type="hidden" name="task" value="new_revenue_title"/>
					 <div class="form-row">
    <div class="form-group col-md-4">
      <label for="category_id">मुख्य शिर्षक</label>
      <select  class="form-control" id="main_title_ref" name="main_title_ref"></select>
    </div>
    <div class="form-group col-md-7">
      <label for="service_name">शिर्षक</label>
      <input type="text" class="form-control" id="service_name"  name="service_name" placeholder="राजश्व शिर्षक"/>
    </div>
  </div>
   <div class="form-row">
   <div class="form-group col-md-4">
      <label for="category_id">आर्थिक वर्ष</label>
      <select  class="form-control" id="fiscal_year_" name="fiscal_year_"></select>
    </div>
    <div class="form-group col-md-3">
      <label for="inputPassword4">दर</label>
      <input type="text" class="form-control" id="service_fare" name="service_fare" placeholder="दर"/>
    </div>
    
    <div class=" form-group col-md-1">
    <div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
     <button class="btn btn-danger" type="submit" class="form-control" >+</button>
   </div>
  </div>
  				
					</form>
							
							
							
							<!-- -
							-----------------------------------------------------------------------------
							
													Revenue Title Table
							-----------------------------------------------------------------------------
							
							 -->
							 
							 
							 
							 <div class="container">
						<br>
						<table id="table_revenue_title" class="table table-sm">
 						 <thead>
    						<tr>
   								  <th scope="col">#</th>
   								   <th scope="col">आर्थिक वर्ष</th>
   								   <th scope="col">संस्था</th>
      							<th scope="col">शिर्षक</th>
      							 <th scope="col">दर</th>
      							  <th scope="col">Task</th>
      							 <th scope="col">status</th>
      							
    						</tr>
  						</thead>
  						<tbody id="revenue_title_table">
  						</tbody>
  					</table>
					
					
					</div>	
								
								
				</div>
    		
     
    </div>
    <div id="reports" class="container tab-pane fade"><br>
     
      <a href="#" class="fas fa-plus toggle_link" data-toggle="collapse" data-target="#reports_panel"> &nbsp;&nbsp;हेर्नुहोस्</a>

				<div id="reports_panel" class="collapse">
								
								
									
									<div class="container">
									<form id="search_form" class="form" role="form" action="./InventoryBase" method="POST">
								
									<input type="hidden" name="search_string_hidden" id="search_string_hidden"/>
									<input type="hidden" name="task" id="task" value="_search"/>
									
									<input type="hidden" name="date_picker_from_en" id="date_picker_from_en"/>
									<input type="hidden" name="date_picker_to_en" id="date_picker_to_en" />
									<input type="hidden" name="rec_by_user_name_hidden" id="rec_by_user_name_hidden" />
								
									<div class="row" id="search_bar">
       									 <div class="col-md-4">
          										 <label>प्रयोग कर्ता</label>
          										 <select class="form-control"  id="rec_by_user_name" name="rec_by_user_name" ></select>
      									 </div>
      									 
      									 <div class="col-md-3">
      									 
      									 	<label>From Date: </label>
      									 	<input type="text" id="fromDateD" class="nepali-calendar form-control" value="2073-12-12"/>			 
      									 
      									 </div>
      									   <div class="col-md-3">
      									 
      									 	<label>To Date: </label>
      									 	<input type="text" id="toDateD" class="nepali-calendar form-control" value="2073-12-12"/>			 
      									 
      									 </div>
      									 <div class="col-md-1">
      									 
      									 <label>.&nbsp;&nbsp;&nbsp;&nbsp;</label>
      									 <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i></button>
      									 </div>
       								
       									<div class="col-md-1">
       									 <div class="progress" style="top:52% !important;"></div>
       									</div>
    							      </div> 
    							      </form>
    							      
    							      
    							      <!-- 
    							      **************************************************************************
    							      								Report Table
    							      **************************************************************************
    							       -->
    							    <div id="report_details">
    							    
    							    	 <table id="report_table" class="table table-sm">
    							     
    							     <thead>
    									<tr>
   												  <th scope="col">#</th>
   								   				  <th scope="col">सेवा ग्राही</th>
   								   				 <th scope="col">ठेगाना</th>
      											<th scope="col">शिर्षक</th>
      											 <th scope="col">दर</th>
      							  				<th scope="col">प्रयोगकर्ता</th>
      											 <th scope="col">TimeStamp</th>
      							
    								</tr>
  									</thead>
    							     <tbody id="report_table_body">
    							     </tbody>
    							     <tfoot id="report_table_footer">
    							     
    							     	
    							     
    							     </tfoot>
    							     </table>
    							     <div id="report_date_range"></div>
    							     <div id="report_total_amount_in_number"> जम्मा रु. : </div>
    							        <div id="report_total_amount_in_words"> अक्षररुपी : </div>
    							     
    							    	<div class="container">
							
  								<div class="row">
   									 <div class="col text-center">
   									   
      									<input id="export_report" type="button" class="btn btn-primary" value="प्रिन्ट"/>
      									
    								</div>
  								</div>
							</div>				
    							    </div>
								
								</div>
								
								
								
								
								
								
								
				</div>
				
				<br>
    
     
    </div>
    <div id="staffs" class="container tab-pane fade"><br>
      <h3>कर्मचारी ब्यवस्थापन</h3>
      
       <a id="x101" href="#" class=" fas fa-plus toggle_link" data-toggle="collapse" data-target="#account_settings"> &nbsp;&nbsp;New user Creation</a>

				<div id="account_settings" class="collapse container">
				<!-- 
				
				--------------------------------------------------------------------------------
				Account settings form
				---------------------------------------------------------------------------------
				
				 -->
				  <form id="new_user_form" action="./InventoryBase" method="POST">
					<input type="hidden" name="task" value="new_user"/>
					 <div class="form-row">
    <div class="form-group col-md-3">
      <label for="category_id">कार्यालय नाम</label>
      <select  class="form-control" id="office_ref_user" name="office_ref"></select>
    </div>
    <div class="form-group col-md-3">
      <label for="service_name">कर्मचारी पुरा नाम</label>
      <input type="text" class="form-control" id="user_full_name"  name="user_full_name" placeholder=" कर्मचारीको पुरा नाम"/>
    </div>
     <div class="form-group col-md-3">
      <label for="category_id"> पद</label>
      <select  class="form-control" id="user_designation" name="user_designation"></select>
    </div>
    <div class="form-group col-md-3">
      <label for="inputPassword4">Username</label>
      <input type="text" class="form-control" id="service_fare" name="username" placeholder="username"/>
    </div>
  </div>
  <div class="form-row">
   
    <div class="form-group col-md-3">
      <label for="inputPassword4">Password</label>
      <input type="text" class="form-control" id="service_fare" name="password" placeholder="password"/>
    </div>
     <div class="form-group col-md-3">
      <label for="inputPassword4">Password</label>
      <input type="text" class="form-control" id="conf_password" name="conf_password" placeholder="confirm password"/>
    </div>
    
    <div class=" form-group col-md-1">
    <div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
     <button class="btn btn-danger" type="submit" class="form-control" >+</button>
   </div>
  </div>
  	
  </form>
  
 
								
				</div>
				<br>
				
		

				<div id="permission_settings" >
				<!-- 
				
				--------------------------------------------------------------------------------
				Account settings form
				---------------------------------------------------------------------------------
				
				 -->
				 <br>
		
				
						
								
				</div>
      
      
      
      
     	
    </div>
    <div id="summary" class="container tab-pane fade"><br>
     <h3>सारांश</h3>
     	
     	<div id="chart">
     	
     	<div class="chart-container" style="position: relative; height:30vh; width:30vw">
     	<canvas id="chartby_title" >
     	
     	</canvas>
     	
     	</div>
     	<div class="chart-container" style="position: absolute; left:40%; top:120px; height:30vh; width:30vw; float:left;">
     	
     	<canvas id="chartby_office" >
     	
     	</canvas>
     	</div>
     	
     	</div>
     
     <hr>
      <a href="#" class="fas fa-plus toggle_link" data-toggle="collapse" data-target="#summary_" style="display: block; float: none; width: 100%;"> &nbsp;&nbsp;संक्षिप्त</a>

				<div id="summary_" class="collapse">
				
					<!-- -----
					******************************************************************
					Summary table based on office
					*****************************************************************
					
					 -->
					<br>
					<div class="row">
					
					 <div class="col-6 col-md-6 col-lg-4">
                  <div class="card" style="height: 470px !important; width:350px !important;">

                     <div class="card-header">
    							आज
  					</div>
					
					
					
                    <div class="card-body" id="today_body">

                    </div>
                    
                                        <div class="card-footer text-muted"> जम्मा :&nbsp;<span id="today_total"></span></div>
                    

                  </div>
               </div>
               <div class="col-6 col-md-6 col-lg-4">
                  <div class="card" style="height: 470px !important; width:350px !important;">
					
						 <div class="card-header">
    						यो हप्ता
  						</div>
                    
				
                    <div class="card-body" id="thisweek_body">


                    </div>
                         <div class="card-footer"> जम्मा :&nbsp;<span id="week_total"></span></div>
                    

                  </div>
               </div>
               
               <div class="col-6 col-md-6 col-lg-4">
                  <div class="card" style="height: 470px !important; width:350px !important;">
					 <div class="card-header">
  							 यो महिना
  					</div>
                    
					
                    <div class="card-body" id="thismonth_body">

                      

                    </div>
                    
                    <div class="card-footer"> जम्मा :&nbsp;<span id="month_total"></span></div>

                  </div>
               </div>
					
					</div>
					
		
								
				</div>
				
				<br>
				
				 <a href="#" class="fas fa-plus toggle_link" data-toggle="collapse" data-target="#titlewise"> &nbsp;&nbsp;विषयगत</a>

				<div id="titlewise" class="collapse">
								
								<!-- -----
					******************************************************************
					Summary table based on title
					*****************************************************************
					
					 -->
					 
					 <table id="titlewise_deails_table" class="table table-sm">
 						 <thead class="thead-dark">
    						<tr >
   								  <th scope="col">#</th>
   								   <th scope="col">जम्मा रकम</th>
      							<th scope="col">Added on</th>
    						</tr>
  						</thead>
  						<tbody id="titlewise_deails_body">
  						</tbody>
  					</table>
								
				</div>
				<br><br>
				
      
    </div>
    
     <div id="settings" class="container tab-pane fade"><br>
      <h3>Settings</h3>
     	
     	<br>		
		<a href="#" class="fas fa-plus toggle_link" data-toggle="collapse" data-target="#office_settings"> &nbsp;&nbsp;कार्यालय सेटिङ्गस</a>

				<div id="office_settings" class="collapse">
				<br>
							<form id="office_settings_form" action="./InventoryBase" method="post">
					<input type="hidden" name="task" id="tsk" value="new_office"/>
  						<div class="form-row">
  						<label> कार्यालयको नाम</label>
   							 <div class="col-4">
     							 <input  type="text"  id=" office_name" name = "office_name" class="form-control" placeholder="कार्यालयको नाम"/>
   							 </div>
   							 
   							 
    						<div class="col-1">
      							<button class="btn btn-danger" type="submit" class="form-control" >+</button>
   							 </div>
  						</div>
					</form>
					
					<table id="office_table" class="table table-sm">
 						 <thead class="thead-dark">
    						<tr >
   								  <th scope="col">#</th>
   								   <th scope="col">कार्यालय नाम</th>
      							<th scope="col">Task</th>
      							<th scope="col">Status</th>
    						</tr>
  						</thead>
  						<tbody id="office_table_body">
  						</tbody>
  					</table>
					
					
				</div>
     	<br>
     	<a href="#" class="fas fa-plus toggle_link" data-toggle="collapse" data-target="#rasid_allocation"> &nbsp;&nbsp;रसिद बाँडफाँड</a>

				<div id="rasid_allocation" class="collapse">
				<br>
							<form id="rasid_allocation_form" action="./InventoryBase" method="post">
					<input type="hidden" name="task" id="tsk" value="new_rasid_allocation"/>
  						<div class="form-row">
  						<label> कार्यालय :</label>
   							 <div class="col-4">
     							 <select   id="office_ref" name = "office_ref" class="form-control"></select>
   							 </div>
   							 
   							 
   							 <label>Rasid Range</label>
   							 <div class="col-4">
     							 <input  type="text"  id=" rasid_range" name = "rasid_range" class="form-control" placeholder="Ex: 100-201"/>
   							 </div>
  							
   							 
    						<div class="col-1">
      							<button class="btn btn-danger" type="submit" class="form-control" >+</button>
   							 </div>
  						</div>
					</form>
					
					<br>
					<!-- 
							*************************************************************
							
							*************************************************************
					 -->
					 
					 <table id="rasid_table" class="table table-sm">
 						 <thead class="thead-dark">
    						<tr >
   								  <th scope="col">#</th>
   								   <th scope="col">कार्यालय नाम</th>
      							<th scope="col">Range</th>
      							<th scope="col">Current Bill No.</th>
      							<th scope="col">Task</th>
    						</tr>
  						</thead>
  						<tbody id="rasid_table_body">
  						</tbody>
  					</table>
					 
				</div>
     	
     	
     	
     	
     	
     	
     	
     	
     	
				<br>		
		<a href="#" class="fas fa-plus toggle_link" data-toggle="collapse" data-target="#server_settings"> &nbsp;&nbsp;Designation Settings</a>

				<div id="server_settings" class="collapse">
				<br>
							<form id="new_designation_form" action="./InventoryBase" method="post">
					<input type="hidden" name="task" id="tsk" value="new_designation"/>
  						<div class="form-row">
  						<label> Designation name</label>
   							 <div class="col-4">
     							 <input  type="text"  id=" designation_name" name = "designation_name" class="form-control" placeholder="Ex: राजश्व शाखा प्रमुख"/>
   							 </div>
  							
   							 
    						<div class="col-1">
      							<button class="btn btn-danger" type="submit" class="form-control" >+</button>
   							 </div>
  						</div>
					</form>
					<br>
					<table id="designation_table" class="table table-sm">
    							     
    							     <thead>
    									<tr>
   												  <th scope="col">#</th>
   								   				  <th scope="col">पद</th>
   								   				 <th scope="col">Created on</th>
      											<th scope="col">Status</th>
      											
      							
    								</tr>
  									</thead>
  									<tbody id="designation_table_body">
  									</tbody>
							
				   </table>
					
					
				</div>
				<br>
				
				 <a href="#" class=" fas fa-plus toggle_link" data-toggle="collapse" data-target="#fiscal_year_settings"> &nbsp;&nbsp;आर्थिक वर्ष सेटिङ्गस</a>

				<div id="fiscal_year_settings" class="collapse container">
				
					<!-- -----  
					
					
					
					
					
					 -->
					 <br>
					 
					 <form id="new_fiscal_year_form" action="./InventoryBase" method="post">
					<input type="hidden" name="task" id="tsk" value="new_fiscal_year"/>
  						<div class="form-row">
  						<label> आर्थिक वर्ष</label>
   							 <div class="col-3">
     							 <input  type="text"  id=" fiscal_year_new" name = "fiscal_year_new" class="form-control" placeholder="आर्थिक  वर्ष"/>
   							 </div>
  							
   							 
    						<div class="col-1">
      							<button class="btn btn-danger" type="submit" class="form-control" >+</button>
   							 </div>
  						</div>
					</form>
					
					<br>
					
					<table id="table_fiscalyear" class="table table-sm">
 						 <thead>
    						<tr>
   								  <th scope="col">#</th>
   								   <th scope="col">Fiscal Year</th>
   								   <th scope="col">Task</th>
      							<th scope="col">Status</th>
    						</tr>
  						</thead>
  						<tbody id="fiscalyear_table">
  						</tbody>
  					</table>
				
				
				
				
				
			
								
				</div>
				<br>
				
				<!--    Remote device Setup -->
				
				 <a href="#" class=" fas fa-plus toggle_link" data-toggle="collapse" data-target="#remote_devices"> &nbsp;&nbsp;Remote Devices</a>

				<div id="remote_devices" class="collapse container">
				
				
				<br>
					 
					 <form id="remote_device_form" action="./InventoryBase" method="post">
					<input type="hidden" name="task" id="tsk" value="new_device"/>
  						<div class="form-row">
  						<label> Device Address</label>
   							 <div class="col-3">
     							 <input  type="text"  id=" remote_device_address" name = "remote_device_address" class="form-control" placeholder="Url or IP Address"/>
   							 </div>
  							
   							 
    						<div class="col-1">
      							<button class="btn btn-danger" type="submit" class="form-control" >+</button>
   							 </div>
  						</div>
					</form>
				
				</div>
				
     	
    </div>
    
  </div>
</div>

</body>
<script>
let service_id = new Set();
var _amount = [];
var total_amount = 0;

/**
 
 * 
 --------------------------------------
 Calendar component initialization
 --------------------------------------
 
 */
 
 
 var currentDate = new Date();
// var currentNepaliDate = currentDate.getFullYear(), currentDate.getMonth() + 1, currentDate.getDate());

var d = AD2BS(currentDate.getFullYear()+"-"+parseInt(currentDate.getMonth()+1)+"-"+currentDate.getDate());
$("#date_hidden").val(d);
var e = d.split("-");
$("#fromDateD").val(d);
$("#toDateD").val(d)

/**
 * 
 ---------------------------------------
 Event Handling
 ---------------------------------------
 
 */
 
 $('#fromDateD').nepaliDatePicker({
	 		npdMonth: true,
			npdYear: true,
			npdYearCount: 10,
	 		onChange: function(){
			var searchForm = $("#search_form");
			$("#date_picker_from_en").val(BS2AD($('#fromDateD').val()));
			performSearch(searchForm);
		}
	});
	
	
 $('#toDateD').nepaliDatePicker({
	 		npdMonth: true,
			npdYear: true,
			npdYearCount: 10,
	 		onChange: function(){
			 var searchForm = $("#search_form");
			$("#date_picker_to_en").val(BS2AD($('#toDateD').val()));
			performSearch(searchForm);
		}
	});

 
 
 
$("#customer_name").keyup(function(e){
	
	$("#client_name").text($(this).val());
});
$("#_customer_address").change(function(e){
	
	$("#client_address").text($(this).find(":selected").text());
});


$("#export_report").click(function(){
	//$("#rasid_table tr").find('th:last-child, td:last-child').remove();
	$('#report_table').printThis({
	    importCSS: false,
	    loadCSS:'',
	    importStyle:true
	    
	});
	
	
});

$(document).ready(function(){
	
	
	$("#trans_date").text(convertToNepaliDigit(e[0])+"-"+convertToNepaliDigit(e[1])+"-"+convertToNepaliDigit(e[2]));
	
	

	loadFYDropdown("./InventoryBase", "active_fy", "fiscal_year");
	loadAdressDropdown("./InventoryBase", "adress_ref", "_customer_address");
	
	loadRevTitleDropdown("./InventoryBase","active_rev_title","revenue_title_ref_drop");
	/** rasid list **/
	listRecs("./InventoryBase","office_based_list", "bill_table_body");

	
	
	
	$("#service_category_form").submit(function(e){
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
			    
			    var msg = response.status;
			    if(msg == "success"){
			    	
			    	
			    	
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
	
	
	/**
	*
	*
	*
	*   Remote Device Setup
	*
	*
	**/
	
	
	$("#remote_device_form").submit(function(e){
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
			    
			    var msg = response.status;
			    if(msg == "success"){
			    	
			    	
			    	
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
	
	
	
	
	
	
	
	
	
	/**
	*
	*
	*  New Office creation form.
	*
	*/
	
	$("#new_office_form").submit(function(e){
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
			    
			    var msg = response.status;
			    if(msg == "success"){
			    	
			    	
			    	loadTable(_url,"office_all","office_table_body");
			    	
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
	
	/**
	*
	* Rasid Allocation form submit
	*/
	
	$("#rasid_allocation_form").submit(function(e){
		//e.preventDefault(); // avoid to execute the actual submit of the form.
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
			    
			    var msg = response.status;
			    if(msg == "success"){
			    	
			    	$("#main_title_status").addClass("alert alert-primary");
			    	$("#main_title_status").text("data added successfully!!");
			    	$("#main_title_status").fadeOut("slow");
			 	   loadRasidAllocation("./InventoryBase","rasid_allocation","rasid_table_body");
			    	
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
	
	

/**
*
**
*  New user creation form.
*
**/
	
	
$("#new_user_form").submit(function(e){
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
		    	
		    	 loadUsers("./InventoryBase","getusers","permission_settings");
		    	
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
	
//office_settings_form	

$("#office_settings_form").submit(function(e){
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
		    
		    var msg = response.status;
		    if(msg == "success"){
		    	
		    	loadOrganizatonTable(_url,"office_all","office_table_body");
		    	
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


	
//Rasid Allocation form.



$("#rasid_allocation_form").submit(function(e){
	
	
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
		    
		    var msg = response.status;
		    if(msg == "success"){
		    	
		    	console.log(response);
		    	//refreshTable(_url,"maintitle","revenue_main_title_table");
		    	//loadRevTable(_url,"revenue_titles","revenue_title_table");
		    	
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
	
	
	
	
	
	
	$("#new_revenue_title_form").submit(function(e){
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
			    
			    var msg = response.status;
			    if(msg == "success"){
			    	
			    	console.log(response);
			    	//refreshTable(_url,"maintitle","revenue_main_title_table");
			    	loadRevTable(_url,"revenue_titles","revenue_title_table");
			    	
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
	
	

});



$("#process_to_bill").click(function(e){
	
	/**
	rev_ref_hidden
	var service_name = [];
    var _amount = [];
	
	**/
	var service = $("#revenue_title_ref_drop").find(":checked").text();
	var s_id = $("#revenue_title_ref_drop").find(":checked").val();
	
	
	var amount = $("#revenue_title_ref_drop").find(":checked").data('amount');	
	service_id.add(s_id);
	
	   _amount.push(amount);
	   total_amount = 0;
	   $.each( _amount, function( key, value ) {
		   total_amount = total_amount+value;
		 })
		 
	//console.log(total_amount);  current_id -> stores all revenue idz as id1,id2,id3 ..
	
	$("#total_amount_hidden").val(total_amount);
	var row_id = 'div_'+s_id;
	$("#bill_body").append('<div class="bill_row" id="'+row_id+'"><span class="revenue_title">'+service+'</span><span class="revenue_amt">'+convertToNepaliDigit(amount)+'</span><span class="remove_this fas fa-times-circle" data-row_id="'+row_id+'" data-item_amount="'+amount+'" data-item_id="'+s_id+'"></span></div><br>');
	$("#rev_amount_total").text(convertToNepaliDigit(total_amount));
	
	var dat = $("#rev_ref_hidden").val();
	
	if(dat == ''){
		$("#rev_ref_hidden").val(s_id);
	}else {
		$("#rev_ref_hidden").val(dat+","+s_id);
	}
	
	 
	// console.log(total_amount);
   
	
});


$("#new_fiscal_year_form").submit(function(e){
	
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
	          
	          var msg = response.status;
	          if(msg == "success"){
	            
	            console.log(response);
	            //refreshTable(_url,"maintitle","revenue_main_title_table");
	            loadFiscalYearTable(_url,"load_fiscal_year","fiscalyear_table");
	            
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

$("#new_designation_form").submit(function(e){
	
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
	          
	          var msg = response.status;
	          if(msg == "success"){
	            
	            console.log(response);
	            //refreshTable(_url,"maintitle","revenue_main_title_table");
	            loadDesignationTable(_url,"designation_all","designation_table_body");
	            
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







function loadTable(path, required, target){
	
	
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required},
		  success: function(response) {
		    
			  //console.log(response);
			
		    	$('#'+target).empty()
		    	for(var i = 0; i<response.length ; i++){
		    		
		    		var toggle_btn = '<label class="switch ">'+
					 ' <input type="checkbox" class="main_title_toggle" checked value="'+response[i].rec_id+'" onchange="toggleRevenueMainTitle(this)">'+
				  '<span class="slider round"></span>'+
				'</label>';
		    		if(response[i].isactive ==0){
		    			var toggle_btn = '<label class="switch ">'+
						 ' <input type="checkbox" class="main_title_toggle"  value="'+response[i].rec_id+'" onchange="toggleRevenueMainTitle(this)">'+
					  '<span class="slider round"></span>'+
					'</label>';
		    		} 		    		  
		    		
		    		var new_row = '<tr><td>'+response[i].rec_id+'</td><td>'+response[i].main_title+'</td><td><a class="fas fa-edit" href="#"></a></td><td>'+toggle_btn+'</td></tr>';
		    		$("#"+target).append(new_row);
		    		
		    	}
		    	
		    	$("#table_revenue_maintable").DataTable();
		    	
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
	
}

function listRecs(path, required, target){
	
	var org_ref = $("#office_ref").val();
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required, 'org':org_ref},
		  success: function(response) {
		    
			 // console.log(response);
			
		    	$('#'+target).empty()
		    	for(var i = 0; i<response.length ; i++){
		    		
		    		var new_row = '<tr><td>'+response[i].bill_no+'</td><td>'+response[i].customer_name+'</td><td>'+response[i]._address+'</td><td>'+response[i].service_name+'</td><td>'+response[i].service_charge+'</td><td>'+AD2BS(response[i].date)+'</td><td>'+"<a  id='update_bill' class=' fa fa-edit' href='#' data-toggle='modal' data-target='#updatebill' data-ref='"+JSON.stringify(response[i])+"'></a>"+'</td></tr>';
		    		$("#"+target).append(new_row);
		    		
		    	}
		    	
		    	$("#rasid_table").dataTable();
		    	
		    	
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
	
}




function loadOrganizatonTable(path, required, target){
	
	
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required},
		  success: function(response) {
		    
			  //console.log(response);
			
		    	$('#'+target).empty()
		    	for(var i = 0; i<response.length ; i++){
		    		
		    		var toggle_btn = '<label class="switch ">'+
					 ' <input type="checkbox" class="main_title_toggle" checked value="'+response[i].rec_id+'" onchange="toggleOrganization(this)">'+
				  '<span class="slider round"></span>'+
				'</label>';
		    		if(response[i].isactive ==0){
		    			var toggle_btn = '<label class="switch ">'+
						 ' <input type="checkbox" class="main_title_toggle"  value="'+response[i].rec_id+'" onchange="toggleOrganization(this)">'+
					  '<span class="slider round"></span>'+
					'</label>';
		    		} 		    		  
		    		
		    		var new_row = '<tr><td>'+response[i].rec_id+'</td><td>'+response[i].organization_name+'</td><td><a class="fas fa-edit" href="#"></a></td><td>'+toggle_btn+'</td></tr>';
		    		$("#"+target).append(new_row);
		    		
		    	}
		    	
		    	$("#office_table").DataTable();
		    	
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
	
} 


function loadOrganizatonDropDown(path, required, target){
	
	
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required},
		  success: function(response) {
		    
			  //console.log(response);
			
		    	$('#'+target).empty()
		    	for(var i = 0; i<response.length ; i++){
		    		
		    		$('#'+target).empty();
			    	
			    	for(var i = 0; i<response.length ; i++){
			    		$('#'+target).append($('<option>',
			    			     {
			    			        value: response[i].rec_id,
			    			        text : response[i].organization_name
			    			    }));
			    		
			    	}
			    	
		    		
		    	}
		    	
		    	
		    	
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
	
} 






function loadDesignationTable(path, required, target){
	
	
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required},
		  success: function(response) {
		    
			 // console.log(response);
			
		    	$('#'+target).empty()
		    	for(var i = 0; i<response.length ; i++){
		    		
		    		var toggle_btn = '<label class="switch ">'+
					 ' <input type="checkbox" class="main_title_toggle" checked value="'+response[i].rec_id+'" onchange="toggleDesignation(this)">'+
				  '<span class="slider round"></span>'+
				'</label>';
		    		if(response[i].isactive ==0){
		    			var toggle_btn = '<label class="switch ">'+
						 ' <input type="checkbox" class="main_title_toggle"  value="'+response[i].rec_id+'" onchange="toggleDesignation(this)">'+
					  '<span class="slider round"></span>'+
					'</label>';
		    		} 		    		  
		    		
		    		var new_row = '<tr><td>'+response[i].rec_id+'</td><td>'+response[i].designation_np+'</td><td><a class="fas fa-edit" href="#"></a></td><td>'+toggle_btn+'</td></tr>';
		    		$("#"+target).append(new_row);
		    		
		    	}
		    	
		    	$("#table_revenue_maintable").DataTable();
		    	
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
	
} 


function loadDesignationDropDown(path, required, target){
	
	
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required},
		  success: function(response) {
		    
			//  console.log(response);
			
		    	$('#'+target).empty()
		    	for(var i = 0; i<response.length ; i++){
		    		
		    		$('#'+target).append($('<option>',
		    			     {
		    			        value: response[i].rec_id,
		    			        text : response[i].designation_np
		    			    }));
		    		
		    	}
		    	
		    	
		    	
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
	
} 





function summaryByTitle(path, required, target){
	
	
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required},
		  success: function(response) {
		    
			//  console.log(response);
				generateChart("chartby_title",response);
		    	$('#'+target).empty()
		    	for(var i = 0; i<response.length ; i++){
		    		    		  
		    		
		    		var new_row = '<tr><td>'+response[i].service_name+'</td><td>'+convertToNepaliDigit(parseInt(response[i].amt))+'</td><td></td></tr>';
		    		$("#"+target).append(new_row);
		    		
		    	}
		    	
		    	$("#titlewise_deails_table").DataTable();
		    	
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
	
}


function summaryByOffice(path, required, target){
	
		var filter = required;
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required,'date':d},
		  success: function(response) {
		    
			 
			if(filter == 'officewise_summary'){
				generateChart("chartby_office",response)
			}
		    	$('#'+target).empty()
		    	for(var i = 0; i<response.length ; i++){
		    		
		    			    		  
		    		
		    		var new_row = '<tr><td>'+response[i].organization_name+'</td><td>'+response[i].amt+'</td><td></td></tr>';
		    	//	$("#"+target).append(new_row);
		    		
		    	}
		    	
		    	//$("#officewise_deails_table").DataTable();
		    	
		    	
		    	if(filter == 'officewise_summary_today'){
		    		
		    		var total = 0
		    		var list = $('<ul/>').appendTo('#today_body');
		    		
					for (var i = 0; i < response.length; i++) {
	    		
						list.append('<li>'+response[i].organization_name+":"+convertToNepaliDigit(response[i].amt)+'</li>');
	    					total = total +parseInt(response[i].amt);
	   					 
							}
					
					$("#today_total").text(convertToNepaliDigit(total)+"/- "+convertToLetters(total));
		    		
		    		
		    	}else if(filter == 'officewise_summary_thisweek'){
		    		
		    		
		    		var list = $('<ul/>').appendTo('#thisweek_body');
		    		var total = 0;
		    		
				for (var i = 0; i < response.length; i++) {
    		
					list.append('<li>'+response[i].organization_name+":"+convertToNepaliDigit(response[i].amt)+'</li>');
    					total = total+parseInt(response[i].amt);
   					 
						}
				$("#week_total").text(convertToNepaliDigit(total)+"/- "+convertToLetters(total));
		    		
		    	}else if(filter == 'officewise_summary_thismonth'){
		    		
		    		var list = $('<ul/>').appendTo('#thismonth_body');
		    		var total = 0;
		    		
					for (var i = 0; i < response.length; i++) {
	    		
						list.append('<li>'+response[i].organization_name+":"+convertToNepaliDigit(response[i].amt)+'</li>');
	    					total = total+parseInt(response[i].amt);
	   					 
							}
					
					$("#month_total").text(convertToNepaliDigit(total)+"/- "+convertToLetters(total));
		    		
		    		
		    	}
		    	
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
	
}




function loadRevTable(path, required, target){
	
	
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required},
		  success: function(response) {
		    
			  //console.log(response);
			
		    	$('#'+target).empty()
		    	for(var i = 0; i<response.length ; i++){
		    		
		    		//console.log(response[i].service_charge);
		    		var toggle_btn = '<label class="switch ">'+
					 ' <input type="checkbox" class="main_title_toggle" checked value="'+response[i].rec_id+'" onchange="toggleRevenueTitle(this)">'+
				  '<span class="slider round"></span>'+
				'</label>';
		    		if(response[i].isactive ==0){
		    			var toggle_btn = '<label class="switch ">'+
						 ' <input type="checkbox" class="main_title_toggle"  value="'+response[i].rec_id+'" onchange="toggleRevenueTitle(this)">'+
					  '<span class="slider round"></span>'+
					'</label>';
		    		} 		    		  
		    		
		    		var new_row = '<tr><td>'+response[i].rec_id+'</td><td>'+response[i].year+'</td><td>'+response[i].organization_name+'</td><td>'+response[i].service_name+'</td><td>'+response[i].service_charge+'</td><td><a class="fas fa-edit" href="#"></a></td><td>'+toggle_btn+'</td></tr>';
		    		$("#"+target).append(new_row);
		    		
		    	}
		    	
		    	$("#table_revenue_title").DataTable();
		    	
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
	
}

function loadFiscalYearTable(path, required, target){
	
	
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required},
		  success: function(response) {
		    
			  //console.log(response);
			
		    	$('#'+target).empty()
		    	for(var i = 0; i<response.length ; i++){
		    		
		    		//console.log(response[i].service_charge);
		    		var toggle_btn = '<label class="switch ">'+
					 ' <input type="checkbox" class="main_title_toggle" checked value="'+response[i].rec_id+'" onchange="toggleFiscalYear(this)">'+
				  '<span class="slider round"></span>'+
				'</label>';
		    		if(response[i].isactive ==0){
		    			var toggle_btn = '<label class="switch ">'+
						 ' <input type="checkbox" class="main_title_toggle"  value="'+response[i].rec_id+'" onchange="toggleFiscalYear(this)">'+
					  '<span class="slider round"></span>'+
					'</label>';
		    		} 		    		  
		    		
		    		//var new_row = '<tr><td>'+response[i].rec_id+'</td><td>'+response[i].year+'</td><td>'+response[i].organization_name+'</td><td>'+response[i].service_name+'</td><td>'+response[i].service_charge+'</td><td><a class="fas fa-edit" href="#"></a></td><td>'+toggle_btn+'</td></tr>';
		    		var new_row = '<tr><td>'+response[i].rec_id+'</td><td>'+response[i].year+'</td><td><a class="fas fa-edit" href="#"></a></td><td>'+toggle_btn+'</td></tr>';

		    		$("#"+target).append(new_row);
		    		
		    	}
		    	
		    	$("#table_revenue_title").DataTable();
		    	
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
	
}


function loadRasidAllocation(path, required, target){
	
	
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required},
		  success: function(response) {
		    
			  //console.log(response);
			
		    	$('#'+target).empty()
		    	for(var i = 0; i<response.length ; i++){
		    		
		    		
		    		var toggle_btn = '<label class="switch ">'+
					 ' <input type="checkbox" class="main_title_toggle" checked value="'+response[i].rec_id+'" onchange="toggleRasid(this)">'+
				  '<span class="slider round"></span>'+
				'</label>';
		    		if(response[i].isactive ==0){
		    			var toggle_btn = '<label class="switch ">'+
						 ' <input type="checkbox" class="main_title_toggle"  value="'+response[i].rec_id+'" onchange="toggleRasid(this)">'+
					  '<span class="slider round"></span>'+
					'</label>';
		    		} 		    		  
		    		
		    		//var new_row = '<tr><td>'+response[i].rec_id+'</td><td>'+response[i].year+'</td><td>'+response[i].organization_name+'</td><td>'+response[i].service_name+'</td><td>'+response[i].service_charge+'</td><td><a class="fas fa-edit" href="#"></a></td><td>'+toggle_btn+'</td></tr>';
		    		var new_row = '<tr><td>'+response[i].rec_id+'</td><td>'+response[i].organization_name+'</td> <td>'+response[i].start_val+"-"+response[i].ceil_val+'</td><td>'+response[i].current_val+'</td><td>'+toggle_btn+'</td></tr>';

		    		$("#"+target).append(new_row);
		    		
		    	}
		    	
		    	$("#rasid_table").DataTable();
		    	
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
	
}




function loadUsers(path, required, target){
	
	
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required},
		  success: function(response) {
		    
			  //console.log(response);
			
		    	$('#'+target).empty();
		    	$('#'+target).append("<br><br>");
		    	for(var i = 0; i<response.length ; i++){
		    		
		    		//console.log(response[i].service_charge);
		    		var toggle_active = '<label class="switch ">'+
					 ' <input type="checkbox" class="toggle_user" checked value="'+response[i].user_name+'" onchange="toggleUser(this)">'+
				  '<span class="slider round"></span>'+
				'</label>';
		    		if(response[i].isactive ==0){
		    			var toggle_active = '<label class="switch ">'+
						 ' <input type="checkbox" class="toggle_user"  value="'+response[i].user_name+'" onchange="toggleUser(this)">'+
					  '<span class="slider round"></span>'+
					'</label>';
		    		} 
		    		
		    		
		    		var card = '<div class="card">'+
		    			 '<div class="card-item"> <img src="user.png" alt="Avatar" height="60" width="60" /></div>'+
		    		  '<div class="container ">'+
		    		   ' <h4><b>'+response[i].full_name+'</b>&nbsp;&nbsp;&nbsp;<sub>'+response[i].organization_name+'</sub></h4> '+'<b>is Active :</b> '+toggle_active+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>is Super user :</b> '+toggle_active+
		    		    '<p class="info_text"><i>Created on: </i>'+response[i].created_on+' <i>&nbsp;&nbsp;Created By: </i>'+response[i].created_by+'</p>'+
		    		  '</div>'+
		    		'</div><br>'
		    		
		    	$("#"+target).append(card);
		    		
		    		
		    	}
		    	
		    	
		    	
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
	
}


function loadUsersDropDown(path, required, target){
	
	
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required},
		 success: function(response) {
		    
			  //console.log(response);
			
		    	$('#'+target).empty();
		    	
		    	for(var i = 0; i<response.length ; i++){
		    		$('#'+target).append($('<option>',
		    			     {
		    			        value: response[i].rec_id,
		    			        text : response[i].full_name
		    			    }));
		    		
		    		
		    	}
		    	
		    	
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
	
}





function toggleRevenueMainTitle( e ){
	var id = e.getAttribute("value");
	var _task = "ed_main_title";
	var _enabled = true;
	if(!e.checked){
		_enabled = false;
	}
	
//	console.log(_enabled);
	$.ajax({
		  url:"./InventoryBase",
		  type: "POST", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: { "task": _task, "rec_id": id, "enabled" : _enabled },
		  success: function(response) {
		    console.log(response);
		    var msg = response.status;
		    if(msg == "success"){
		    
		    	loadDropdown("./InventoryBase", "active_main_title", "main_title_ref");

		    	
		    }else if( msg == "fail"){
		    	
		    }else {
		    	
		    }
		    
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
}

function toggleRevenueTitle( e ){
	

	var id = e.getAttribute("value");
	var _task = "ed_title"
	var _enabled = true;
	if(!e.checked){
		_enabled = false;
	}
	$.ajax({
		  url:"./InventoryBase",
		  type: "POST", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: { "task": _task, "rec_id": id, "enabled" : _enabled },
		  success: function(response) {
		    console.log(response);
		    var msg = response.status;
		    if(msg == "success"){
		    



		    	
		    }else if( msg == "fail"){
		    	
		    }else {
		    	
		    }
		    
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
}


/**
 * 
 Function to toggle  organization
 */

function toggleOrganization( e ){
	

	var id = e.getAttribute("value");
	var _task = "ed_organization"
	var _enabled = true;
	if(!e.checked){
		_enabled = false;
	}
	$.ajax({
		  url:"./InventoryBase",
		  type: "POST", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: { "task": _task, "rec_id": id, "enabled" : _enabled },
		  success: function(response) {
		    console.log(response);
		    var msg = response.status;
		    if(msg == "success"){
		    



		    	
		    }else if( msg == "fail"){
		    	
		    }else {
		    	
		    }
		    
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
}


/**
 * 
 *	Function to toggle rasid Allocation.
 */

function toggleRasidAllocation( e ){
	

	var id = e.getAttribute("value");
	var _task = "ed_rasid"
	var _enabled = true;
	if(!e.checked){
		_enabled = false;
	}
	$.ajax({
		  url:"./InventoryBase",
		  type: "POST", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: { "task": _task, "rec_id": id, "enabled" : _enabled },
		  success: function(response) {
		    var msg = response.status;
		    if(msg == "success"){
		    



		    	
		    }else if( msg == "fail"){
		    	
		    }else {
		    	
		    }
		    
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
}




/**
 * 
 *	function to toggle fiscal year.
 */


function toggleFiscalYear( e ){
	

	var id = e.getAttribute("value");
	var _task = "ed_fy"
	var _enabled = true;
	if(!e.checked){
		_enabled = false;
	}
	$.ajax({
		  url:"./InventoryBase",
		  type: "POST", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: { "task": _task, "rec_id": id, "enabled" : _enabled },
		  success: function(response) {
		    console.log(response);
		    var msg = response.status;
		    if(msg == "success"){
		    



		    	
		    }else if( msg == "fail"){
		    	
		    }else {
		    	
		    }
		    
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
}

/**
 * 
 		toggle office
 
 */
 
 
 function toggleOrganization( e ){
		

		var id = e.getAttribute("value");
		var _task = "ed_org"
		var _enabled = true;
		if(!e.checked){
			_enabled = false;
		}
		$.ajax({
			  url:"./InventoryBase",
			  type: "POST", //send it through get method
			  dataType: 'json',
			  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			  data: { "task": _task, "rec_id": id, "enabled" : _enabled },
			  success: function(response) {
			    console.log(response);
			    var msg = response.status;
			    if(msg == "success"){
			    



			    	
			    }else if( msg == "fail"){
			    	
			    }else {
			    	
			    }
			    
			  },
			  error: function(xhr) {
			    //Do Something to handle error
			    console.log(xhr);
			  }
			});
	}
/**
 * 
 *	Toggle user.
 */

 
 function toggleUser( e ){
		

		var id = e.getAttribute("value");
		var _task = "ed_user"
		var _enabled = true;
		if(!e.checked){
			_enabled = false;
		}
		$.ajax({
			  url:"./InventoryBase",
			  type: "POST", //send it through get method
			  dataType: 'json',
			  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			  data: { "task": _task, "rec_id": id, "enabled" : _enabled },
			  success: function(response) {
			    console.log(response);
			    var msg = response.status;
			    if(msg == "success"){
			    



			    	
			    }else if( msg == "fail"){
			    	
			    }else {
			    	
			    }
			    
			  },
			  error: function(xhr) {
			    //Do Something to handle error
			    console.log(xhr);
			  }
			});
	}

 
 
 
 
 
 
/**
 * 
 * Toggle Designation
 *
 *
 */
 
 function toggleDesignation( e ){
		

		var id = e.getAttribute("value");
		var _task = "ed_designation"
		var _enabled = true;
		if(!e.checked){
			_enabled = false;
		}
		$.ajax({
			  url:"./InventoryBase",
			  type: "POST", //send it through get method
			  dataType: 'json',
			  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			  data: { "task": _task, "rec_id": id, "enabled" : _enabled },
			  success: function(response) {
			    console.log(response);
			    var msg = response.status;
			    if(msg == "success"){
			   
			    	
			    }else if( msg == "fail"){
			    	
			    }else {
			    	
			    }
			    
			  },
			  error: function(xhr) {
			    //Do Something to handle error
			    console.log(xhr);
			  }
			});
	}










function loadDropdown(path, required, target){
	
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required},
		  success: function(response) {
		    	
			  $("#"+target).empty();
			  //console.log(response);
		    	for(var i = 0; i<response.length ; i++){
		    		$('#'+target).append($('<option>',
		    			     {
		    			        value: response[i].rec_id,
		    			        text : response[i].main_title
		    			    }));
		    		
		    	}
		    	
		    	
		    
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
}

function loadAdressDropdown(path, required, target){
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required},
		  success: function(response) {
		    	
			  $("#"+target).empty();
	    		var opt1 = '<option value=""> --Choose One--</option>'
	    			$('#'+target).append(opt1);
		    	for(var i = 0; i<response.length ; i++){
		    		
		    		var opt = '<option value="'+response[i].rec_id+'">'+response[i]._address+'</option>'
		    		
		    		 $('#'+target).append(opt);
		    	}
		    	
		    	
		    
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
}

function loadRevTitleDropdown(path, required, target){
	
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required},
		  success: function(response) {
		    	
			  $("#"+target).empty();
			  //console.log(response);
		    	for(var i = 0; i<response.length ; i++){
		    		
		    		var opt = '<option value="'+response[i].rec_id+'" data-amount="'+response[i].service_charge+'">'+response[i].service_name+'</option>'
		    		
		    	
		    			    $('#'+target).append(opt);
		    		
		    	}
		    	
		    	
		    
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
}

function loadFYDropdown(path, required, target){
	
	 $.ajax({
		  url:path,
		  type: "GET", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {'required':required},
		  success: function(response) {
		    	console.log(response);
			  $("#"+target).empty();
			  //console.log(response);
		    	for(var i = 0; i<response.length ; i++){
		    		$('#'+target).append($('<option>',
		    			     {
		    			        value: response[i].rec_id,
		    			        text : response[i].year
		    			    }));
		    		
		    	}
		    	
		    	
		    
		  },
		  error: function(xhr) {
		    //Do Something to handle error
		    console.log(xhr);
		  }
		});
	
	
}

/**
 *   -set final values to be set 
 		- submit form.
 		
 		
 		
 		
 		--------------------------------------------------------------------------------------------------
 		--------------------------------------------------------------------------------------------------
 
 */

 
 
 
$("#revenue_bill_form").submit(function(e){
	
	e.preventDefault(); // avoid to execute the actual submit of the form.
	
    var form = $(this);
    var _url = form.attr('action');
    $.ajax({
		  url:_url,
		  type: "POST", //send it through get method
		  dataType: 'json',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: form.serialize(),
		  success: function(response) {
			  var elem = $("#bill_status_message");
		    var msg = response.status;
		    if(msg == "success"){
		    	
		    	$("#current_rasid").val(response.new_bill);
		    	
		    	elem.addClass("alert-success");
		    	elem.text("डाटा सुरक्षित गरियो ।");
		    	
		    	window.print();
		    	 elem.fadeOut( "slow", function() {
		    		    // Animation complete.
		    		 elem.empty();
		    		  });
		    	
		    	
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

$("#search_form").submit(function(e){
	
	
	//date_picker_from_en "%y-%m-%d"
	
	e.preventDefault();
	performSearch($(this));
	
});


$(".nav-item a").click(function(){
  var tab_ref = $(this).attr("href");
   if(tab_ref == "#service_charge"){
	   
	    loadTable("./InventoryBase", "maintitle", "revenue_main_title_table");
		loadRevTable("./InventoryBase","revenue_titles","revenue_title_table");
		
		loadDropdown("./InventoryBase", "active_main_title", "main_title_ref");
		loadFYDropdown("./InventoryBase", "active_fy", "fiscal_year_");

	   
   }else if(tab_ref == "#reports"){
	   
	   loadUsersDropDown("./InventoryBase","getusers","rec_by_user_name");
	   
	   
   }else if(tab_ref == "#staffs"){
	   
	   loadUsers("./InventoryBase","getusers","permission_settings");
	   loadDesignationDropDown("./InventoryBase","designation_all","user_designation");
	   loadOrganizatonDropDown("./InventoryBase","office_all", "office_ref_user");

	   
   }else if(tab_ref == "#summary"){
	   //officewise_summary
	   summaryByTitle("./InventoryBase", "titlewise_summary", "titlewise_deails_body");
	   summaryByOffice("./InventoryBase", "officewise_summary", "officewise_deails_body");
	   summaryByOffice("./InventoryBase", "officewise_summary_today", "today_body");
	   summaryByOffice("./InventoryBase", "officewise_summary_thisweek", "thisweek_body");
	   summaryByOffice("./InventoryBase", "officewise_summary_thismonth", "thismonth_body");
	   
	   
   }else if(tab_ref == "#settings"){
	   
	   loadFiscalYearTable("./InventoryBase","load_fiscal_year","fiscalyear_table");
	   loadOrganizatonTable("./InventoryBase","office_all","office_table_body");
	   loadRasidAllocation("./InventoryBase","rasid_allocation","rasid_table_body");
	   //new_designation_form /designation_table  --office_ref
	   loadDesignationTable("./InventoryBase","designation_all","designation_table_body");

	   loadOrganizatonDropDown("./InventoryBase","office_all","office_ref");
	   
   }
  
  });
 
 $(document).on('click','.remove_this',function(e){
    // code here
    
	 var ref_string ="";
	    $("#rev_ref_hidden").val(ref_string);
	    var view_id = $(this).data("row_id");
	    var amount = $(this).data("item_amount");
	    var item_id = $(this).data("item_id");
	    service_id.delete(String(item_id));
	    for (var it = service_id.values(), val= null; val=it.next().value; ) {

	         if(ref_string == ''){
	            
	            ref_string = ref_string+val;
	         }else {
	            ref_string = ref_string+","+val;
	         }
	    }
	    
	    var new_amount = convertToEnglishDigit($("#rev_amount_total").text()) -amount;
	    $("#rev_ref_hidden").val(ref_string);
	    $("#rev_amount_total").text((new_amount));
	 	console.log(new_amount);
	   	$("#"+view_id).remove();
   
    
});
 
 let search_field_set = new Set();
 
 
 /**
 			Build base for searching.
 			date_picker_from_en
 */
 
 $("#rec_by_user_name").add('#fromDateD').add('#toDateD').click(function(e){
	
	 var search_field = $(this).attr('id');
	 var search_string = "";
	 search_field_set.add(search_field);
	 var searchForm = $("#search_form")
	 
	 for (let item of search_field_set){
		 
		 if(search_string ==''){
			 search_string = item;
		 }else {
			 search_string = search_string+","+item;
		 }
	 }
		$("#date_picker_from_en").val(BS2AD($('#fromDateD').val()));
		$("#date_picker_to_en").val(BS2AD($('#toDateD').val()));
	 $("#search_string_hidden").val(search_string);
	// $("#rec_by_user_name_hidden").val();// heree
	 console.log($("#rec_by_user_name").val());
	 //date_picker_from_en
	 
	// performSearch(searchForm);
 });
 

 function performSearch(_form){
	 
	 	
	    var _url = _form.attr('action');
	 	
	    $.ajax({
			  url:_url,
			  type: "POST", //send it through get method
			  dataType: 'json',
			  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			  data: _form.serialize(),
			  success: function(response) {
			  
				  //report_table_body;
				  console.log(response);
				  $('#report_table_body').empty()
				  var total = 0;
			    	for(var i = 0; i<response.length ; i++){
			    		
			    			    		  /*
			    			    		    <th scope="col">#</th>
   								   				  <th scope="col">सेवा ग्राही</th>
   								   				 <th scope="col">ठेगाना</th>
      											<th scope="col">शिर्षक</th>
      											 <th scope="col">दर</th>
      							  				<th scope="col">प्रयोगकर्ता</th>
      											 <th scope="col">TimeStamp</th>
			    			    		  */
			    		total = total+parseInt(response[i].service_charge);
			    		var new_row = '<tr><td>'+convertToNepaliDigit(response[i].rec_id)+'</td><td>'+response[i].customer_name+'</td><td>'+response[i]._address+
			    		'</td><td>'+response[i].service_name+'</td><td>'+convertToNepaliDigit(response[i].service_charge)+'</td><td>'+response[i].user_name+
			    		'</td><td>'+response[i].time_stamp+'</td></tr>';
			    		$("#report_table_body").append(new_row);
			    		
			    	}
			    	
			    	var fromtmp = $("#fromDateD").val().split("-");
			    	var totmp = $("#toDateD").val().split("-");
				  var summary_row = '<tr><td><b>जम्मा :</b></td><td></td><td></td><td></td><td>'+convertToNepaliDigit(total)+'/-</td><td>'+
		    		'</td><td>'+convertToNepaliDigit(fromtmp[0])+'-'+convertToNepaliDigit(fromtmp[1])+'-'+convertToNepaliDigit(fromtmp[2])+' देखी  '+convertToNepaliDigit(totmp[0])+'-'+convertToNepaliDigit(totmp[1])+'-'+convertToNepaliDigit(totmp[2])+' सम्म </td></tr>';
		    		$("#report_table_footer").empty();
		    		$("#report_table_footer").append(summary_row);
				  
			    	$("#report_table").DataTable();
				  
			  },
			  error: function(xhr) {
			    //Do Something to handle error
			    console.log(xhr);
			  }
			});
	 
 }
 

 $(".toggle_link").click(function(e){
	 
	 // fa-close
	vid =  $(this).data("target");
	
	vid = vid.replace("#",'');
	$('#'+vid).on('shown.bs.collapse', function () {
		
	//	$(e.target).removeClass('fa-plus').addClass('fa-close');
		if($(e.target).hasClass('fa-plus')){
			$(e.target).removeClass('fa-plus')
		       .addClass('fa-minus')
		  }
		  else{
			  $(e.target).addClass('fa-plus')
		       .removeClass('fa-minus')
		  }
	
		});
		
	$('#'+vid).on('hidden.bs.collapse', function () {
		
		//	$(e.target).removeClass('fa-plus').addClass('fa-close');
			if($(e.target).hasClass('fa-minus')){
				$(e.target).removeClass('fa-minus')
			       .addClass('fa-plus')
			  }
			  console.log("xx");
		
			});
 });
 
 $(".rasid_edit_link").click(function(e){
	 console.log("click");
 });
 
 function generateChart(target, da){
	 
	 var jsondata = da;
	 if(target == 'chartby_title'){
		 
		 var labels_a = jsondata.map(function (e) {
			  return e.service_name;
			});
		 var data = jsondata.map(function (e) {
			  return e.amt;
			});
		 
		
		 
		 new Chart(document.getElementById("chartby_title"), {
			    type: 'pie',
			    data: {
			      labels: labels_a,
			      datasets: [{
			        label: "Revenue Contribution based on title",
			        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
			        data: data
			      }]
			    },
			    options: {
			      title: {
			        display: true,
			        text: 'राजश्व संकलन शिर्षकको आधारमा'
			      },
			      legend: {
			            display: false}
			    }
			});
		 
		 
		 
		 
	 }else if(target == 'chartby_office'){
		 
		 
		 var labels_a = jsondata.map(function (e) {
			  return e.organization_name;
			});
		 var data = jsondata.map(function (e) {
			  return e.amt;
			});
		 
		
		 
		 new Chart(document.getElementById("chartby_office"), {
			    type: 'pie',
			    data: {
			      labels: labels_a,
			      datasets: [{
			        label: "Revenue Contribution based on title",
			        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
			        data: data
			      }]
			    },
			    options: {
			      title: {
			        display: true,
			        text: 'राजश्व संकलन कार्यालयको आधारमा'
			      },
			      legend: {
			            display: false}
			    }
			});
		 
		 
	 }
 }

</script>
<script src="js/chart.js"></script>

<script src="js/datatables.min.js"></script>
<script src="bootstrap-4/js/bootstrap.min.js"></script>
<script src="js/digit.js"></script>
<script src="js/prototypes.js"></script>
<script src="js/printThis.js"></script>
<script src="js/syncscript.js"></script>


</html>

    <%@ include file="updateBill.jsp" %>  
