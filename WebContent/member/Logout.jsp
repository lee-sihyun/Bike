<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
<%


String id= (String)session.getAttribute("id");

session.invalidate();

response.sendRedirect(request.getContextPath()
+"/BikeMain.jsp");
%>

로그아웃
</body>
</html>