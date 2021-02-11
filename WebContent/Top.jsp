<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
a {
	text-decoration: none;
}

#login, #logout {
	-webkit-box-shadow: 0 0 0 1000px white inset;
	color: green;
	margin-right: 15px;
}

#join {
	-webkit-box-shadow: 0 0 0 1000px white inset;
	color: green;
}
</style>
</head>
<body>

	<%
		String id = (String) session.getAttribute("id");

	if (id == null) {

		id = "GUEST";
	}
	%>



	<table>

		<tr>

			<td colspan="4"><a href="BikeMain.jsp"> <img alt=""
					src="img/Template/logo.JPG">
			</a></td>


			<td><%=id%> 님 <%
				if (id.equals("GUEST")) {
			%>

				<button id="login"
					onclick="location.href='BikeMain.jsp?center=member/Login.jsp'">로그인</button>
				<%
					} else {
				%>

				<button id="logout" onclick="location.href='member/Logout.jsp'">로그아웃</button>

				<%
					}
				%></td>
			<td><button id="join"
					onclick="location.href='BikeMain.jsp?center=member/Join.jsp'">회원가입</button>
			</td>






		</tr>




		<tr>

			<td align="center"><a href="#">사업소개</a></td>

			<td align="center"><a href="#">대여소조회</a></td>


			<td align="center"><a href="#">예약확인</a></td>



			<td align="center"><a href="#">자유게시판</a></td>





		</tr>






	</table>


	<script type="text/javascript">
		
	</script>
</body>
</html>