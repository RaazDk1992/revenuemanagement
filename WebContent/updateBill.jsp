<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<% 

    	 //office_id
   int  o_id=(int )session.getAttribute("office_id"); 
    	 String _user = (String)session.getAttribute("full_name");
    	 String _designation = (String)session.getAttribute("designation");
    	
    	 
    	 
%> 
		<div class="modal fade " id="updatebill" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-xl" role="document" >
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update Bill</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
        <form id="revenue_bill_form" action="./InventoryBase" method="POST">
    	 
    	            <input type="hidden" name="current_rasid" id="current_rasid" value=""/>
    	            <input type="hidden" name="office_ref" id="office_ref" value="<%=o_id %>"/>
    	           
    	            <input type="hidden" name="host_name_hidden" id="host_name"/>
					<input type="hidden" name="task" value="update_bill"/>
					
										 <div class="form-row">
				<div class="form-group col-md-7">
     			 <label for="service_name">सेवा ग्राहीको नाम</label>
      			<input type="text" class="form-control" id="customer_name_new" name="customer_name_new" placeholder="सेवा ग्राहीको नाम"/>
   				 </div>
    <div class="form-group col-md-4">
      <label for="category_id">ठेगाना</label>
      <select  class="form-control" id="customer_address_new" name="customer_addresss_new"></select>
    </div>
   
  </div>
   
  
  				<div id="bill_holder">
					
							<div id="reciept">
							
								<span id="client_name_new"></span>
								<span id="client_address_new">address</span>
								<span id="trans_date_new" style="position:absolute;right:30px;"></span>
								
									<div id="bill_body_new"></div>
								
								<span id="rev_amount_total_new" style="position:absolute;left:630px;bottom:200px;">xx</span>
								<span id="user"> <%=_user %></span>
								<span id="designation"> <%=_designation %></span>
									
							
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
       	<div id="candidate_update_status"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <input type="submit" id="btn_update_candidate" type="button" class="btn btn-primary" value="Apply Changes" />
      </div>
    </div>
  </div>
</div>
</body>
<script>
$(document).ready(function(){
	
	$("#updatebill").on('shown.bs.modal',function(e){
		
		
		var data =$("#update_bill").data("ref");
		loadAdressDropdown("./InventoryBase", "adress_ref", "customer_address_new");
		$("#trans_date_new").text(data.date);
	});
	
	
	
	
});

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


</script>
</html>