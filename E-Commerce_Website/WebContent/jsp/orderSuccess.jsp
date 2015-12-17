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
<link href="css/Style7.css" rel="stylesheet" type="text/css" />

</head>
<body>
<html:form action="/paymentAction">
<html:hidden property="mode" name="paymentForm" />



<div class="topbar">
<div class="leftdiv">
<p id="title">Best Choice</p>
</div>
<div class="rightdiv">

<!-- <html:link page="/logout.do" styleClass="cart">Logout</html:link> -->
<html:link page="/loginAction.do?mode=logoutUser" styleClass="cart">Logout</html:link>
</div>
</div>

<div class="message">

 <logic:notEmpty property="message" name="paymentForm"  >
                 
                 
	            <bean:write property="message" name="paymentForm" /> To continue shopping ,click <html:link page="/loginAction.do?mode=loginHome"> here </html:link>
       		
                 
                 </logic:notEmpty>

</div>

</html:form>

</body>
</html>