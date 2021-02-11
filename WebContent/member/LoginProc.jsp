<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>



<%
request.setCharacterEncoding("UTF-8");

String id= request.getParameter("id");
String pass=request.getParameter("pass");



session.setAttribute("id", id);



%>





<%
response.sendRedirect(request.getContextPath()
		+"/BikeMain.jsp");

%>




</body>
</html>