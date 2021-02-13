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

.rink a {
	margin-right: 80px;
	text-decoration: none;
	cursor: pointer;
	font-size: 17px;
	color: #222;
	font-weight: bold;
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







	</table>

	<div class="rink">
		<a href="BikeMain.jsp?center=reserve/BikeList.jsp">대여하기</a> 
		<a href="#">예약확인</a> 
		<a href="#">자유게시판</a> <a
			href="BikeMain.jsp?center=board/NoticeBoard.jsp">공지사항</a>

	</div>



	<script type="text/javascript">
		
	</script>
</body>
</html>