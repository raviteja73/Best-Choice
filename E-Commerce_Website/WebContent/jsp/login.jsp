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
<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link href='http://fonts.googleapis.com/css?family=Exo:100,200,400' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300' rel='stylesheet' type='text/css'>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script>
	$(document).ready(function(){
	    $("#loginID").attr("placeholder", "User Name");
	    $("#password").attr("placeholder", "Password");
	    
	});
	
	</script>
	
<script>	
function onClickLogin()
{
	var loginID=document.getElementById("loginID").value;
	var password=document.getElementById("password").value;
	if(loginID=="" || loginID==null)
		{
		alert("Please enter username");
		return;
		}
	if(password=="" || password==null)
	{
	alert("Please enter password");
	return;
	}
	document.forms[0].mode.value="loginHome";
	document.forms[0].submit();
}

function onClickSignUp()
{
	document.forms[0].mode.value="signUp";
	
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
		<table>
		
		<tr>
		<td>
        <html:text property="loginID" styleId="loginID" name="actionForm"/>
        </td>
        </tr>
        
        <tr>
        <td>
        <html:password property="password" styleId="password" name="actionForm"/><br>
        </td>
        </tr>
		        
			<tr>
			<td>	
				<input type="button" value="Login" onClick="onClickLogin()">
				</td>
				</tr>
				<tr>
				<td>
				<logic:notEmpty property="errorMessage" name="actionForm"  >
                 
                 
	            <bean:write property="errorMessage" name="actionForm" />
       		
                 
                 </logic:notEmpty>
                 </td>
                 </tr>
                 <tr>
                 <td>
                <p>Not A Member? Click below to Sign Up</p></td>
                </tr>
                <tr>
                <td>
               <input type="button" value="Sign Up" name="Sbutton" onClick="onClickSignUp()">
               </td>
               </tr>
               </table>
		</div>
</html:form>
</body>
</html>