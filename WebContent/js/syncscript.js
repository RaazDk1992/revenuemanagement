$(document).ready(function(){
	 var isOnline = navigator.onLine;
	 var host = window.location.hostname;
	 
	 var _host ="";
	
	 
	 /**
	  * 
	  * 
	  * Internet is available start syncing.
	  * 
	  * - send request to local server 
	  * 	-fetch temporary data 
	  * 		-send  to remote server
	  * 
	  * 
	  */
	 
	 if(isOnline){
		 
		/* $.ajax({
			  url:_host,
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
		 
		 */
	 }
	 
	 
	 
	

	
	/**
	 * 
	 * user is working on localmachine
	 * 
	 */
	
	console.log(host);
	if(host =="localhost" || host == "127.0.0.1"){
		
		 $("#host_name").val("local");
	} else {
		 $("#host_name").val("remote");
	}
	 
});