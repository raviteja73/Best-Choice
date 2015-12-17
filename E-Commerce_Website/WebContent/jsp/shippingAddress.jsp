<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/WEB-INF/tlds/struts-tlds/struts-html.tld" prefix="html" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/StyleSheet_Payment.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="topbar">
<div class="leftdiv">
<html:link page="/loginAction.do?mode=loginHome"><p id="title">Best Choice</p></html:link>
</div>
</div>
<div class="grad"></div>
		<div class="card">
        <p> Please enter your card details below</p>
        <label for="cnumb">Card Number</label>
        <input class="number" type="text" placeholder="16 Digit Number On Card" style="margin-left:-25px" name="cnumb"><br>
        <label for="expiry">Expiry Date</label>
        <input class="expirymm" type="text" placeholder="MM" name="expiry" style="margin-left:-12px"> /
        <input class="expiryyy" type="text" placeholder="yy" name="expiry" style="margin-left:-12px"><br>
        <label for="cvv">CVV</label>
        <input class="cvv" type="text" placeholder="3 digit number" name="cvv" style="margin-left:37px"><br>
        <button type="submit" name="button">Proceed</button>
        </div>


</body>
</html>