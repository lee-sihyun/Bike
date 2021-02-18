<%@page import="model.Board"%>
<%@page import="bean.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">

<style type="text/css">
.container {
	width: 1472px;
	height: 1050px;
}

.content {
	width: 1030px;
	margin: 0 auto;
	position: relative;
	min-height: 500px;
}

.read_box {
	width: auto;
	height: 600px;
}


.read_box table {
	width: 100%;
	height: 502px;
	margin-top: 50px;
}

.read_box table tr td {
	border-bottom: 1px solid #444444;
	padding: 10px 15px;
}

#ldubtn input {
	-webkit-box-shadow: 0 0 0 1000px white inset;
    color: green;
    margin-right: 15px;
}

#ldubtn, #listbtn {
	text-align: center;
}


.swal-button 
{
	background-color: #FFB2D9;
	font-size: 12px;
	text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
}

</style>


</head>
<body>
	<!-- 공지사항게시물 상세화면 -->

	<%
		int no = Integer.parseInt(request.getParameter("no"));

	Board board = new Board();
	NoticeBoard bean = board.getNoticeInfo(no);

	String id = (String) session.getAttribute("id");

	if (id == null) {

		id = "GUEST";
	}
	%>


	<div class="container">

		<div class="content">
			

				<div class="read_box">


					<!--  -->

					<table>

						<tr id="titleTop" style="height: 100px;">

							<td>제목 &nbsp;&nbsp;<strong><b><%=bean.getTitle()%></b></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(작성시간
								&nbsp;&nbsp;<%=bean.getNbdate().substring(0, 16)%>)
							</td>




						</tr>



						<tr>

							<td colspan="2"><%=bean.getContent()%></td>
						</tr>




					</table>
				</div>
				<!-- 버튼리스트  -->

				<%
					if (id.equals("admin")) {
				%>
				<div id="ldubtn">
					<input type="button"
						onclick="location.href='BikeMain.jsp?center=board/Notice/NoticeBoardList.jsp'"
						value="목록">&nbsp;&nbsp; <input type="button" value="삭제" 
						onclick="  location.href='BikeMain.jsp?center=board/Notice/Del.jsp?no=<%=bean.getNo()%>'"	>&nbsp;&nbsp;
					<input type="button" value="수정"
						onclick="location.href='BikeMain.jsp?center=board/Notice/Update.jsp?no=<%=bean.getNo()%>'">&nbsp;&nbsp;

					<input type="hidden" name="id" value="<%=bean.getId()%>">


					<%
						} else {
					%>
					<div id="listbtn">
						<input type="button"
							onclick="location.href='BikeMain.jsp?center=board/Notice/NoticeBoardList.jsp'"
							value="목록">&nbsp;&nbsp;
					</div>
					<%
						}
					%>
				</div>

			

		</div>
		<!-- 컨텐트끝 -->

	</div>
	<!-- 컨테이너끝 -->
</body>

</html>