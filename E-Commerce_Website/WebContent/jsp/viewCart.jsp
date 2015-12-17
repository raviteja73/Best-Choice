<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/WEB-INF/tlds/struts-tlds/struts-html.tld" prefix="html" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style2.css" rel="stylesheet" type="text/css" />

<script>

function fn_removeFromCart(id)
{
	
	//alert(id);
	
	 document.forms[0].mode.value="removeFromCart";
	 
		//alert("hellooooo"+id);
		 
		 document.getElementById("productId").value=id;
			
			document.forms[0].submit();
			
			
	
	
	}


</script>


</head>
<body>
<html:form action="/cartAction">
<html:hidden property="productId" name="actionForm" styleId="productId"/>
<html:hidden property="mode" name="actionForm" styleId="mode"/>
<div class="topbar">
<div class="leftdiv">
<html:link page="/loginAction.do?mode=loginHome"><p id="title">Best Choice</p></html:link>
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
<html:link page="/loginAction.do?mode=viewCartItems" styleClass="cart"><img id="cartimg" src="images/Cart.jpg"> Cart</html:link>
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



<table align="center" border="1">

<tr>
<td>Added to Cart</td>
<td> Cart Total Items : <%=(Integer)session.getAttribute("total") %></td>
		
      <td>
        <input type="button" value="cart" onClick="fn_viewCartItems();"/>
        
        <html:link page="/payment.do" styleClass="">proceed to payment</html:link>
        </td>
        </tr>
        </table>




<%
Map<String,String> cartItems=null;
if(session.getAttribute("cartItems")!=null)
{
	 cartItems = (Map<String, String>) session.getAttribute("cartItems");
}
	ArrayList list = (ArrayList)session.getAttribute("cartDetails");
	for(int i=0;i<list.size();i++){
		
		ArrayList productDetails = (ArrayList)list.get(i);
		String productId = (String)productDetails.get(0);
	
		%>
		<div class="page1">
		

<!--  <table align="center" >
<tr>
<td>
<img src="loginAction.do?mode=displayImage&productId=<%=productId %>">
</td>
</tr>
</table>-->

<table> 

<tr class="header">
<th class="h1">Product</th>
<th class="h2">Product Name</th>
<th class="h3">Quantity</th>
<th class="h4">Price</th>
<th class="h5">Description</th>

</tr>


<tr id="row1">
<td>

<img src="loginAction.do?mode=displayImage&productId=<%=productId %>">
</td>
<td>
 <%=(String)productDetails.get(1) %>
</td>



<td><p class="quan">

<%
	int quantity = 0;
	if( (cartItems.get(productId)) != null){
		quantity = Integer.parseInt(cartItems.get(productId));
	}
%>
 <%=quantity %></p>
</td>


<td><p class="price">


<%
	double price = 0;
	String priceStr = (String)productDetails.get(4);
	if( priceStr != null){
		price = Double.parseDouble(priceStr);
	}
	price = price * quantity;
%>

$<%=price %> </p></td>


<td><p class="des">
 <%=(String)productDetails.get(2) %></p>
 </td>
 
 
 
</tr>



<tr>
<td>
<input type="button"  value="remove from cart" onClick="fn_removeFromCart('<%=productId %>');"/>
</td>
</tr>

<tr class="blankrow">
<td colspan="5" >
</td>
</tr>

</table>
</div>
		
		<%		
	}

%>

</html:form>
</body>
</html>