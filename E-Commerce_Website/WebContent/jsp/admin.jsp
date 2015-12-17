<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@taglib uri="/WEB-INF/tlds/struts-tlds/struts-bean.tld" prefix="bean" %>
<%@taglib uri="/WEB-INF/tlds/struts-tlds/struts-html.tld" prefix="html" %>
<%@taglib uri="/WEB-INF/tlds/struts-tlds/struts-logic.tld" prefix="logic" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link href="css/admin.css" rel="stylesheet" type="text/css" />

<%

ArrayList orders=new ArrayList();
if(request.getAttribute("orders")!=null)
{
	orders=(ArrayList)request.getAttribute("orders");
	
}

%>


</head>
<body>


<div class="topbar">
<div class="leftdiv">
<p id="title">Best Choice</p>
</div>
<div class="rightdiv">

<!-- <html:link page="/logout.do" styleClass="cart">Logout</html:link> -->
<html:link page="/loginAction.do?mode=logoutUser" styleClass="cart">Logout</html:link>

</div>
</div>

<div class="empty">
</div>




<table class="tab" cellspacing="2" cellpadding="10" border="3" width="95%">
<tr>
<th>orderId</th>
<th>userId</th>
<th>productId</th>
<th>productName</th>
<th>quantity</th>
</tr>

<%
ArrayList list=new ArrayList();
ArrayList innerList=new ArrayList();




for(int i=0;i<orders.size();i++){ 
	
	list=(ArrayList)orders.get(i);



%>

<tr>
<%for(int j=0;j<list.size();j++){ 
if(j==2)
{
%>
<td width="5"><%=(String)list.get(j) %></td>

<%}else{ %>
<td width="5"><%=(String)list.get(j) %></td>

<%} }}%>

</tr>
</table>

</body>
</html>