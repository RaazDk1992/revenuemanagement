<%@ page language="java" contentType="text/html;"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script src="vendor/jquery/jquery.min.js"></script>
 <script src="js/datepicker.js"></script>
  
<title>Insert title here</title>
</head>
<body>
			<table width="100%" id="leave_table">
			
					<thead>
						<tr ><td align="center" colspan="4">लेकवेशी नगरपालिका नगरकार्यपालिकाको कार्यालय</td></tr>
						<tr><td align="center" colspan="4"> कर्णाली प्रदेश ,सुर्खेत</td></tr>
						<tr><td align = "center" colspan="4"><b><u>विदाको निवेदन</u></b></td></tr>
					</thead>
					<tr>
						<td style="border-top: thin solid; 
    border-bottom: thin solid;" align="center" colspan="4"> कर्मचारीले प्रयोग गर्ने</td>
					</tr>
					<tr>
						<td align="left" colspan="2" >नाम : <input type="text" placeholder = "नाम" style="width: 50%; border: none;"/></td>
						<td align="right" colspan="2">मन्त्रालय / विभाग : <input type="text" placeholder = "विभाग" style="width: 50%; border: none;"/></td>
						
					</tr>
					<tr>
						<td align="left" colspan="2" >पद : <input type="text" placeholder = "पद" style="width: 50%; border: none;"/></td>
						<td align="right" colspan="2">कार्यालय : <input type="text" placeholder = "कार्यालय" style="width: 50%; border: none;"/></td>
						
					</tr>
					
			
			</table>
			<button id="export">xx</button>
</body>


<script>
$("#export").click(function(){
	
	window.print();
	});
</script>
</html>