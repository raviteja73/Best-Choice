<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/WEB-INF/tlds/struts-tlds/struts-bean.tld" prefix="bean" %>
<%@taglib uri="/WEB-INF/tlds/struts-tlds/struts-html.tld" prefix="html" %>
<%@taglib uri="/WEB-INF/tlds/struts-tlds/struts-logic.tld" prefix="logic" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style1.css" rel="stylesheet" type="text/css" />
	<link href='http://fonts.googleapis.com/css?family=Exo:100,200,400' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300' rel='stylesheet' type='text/css'>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script>
	$(document).ready(function(){
	    $("#firstName").attr("placeholder", "First Name");
	    $("#lastName").attr("placeholder", "Last Name");
	    $("#emailId").attr("placeholder", "Email");
	    $("#password").attr("placeholder", "Password");
	    $("#confirmPassword").attr("placeholder", "Confirm Password");
	    $("#contactNumber").attr("placeholder", "Mobile Number");
	});
	
	</script>
	<script>
	
	function onClickSignUp()
	{
		
		var firstName=document.getElementById("firstName").value;
		
		if(firstName=="" || firstName==null)
		{
		alert("Please enter first name");
		return;
		}
		
		var lastName=document.getElementById("lastName").value;
		
		if(lastName=="" || lastName==null)
		{
		alert("Please enter last name");
		return;
		}
		
		var emailId=document.getElementById("emailId").value;
		
		if(emailId=="" || emailId==null)
		{
		alert("Please enter emailId");
		return;
		}
		var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
		if (!(filter.test(emailId))) {
			alert("enter valid email address");
			return;
			}
		
		var password=document.getElementById("password").value;
		
		if(password=="" || password==null)
		{
		alert("Please enter password");
		return;
		}
		
		var confirmPassword=document.getElementById("confirmPassword").value;
		

		if(confirmPassword=="" || confirmPassword==null)
		{
		alert("Please enter confirmPassword");
		return;
		}
		
		if(password!=confirmPassword)
		{
			document.getElementById("password").value="";
			document.getElementById("confirmPassword").value="";
		alert("passwords doesn't match");
		
		return;
		}
		
		var contactNumber=document.getElementById("contactNumber").value;
		
		if(contactNumber=="" || contactNumber==null)
		{
		alert("Please enter contactNumber");
		return;
		}
		if(!contactNumber.match(/^\d{10}/))
			{
			 alert("Please enter valid contact number");
			 return;
			}
		
		document.forms[0].mode.value="submitUserDetails";
		
		document.forms[0].submit();
		
	}
	
	
	</script>
	
	
</head>
<body>
<html:form action="/loginAction">
<html:hidden property="mode" name="actionForm" />
<div class="body"></div>
		<div class="grad"></div>
		<br>
		<div class="login">
		
        
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr><td>
		<pre id="stitle"> Best Choice </pre><br /><br /><br />
 	 <p id="stagline">Best Place To Shop Online</p><br /> <br /><br />
 	 </td></tr>
		
		<tr><td>
		        <html:text property="firstName" styleId="firstName" name="actionForm"/>
		        </td></tr>
		        <tr><td>
		        <html:text property="lastName" styleId="lastName" name="actionForm"/>
		        </td></tr>
		        <tr><td>
		        
		        <html:text property="emailId" styleId="emailId" name="actionForm"/>
		        </td></tr>
		        <tr><td>
		        <html:password property="password" styleId="password" name="actionForm"/>
		        </td></tr>
		        <tr><td>
		         <html:password property="confirmPassword" styleId="confirmPassword" name="actionForm"/>
		         </td></tr>
		         <tr><td>
		         <html:text property="contactNumber" styleId="contactNumber" name="actionForm"/>
		         </td></tr>
		         <tr><td>
		         <input type="button" value="Sign Up" onClick="onClickSignUp()">
		         </td></tr>
		         <tr><td>
		    <p>Already On Best Choice? <a style="color:#DD8586" href="loginAction.do?mode=login"> Login</a></p>    
 				
 				</td></tr>
 				</table>
 				
 				
 				
		</div>
		<div class="bottom">
		<table>
 				<tr><td>
 				<logic:notEmpty property="errorMessage" name="actionForm"  >
                 
                 
	            <font color="red" size="5"><bean:write property="errorMessage" name="actionForm" /></font>
       		
                 
                 </logic:notEmpty>
                 </td></tr>
                 </table>
                 </div>
		</html:form>
</body>
</html>