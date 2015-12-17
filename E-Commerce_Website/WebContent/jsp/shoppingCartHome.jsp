<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/WEB-INF/tlds/struts-tlds/struts-html.tld" prefix="html" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style5.css" rel="stylesheet" type="text/css" />

<%

ArrayList booksList=new ArrayList();
ArrayList laptopsList=new ArrayList();
ArrayList violinList=new ArrayList();

if(request.getAttribute("booksList")!=null)
{
	booksList=(ArrayList)request.getAttribute("booksList");
	System.out.println("dataList"+booksList);
	
}

if(request.getAttribute("laptopsList")!=null)
{
	laptopsList=(ArrayList)request.getAttribute("laptopsList");
	System.out.println("laptopsList in jsp"+laptopsList);
	
}

if(request.getAttribute("violinList")!=null)
{
	violinList=(ArrayList)request.getAttribute("violinList");
	System.out.println("violinList in jsp"+violinList);
	
}





%>

<script>
 function fn_purchaseBook(id)
 {
	 
	 //alert(id);
	 
	 document.forms[0].mode.value="buyProduct";
	 
	// alert("hellooooo"+id);
	 
	 document.getElementById("productId").value=id;
		
		document.forms[0].submit();
	 
	 
 }

</script>

</head>
<body>
<html:form action="/loginAction">
<html:hidden property="mode" name="actionForm" />
<html:hidden property="productId" styleId="productId" name="actionForm" />

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
  <html:link page="/books.do" styleClass="deps">Books</html:link>
   <a class="deps" href="Clothesshoes.html">Clothes & Shoes</a>
 <a class="deps" href="Electronics.html">Electronics</a>
 <a class="deps" href="Fitness.html">Fitness</a>
 <a class="deps" href="HFurniture.html">Home & Furniture</a>
  <a class="deps" href="Movies.html">Movies</a>
 <a class="deps" href="Sports.html">Sports</a>
</div>
</div>
<div class="page">
<div class="bookbar">
<p>Books - For All</p>
<div class="books">

<a class="bitems" href="#" onclick="fn_purchaseBook('<%=(String)booksList.get(0)%>');"><img src="images/Autobiographies.jpg"></a>
<a class="bitems" href="#" onclick="fn_purchaseBook('<%=(String)booksList.get(1)%>');"><img src="images/harrypotter.jpg"></a>
<a class="bitems" href="#" onclick="fn_purchaseBook('<%=(String)booksList.get(2)%>');"><img src="images/davincicode.jpg"></a>
<a class="bitems" href="#" onclick="fn_purchaseBook('<%=(String)booksList.get(3)%>');"><img src="images/dictionary.jpg"></a>



<!--  <a class="bitems" href="Books.html"><img src="images/davincicode.jpg"></a>
<html:link page="/book.do"><img src="images/dictionary.jpg"></html:link>-->


</div>

<div class="bname">
<a href="#"><p>AutoBiography Of Benjamin Franklin</p></a>
<a href="#"><p>Harry Potter-Deathly Hallows</p></a>
<a href="#"><p>The Da Vinci code </p></a>
<a href="#"><p>Oxford Dictionary</p></a>
</div>


</div>



<div class="emptydiv">
</div>
<div class="electronicbar">
<p>Laptops</p>
<div class="electronics">
<a class="eitems" href="#" onclick="fn_purchaseBook('<%=(String)laptopsList.get(0)%>');"><img src="images/Mac.jpg.png"></a>
<a class="eitems" href="#" onclick="fn_purchaseBook('<%=(String)laptopsList.get(1)%>');"><img src="images/dellinspiron.jpg"></a>
<a class="eitems" href="#" onclick="fn_purchaseBook('<%=(String)laptopsList.get(2)%>');"><img src="images/hp.jpg"></a>
<a class="eitems" href="#" onclick="fn_purchaseBook('<%=(String)laptopsList.get(3)%>');"><img src="images/lenova.jpg"></a>
<!--  <a class="eitems" href="Electronics.html"><img src="images/Beats.jpg"></a>
<a class="eitems" href="Electronics.html"><img src="images/Iphone.jpg"></a>
<a class="eitems" href="Electronics.html"><img src="images/PS3.jpg"></a>-->
</div>

<div class="ename">
<a href="#"><p >Apple iBook  12.1-Inch</p></a>
<a href="#"><p >Dell Inspiron i5547 15.6-Inch Laptop</p></a>
<a href="#"><p >HP ZBook 15 G2 Mobile Business Workstation</p></a>
<a href="#"><p >Lenovo Z50 Laptop Computer</p></a>
</div>



</div>
<div class="emptydiv">
</div>



<div class="electronicbar">
<p>Violin-Musical Instruments</p>
<div class="electronics">
<a class="eitems" href="#" onclick="fn_purchaseBook('<%=(String)violinList.get(0)%>');"><img src="images/mendini300.jpg"></a>
<a class="eitems" href="#" onclick="fn_purchaseBook('<%=(String)violinList.get(1)%>');"><img src="images/cecilio.jpg"></a>
<a class="eitems" href="#" onclick="fn_purchaseBook('<%=(String)violinList.get(2)%>');"><img src="images/cevn.jpg"></a>
<a class="eitems" href="#" onclick="fn_purchaseBook('<%=(String)violinList.get(3)%>');"><img src="images/mendinimv500.jpg"></a>
<!--  <a class="eitems" href="Electronics.html"><img src="images/Beats.jpg"></a>
<a class="eitems" href="Electronics.html"><img src="images/Iphone.jpg"></a>
<a class="eitems" href="Electronics.html"><img src="images/PS3.jpg"></a>-->
</div>

<div class="ename">
<a href="#"><p >Mendini 4/4 MV300</p></a>
<a href="#"><p >CECILIO 1/4 CVN-500</p></a>
<a href="#"><p >CEVN-1BK 4/4 Full Size Electric Silent Solidwood Violin</p></a>
<a href="#"><p >Mendini 4/4 MV500</p></a>

</div>


</div>
<div class="emptydiv">
</div>



<!-- 

<div class="sfbar">
<p>Sports & Fitness</p>
<div class="sf">
<a class="sfitems" href="Sports Bat.html"><img src="images/Cricket Bat.jpg"></a>
<a class="sfitems" href="Sports.html"><img src="images/Badminton bat.jpg"></a>
<a class="sfitems" href="Fitness.html"><img src="images/Threadmill.jpg"></a>
<a class="sfitems" href="Fitness.html"><img src="images/ChestPress.jpg"></a>
</div>
</div>
<div class="emptydiv">
</div>
<div class="otherbar">
<p>Hot Deals on Other Products</p>
<div class="Other">
<a class="oitems" href="Clothes&Shoes.html"><img src="images/OverCoat.jpg"></a>
<a class="oitems" href="Movies.html"><img src="images/Movie.jpg"></a>
<a class="oitems" href="Clothes&Shoes.html"><img src="images/Shoes.jpg"></a>
<a class="oitems" href="Home&Furniture.html"><img src="images/Furniture.jpg"></a>
</div>
</div>
</div>

 -->





</html:form>
</body>
</html>