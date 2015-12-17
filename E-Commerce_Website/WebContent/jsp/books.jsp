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
<link href="css/books.css" rel="stylesheet" type="text/css">

</head>
<body>
<html:form action="/loginAction">
<html:hidden property="mode" name="actionForm" />
<div class="topbar">
<div class="leftdiv">
<html:link page="/loginAction.do?mode=loginHome"><p id="title">Best Choice</p></html:link>
</div>
<div class="centrediv">
<input id="searchbar" placeholder="Want to find something? Use me!!!" type="search" name="search">
<img id="searchicon" src="images/Search.png">
</div>
<div class="rightdiv">
<a class="logoutlink" href="Login.html">Logout</a>
<a class="cart" href=""><img id="cartimg" src="images/Cart.jpg"> Cart</a>
<p>Welcome,RaviTeja</p>
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
<div class="page">
<div class="bookbar">
<p class="title">Fiction & Fantasy</p>
<div class="books">
<a class="bitems" href="Fantastic_Buy.html"><img src="images/Books/F&F/Fantastic Fable.jpg"></a>
<a class="bitems" href="Harry Potter_Buy.html"><img src="images/Books/F&F/HarryPotter_2.jpg"></a>
<a class="bitems" href="Hobbits_Buy.html"><img src="images/Books/F&F/Hobbit.jpg"></a>
<a class="bitems" href="PJO_Buy.html"><img src="images/Books/F&F/Percy Jackson and the Olympians.jpg"></a>
</div>
<div class="bname">
<a href="Fantastic_Buy.html"><p>Fantastic Fable - The Paranormal Edition</p></a>
<a href="Harry Potter_Buy.html"><p>HarryPotter-Deathly Hallows</p></a>
<a href="Hobbits_Buy.html"><p>The History of The Hobbit</p></a>
<a href="PJO_Buy.html"><p>Percy Jackson and the Olympians</p></a>
</div>
</div>
<div class="emptydiv">
</div>
<div class="electronicbar">
<p>AutoBiography</p>
<div class="electronics">
<a class="eitems" href="Electronics.html"><img src="images/Books/Bio/Hitler.jpg"></a>
<a class="eitems" href="Electronics.html"><img src="images/Books/Bio/Nelson.jpg"></a>
<a class="eitems" href="Electronics.html"><img src="images/Books/Bio/Sachin.jpg"></a>
<a class="eitems" href="Electronics.html"><img src="images/Books/Bio/Franklin.jpg"></a>
</div>
<div class="ename">
<a href="Electronics.html"><p >Mein Kampf by Adolf Hitler</p></a>
<a href="Electronics.html"><p >Long Walk to Freedom by Nelson Mandela</p></a>
<a href="Electronics.html"><p >Playing It My Way by Sachin Tendulkar</p></a>
<a href="Electronics.html"><p >The Autobioraphy of Benjamin Franklin</p></a>
</div>
</div>
<div class="emptydiv">
</div>
<div class="sfbar">
<p>Education</p>
<div class="sf">
<a class="sfitems" href="Big Data.html"><img src="images/Books/Edu & Teaching/Big Data.jpg"></a>
<a class="sfitems" href="Design patterns.html"><img src="images/Books/Edu & Teaching/Design patterns.jpg"></a>
<a class="sfitems" href="Gre.html"><img src="images/Books/Edu & Teaching/Gre.jpg"></a>
<a class="sfitems" href="Oxford.html"><img src="images/Books/Edu & Teaching/Oxford.jpg"></a>
</div>
<div class="sfname">
<a href="Big Data.html"><p >Analytics...Big Data World</p></a>
<a href="Design patterns.html"><p >Design Patterns: Elements of Reusable Object-Oriented Software</p></a>
<a href="Gre.html"><p >GRE Premier 2016 with 6 Practice Tests: Book + Online + DVD + Mobile (Kaplan Test Prep)</p></a>
<a href="Java.html"><p >Oxford Dictionary</p></a>
</div>
</div>
<div class="emptydiv">
</div>
<div class="otherbar">
<p>Mystery, Thriller & Suspense</p>
<div class="Other">
<a class="oitems" href="Inheritance.html"><img src="images/Books/MST/Inheritance.jpg"></a>
<a class="oitems" href="Girl In Spiders web.html"><img src="images/Books/MST/Girl In Spiders web.jpg"></a>
<a class="oitems" href="Due Justice.html"><img src="images/Books/MST/Due Justice.jpg"></a>
<a class="oitems" href="Seventeenth.html"><img src="images/Books/MST/Seventeenth.jpg"></a>
</div>
<div class="oname">
<a href="Clothes&Shoes.html"><p >Inheritance: A Psychological Mystery and Suspense Thriller</p></a>
<a href="Movies.html"><p >The Girl in the Spider's Web: A Lisbeth Salander novel, continuing Stieg Larsson's Millennium Series</p></a>
<a href="Clothes&Shoes.html"><p >Due Justice: Judge Willa Carson Mystery Novel (The Hunt For Justice Series Book 1)</p></a>
<a href="Home&Furniture.html"><p >The Seventeenth Floor: a story of a husband who loved his wife but dreamed of other women</p></a>
</div>
</div>
</div>
</html:form>
</body>
</html>