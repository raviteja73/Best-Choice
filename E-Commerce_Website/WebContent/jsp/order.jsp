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
<link href="css/style2.css" rel="stylesheet" type="text/css" />


	<link href='http://fonts.googleapis.com/css?family=Exo:100,200,400' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300' rel='stylesheet' type='text/css'>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
	
<script>	

function fn_deliver()
{
	

	var shipingName=document.getElementById("shipingName").value;
	
	if(shipingName=="" || shipingName==null)
	{
	alert("Please enter name");
	return;
	}
	
	var shipingAddress=document.getElementById("shipingAddress").value;
	
	if(shipingAddress=="" || shipingAddress==null)
	{
	alert("Please enter address");
	return;
	}
	
	var shipingCity=document.getElementById("shipingCity").value;
	
	if(shipingCity=="" || shipingCity==null)
	{
	alert("Please enter city");
	return;
	}
	
	
	var shipingState=document.getElementById("shipingState").value;
	
	if(shipingState=="" || shipingState==null)
	{
	alert("Please enter state");
	return;
	}
	
	var shipingZipCode=document.getElementById("shipingZipCode").value;
	

	if(shipingZipCode=="" || shipingZipCode==null)
	{
	alert("Please enter ZipCode");
	return;
	}
	
	
	
	var contactNumber=document.getElementById("shipingContactNumber").value;
	
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
	
	var cardNumber=document.getElementById("cardNumber").value;
	
	
	if(cardNumber=="" || cardNumber==null)
	{
	alert("Please enter cardNumber");
	return;
	}
	 var re16digit = /^\d{16}$/;
	 
	 if (!re16digit.test(cardNumber)) {
	        alert("Please enter your 16 digit credit card numbers");
	        return;
	    }
	 
	 var expiryMM=document.getElementById("expiryMM").value;
	if(expiryMM=="" || expiryMM==null)
	{
	alert("Please enter expiryMM");
	return;
	}
	
	 var expiryYY=document.getElementById("expiryYY").value;
	
	if(expiryYY=="" || expiryYY==null)
	{
	alert("Please enter expiryYY");
	return;
	}
	
	 var cvv=document.getElementById("cvv").value;
	if(cvv=="" || cvv==null)
	{
	alert("Please enter cvv");
	return;
	}
	var reg=/^[0-9]{3,4}$/;
	
	 if (!reg.test(cvv)) {
	        alert("Please enter valid cvv");
	        return;
	    }
	
	document.forms[0].mode.value="submitUserDetails";
	
	document.forms[0].submit();
	
	
	
	
	
	
	
document.forms[0].mode.value="payment";
	
	document.forms[0].submit();
	
	
	}

	</script>
</head>
<body>
<html:form action="/paymentAction">
<html:hidden property="mode" name="paymentForm" />



<div class="topbar">
<div class="leftdiv">
<p id="title">Best Choice</p>
</div>
<div class="centrediv">
<input id="searchbar" placeholder="Want to find something? Use me!!!" type="search" name="search">
<img id="searchicon" src="images/Search.png">

</div>
<div class="righttop">
<p><font size="3" color="white">Welcome <%=(String)session.getAttribute("userName") %>  </font></p>
</div>
<div class="rightdiv">

<!-- <html:link page="/logout.do" styleClass="cart">Logout</html:link> -->
<html:link page="/loginAction.do?mode=logoutUser" styleClass="cart">Logout</html:link>
<a class="cart" href=""><img id="cartimg" src="images/Cart.jpg"> Cart</a>
</div>
<div class="department">
  <a class="deps" href="Books.Html">Books</a>
   <a class="deps" href="Clothesshoes.html">Clothes & Shoes</a>
 <a class="deps" href="Electronics.html">Electronics</a>
 <a class="deps" href="Fitness.html">Fitness</a>
 <a class="deps" href="HFurniture.html">Home & Furniture</a>
  <a class="deps" href="Movies.html">Movies</a>
 <a class="deps" href="Sports.html">Sports</a>
</div>
</div>








<div class="body"></div>
		<div class="grad"></div>
		<br>
		<div class="login">
		<table>
		
		<tr>
		<td>Name:</td>
		<td>
        <html:text property="shipingName" styleId="shipingName" name="paymentForm"/>
        </td>
        </tr>
        
        <tr>
        <td>Address:</td>
        <td>
        <html:text property="shipingAddress" styleId="shipingAddress" name="paymentForm"/><br>
        </td>
        </tr>
        
        <tr>
        <td>City:</td>
        <td>
        <html:text property="shipingCity" styleId="shipingCity" name="paymentForm"/><br>
        </td>
        </tr>
        
        <tr>
        <td>State:</td>
        <td>
        <html:text property="shipingState" styleId="shipingState" name="paymentForm"/><br>
        </td>
        </tr>
        
        
		 <tr>
        <td>Zip Code:</td>
        <td>
        <html:text property="shipingZipCode" styleId="shipingZipCode" name="paymentForm"/><br>
        </td>
        </tr>       
        
        
        <tr>
        <td>Contact Number:</td>
        <td>
        <html:text property="shipingContactNumber" styleId="shipingContactNumber" name="paymentForm"/><br>
        </td>
        </tr>
        
        <tr>
        <td>
        Card Number
        </td>
        <td>
        <html:text styleClass="margin-left:-25px" styleId="cardNumber" property="cardNumber" name="paymentForm"/>
        </td>
        </tr>
        <tr>
        <td>
        Expiry Date
        </td>
        <td>
        
        MM<html:text  property="expiryMM" name="paymentForm" styleClass="margin-left:-12px" styleId="expiryMM"/> /
       YY <html:text  property="expiryYY" name="paymentForm"  styleClass="margin-left:-12px"  styleId="expiryYY"/>
        </td>
        </tr>
        <tr>
        <td>
        CVV
        </td>
        <td>
      <html:text  property="cvv" name="paymentForm"  styleClass="margin-left:37px" styleId="cvv"/> 
      </td>
      </tr>
      
        
        
        
			<tr>
			<td>
			<input type="button" value="proceed to payment" onClick="fn_deliver();"/>
			</td>
			</tr>
			
			<tr>
			<td>
			<logic:notEmpty property="message" name="paymentForm"  >
                 
                 
	            <bean:write property="message" name="paymentForm" />
       		
                 
                 </logic:notEmpty>
                 </td>
                 </tr>
			
			
               </table>
		</div>
</html:form>
</body>
</html>