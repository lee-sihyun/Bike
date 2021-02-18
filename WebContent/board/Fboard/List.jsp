<%@page import="bean.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<style type="text/css">

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}

.container {
	width: 1309px;
	height: 1500px;
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
	height: 500px;
}

.board_box table {
	border-top: 1px solid #000;
	font-size: 13px;
	width: 100%;
	margin: 0 auto;
}

.board_box table th {
	text-align: center;
	border-bottom:    1px solid #dfdfdf;
}

.board_box table td {
	border-bottom: 1px solid #dfdfdf;
	color: #666;
	/*padding: 20px 15px;*/
	text-align: center;
}

.board_box table tr {
height: 40px;

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
		request.setCharacterEncoding("utf-8");

	String id = (String) session.getAttribute("id");

	if (id == null) {

		id = "GUEST";
	}

	int pageSize = 10;

	String pageNum = request.getParameter("pageNum");

	if (pageNum == null) {
		pageNum = "1";
	}

	int count = 0;
	int number = 0;

	int currentPage = Integer.parseInt(pageNum);

	Board board = new Board();

	count = board.getAllCount();

	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	Vector<BoardBean> vec = board.getAllBoard(startRow, endRow);

	number = count - (currentPage - 1) * pageSize;
	%>


	<div class="container">
		<div class="content">


			<div class="top">
				<h3>자유게시판</h3>

			</div>


			<div class="board_box">

				<table>

					<tr >
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>



					</tr>


					<%
						for (int i = 0; i < vec.size(); i++) {
						BoardBean bean = vec.get(i);
					%>

					<tr height="">

						<!--  <td width="250" align="center"><number--</td>-->
						<td width="" align="left"><%=number--%></td>

						<td><a
							href="BikeMain.jsp?center=board/Fboard/Info.jsp?no=<%=bean.getNo()%>"><%=bean.getTitle()%></a></td>

						<td width="" align="center"><%=bean.getId()%></td>
						<td width="" align="center"><%=bean.getDay().substring(0, 16)%></td>
						<td width="" align="center"><%=bean.getReadcount()%></td>



					</tr>

					<%
						}
					%>



				</table>
			</div>
			
<!-- 페이징처리 -->

			<p>


				<%
					if (count > 0) {
					int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

					int startPage = 1;
					if (currentPage % 10 != 0) {
						startPage = (int) (currentPage / 10) * 10 + 1;
					} else {
						startPage = ((int) (currentPage / 10) - 1) * 10 + 1;
					}

					int pageBlock = 10;
					int endPage = startPage * pageBlock - 1;

					if (endPage > pageCount)
						endPage = pageCount;

					if (startPage > 10) {
				%>

				<a
					href="BikeMain.jsp?center=board/Fboard/List.jsp?pageNum=<%=startPage + 10%>
		">이전</a>


				<%
					}

				//페이징 처리 
				for (int i = startPage; i <= endPage; i++) {
				%>

				<a href="BikeMain.jsp?center=board/Fboard/List.jsp?pageNum=<%=i%>">[<%=i%>]
				</a>


				<%
					}

				//다음이라는 링크를 만들건지 파악
				if (endPage < pageCount) {
				%>

				<a
					href="BikeMain.jsp?center=board/Fboard/List.jsp?pageNum=<%=startPage + 10%>">[다음]</a>


				<%
					}

				}
				%>

			</p>
			<!-- 글쓰기버튼 -->
			
			<%
				if (!(id.equals("GUEST"))) {
			%>

			<button id="writeBtn"
				onclick="location.href='BikeMain.jsp?center=board/Fboard/BoardWrite.jsp'">
				글작성</button>



			<%
				}
			%>
			
			
		</div>
		<!-- content끝 -->
	</div>

	<!-- container끝 -->





</body>
</html>