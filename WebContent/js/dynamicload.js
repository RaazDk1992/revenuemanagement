function refreshData(path, required, target ){
			console.log("dfd");
	$.ajax({
		
		url:_url,
		  type: "GET", //send it through get method
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
	
}