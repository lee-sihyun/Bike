<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>



	<%
		request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");

	String pass = request.getParameter("pass");

	Member member = new Member();

	int result = member.getMemer(id, pass);

	if (result == 0) {
	%>

	<script type="text/javascript">
		alert("아이디 또는 패스워드가 틀립니다.");
	history.go(-1);
	</script>


	<%
		} else {

	session.setAttribute("id", id);
	response.sendRedirect(request.getContextPath() + "/BikeMain.jsp");

	}
	%>




</body>
</html>