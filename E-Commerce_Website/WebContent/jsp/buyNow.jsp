<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.ArrayList" %>
     <%@ page import="java.io.ByteArrayOutputStream" %>
     <%@ page import="java.io.File" %>
      <%@ page import="java.io.FileInputStream" %>
       <%@ page import="java.io.FileWriter" %>
        <%@ page import="java.io.OutputStream" %>
        <%@ page import="java.io.InputStream" %>
         <%@ page import="java.sql.*" %>
        

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/WEB-INF/tlds/struts-tlds/struts-html.tld" prefix="html" %>
<%@taglib uri="/WEB-INF/tlds/struts-tlds/struts-bean.tld" prefix="bean" %>

<%@taglib uri="/WEB-INF/tlds/struts-tlds/struts-logic.tld" prefix="logic" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style3.css" rel="stylesheet" type="text/css"/>

<script src="../js/prefixfree.min.js"></script>
<script  src="../js/unslider.js"></script>
<%
ArrayList productDetails=new ArrayList();

if(request.getAttribute("productDetails")!=null) 
{
	
	productDetails=(ArrayList)request.getAttribute("productDetails");
	
	System.out.println("productDetails>>>."+productDetails);
}


%>

<script>

function fn_addToCart()
{
	//alert("hi");
	var productId=document.getElementById("productId").value;
	//alert(productId);
	
	document.forms[0].mode.value="addToCart";
	
	document.forms[0].submit();
	}

</script>


<script src="Script/jquery-1.7.1.min.js" type="text/javascript"></script>
      <script type="text/javascript">
        $(document).ready(function () {
            $('#Img1').mouseover(function () {
                $(this).animate({ width: "122px", height: "110px" }, 100);
            });
            $('#Img1').mouseout(function () {
                $(this).animate({ width: "118px", height: "106px" }, 100);
            });
        });
      </script>


</head>
<body>
<html:form action="/loginAction">
<html:hidden property="mode" name="actionForm" />
<html:hidden property="productId" value="<%=(String)productDetails.get(0) %>" name="actionForm" styleId="productId"/>

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

<div class="page1">
<table align="center" >
<tr>
<td>
<img src="loginAction.do?mode=displayImage&productId=<%=(String)productDetails.get(0) %>">
</td>
<td>

<table> 
<tr><td colspan="2">
<p id="btitle"> <%=(String)productDetails.get(1) %></p>
</td></tr>
<tr>
<td>
<pre id="bprice1">
Description:</pre>
</td>
<td>
 <%=(String)productDetails.get(2) %>
 </td>
</tr>
<tr>
<td>
<pre id="bprice1">Price:</pre>
</td>
<td>
<pre id="bprice2"> $<%=(String)productDetails.get(5) %></pre>
</td>
</tr>
<tr>
<td>
<pre id="bprice1">In Stock:</pre>
</td>

<td>
<%if((Integer.parseInt((String)productDetails.get(4)))<=0){ %>
Out of Stock
<%}else{ %>
<pre id="bprice2"> <%=(String)productDetails.get(4) %></pre>
<%} %>
</td>
</tr>
<tr>
<td>
<pre id="bprice1">Quantity:</pre>
</td>
<td>
<html:select property="quantity" styleId="quantity" name="actionForm" style=""> 
	                  <html:option value="1" >1</html:option>
	                  <html:option value="2" >2</html:option>
	                   <html:option value="3" >3</html:option>
	                    <html:option value="4" >4</html:option>
	                     <html:option value="5" >5</html:option>
	                     <html:option value="6" >6</html:option>	
	                     <html:option value="7" >7</html:option>	
	                     <html:option value="8" >8</html:option>	
	                     <html:option value="9" >9</html:option>	
	                     <html:option value="10" >10</html:option>													
                    </html:select>
        </td>
        </tr>            
 </table>                   
</td>

</tr>

<tr>
<td colspan="2" align="center">
<%if((Integer.parseInt((String)productDetails.get(4)))<=0){ %>

<%}else{ %>

<input type="button" onClick="fn_addToCart();" value="Add to Cart" id="cart" />
<%} %>
</td>
</tr>


</table>


</div>



</html:form>

</body>
</html>