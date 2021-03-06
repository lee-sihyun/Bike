<%@page import="model.Board"%>
<%@page import="java.util.Vector"%>
<%@page import="bean.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.container {
	width: 1309px;
	height: 855px;
}

.content {
	width: 1030px;
	height: 855px;
	margin-left: 139.500px;
	margin-right: 139.500px;
}

.top {
	width: 1030px;
	height: 100px;
}

.top h3 {
	font-size: 30px;
	padding: 50px 0 30px 0;
	text-align: left;
	letter-spacing: -0.05em;
	color: #333;
}

.board_srch_help {
	width: 1030px;
	height: 43px;
	padding-bottom: 30px;
}

.search {
	padding: 30px 0px;
	text-align: center;
	background-color: #fafafa;
	margin-bottom: 0;
}

.inputDiv {
	border: 1px #dfdfdf solid;
	display: inline-block;
}

#serachInput {
	height: 40px;
	line-height: 40px;
	font-size: 13px;
}

.btn_search {
	height: 42px;
	line-height: 42px;
	text-align: center;
	font-size: 13px;
	display: inline-block;
	margin-left: 5px;
}

#searchInput {
	height: 40px;
	line-height: 40px;
	font-size: 13px;
	width: 500px;
}

#searchButton {
	color: #fff;
	cursor: pointer;
	background-color: #056531;
	padding: 0 20px;
	height: 44px;
	border: 0;
	margin-top: 20px;
}

.board_box {
	width: 1030px;
	height: 609px;
}

.board_box table {
	border-top: 1px solid #000;
	font-size: 13px;
	width: 100%;
	margin: 0 auto;
}

.board_box table th {
	text-align: center;
}

.board_box table td {
	border-bottom: 1px solid #dfdfdf;
	color: #666;
	padding: 20px 15px;
	text-align: center;
}

#writeBtn {
	color: #fff;
	cursor: pointer;
	background-color: #056531;
	padding: 0 20px;
	height: 44px;
	border: 0;
	margin-top: 20px;
}
</style>
</head>
<body>
	<%
		/*써치*/

	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");

	//	if ( || title.equals(null)) {
	if (title == "") {
	%>
	<!-- 전체글목록 -->
	<script type="text/javascript">
		location.href = "BikeMain.jsp?center=board/Notice/NoticeBoardList.jsp";
	</script>



	<%
		}

	Board board = new Board();
	NoticeBoard bean = board.Serch(title);

	if (bean.getTitle() == null) {
	%>

	<script type="text/javascript">
		alert("존재하지 않는 게시글입니다.");
		location.href = "BikeMain.jsp?center=board/Notice/NoticeBoardList.jsp";
	</script>


	<%
		}
	%>





	<div class="container">
		<div class="content">

			<div class="board">

				<div class="top">
					<h3>공지사항</h3>

				</div>

				<div class="search">




					<form
						action="BikeMain.jsp?center=board/Notice/NoticeBoardSearchListProc.jsp"
						method="post" class="board_srch_help">


						<div class="inputDiv">
							<input type="text" name="title" placeholder="검색어를 입력하세요"
								id="searchInput">
						</div>

						<div class="btn_search">



							<a><input type="submit" name="searchButton" id="searchButton">
							</a>



						</div>



					</form>

				</div>


				<div class="board_box">


					<table>

						<colgroup>
							<col width="75%">
							<col width="25%">

						</colgroup>
						<tbody>


							<tr>
								<th>제목</th>
								<th>날짜</th>

							</tr>





							<tr>
								<td><a
									href="BikeMain.jsp?center=board/Notice/NoticeInfo.jsp?no=<%=bean.getNo()%>">
										<%=bean.getTitle()%></a></td>
								<td><%=bean.getNbdate()%></td>

							</tr>





						</tbody>


					</table>

					<button id="writeBtn"
						onclick="location.href='BikeMain.jsp?center=board/Notice/NoticeBoardList.jsp'">
						글목록</button>


				</div>



			</div>
			<div class="paging"></div>

		</div>
		<!-- conetent -->
	</div>
	<!-- container 끝 -->


</body>
</html>