<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>

	<jsp:useBean id="mbean" class="bean.MemberBean">
		<jsp:setProperty name="mbean" property="*" />

	</jsp:useBean>

	<%
		request.setCharacterEncoding("UTF-8");

	Member mdao = new Member();

	mdao.insertMember(mbean);
	 %>
	
	

<% response.sendRedirect(request.getContextPath() + "/BikeMain.jsp?center=member/Login.jsp");%>


</body>
</html>