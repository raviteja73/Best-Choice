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
</head>
<body>

<html:form action="/loginAction"> 

	
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="10">
        
         <tr>
         <td>&nbsp; &nbsp; &nbsp;</td>
         </tr>
         <tr>
         <td>&nbsp; &nbsp; &nbsp;</td>
         </tr>
              <tr>
              <td align="center"><font face="verdana" size="3">Your Session has been Expired ! In order to Login Please <html:link page="/logout.do">click here</html:link></font></td>
              </tr>
            </table>
            
	



</html:form>




</body>
</html>