<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="refresh" content="3;url=<c:url value="/index.jsp" />">
<title></title>
<style type="text/css">
*{margin:auto;}
#d1{
margin-top:450px;
margin-left:700px;
}  
#a1{
font-size:50px;
}
#d2{
margin-top:300px;
margin-left:600px;
font-size:50px;
}
</style>

</head>
<body>

<div id="d2">Email verify success!,back to H&D......</div>
<div id="d1"><a id="a1" href="<c:url value="/index.jsp" />">back to Hithch & Drive</a></div>
</body>
</html>