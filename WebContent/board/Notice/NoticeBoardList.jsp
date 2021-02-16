<%@page import="java.util.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
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
	/*padding: 20px 15px;*/
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
		request.setCharacterEncoding("UTF-8");

	String id = (String) session.getAttribute("id");

	if (id == null) {

		id = "GUEST";
	}

	
	
	
	
	
	/*페이징 처리*/

	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}

	int count = 0;
	int number = 0;

	int currentPage = Integer.parseInt(pageNum);

	Board board = new Board();

	count = board.getNoticeAllCount();

	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	Vector<NoticeBoard> vec = board.getAllNotice(startRow, endRow);

	number = count - (currentPage - 1) * pageSize;
	
	
	
	/*시간설정*/
	

	
	
	%>

<jsp:useBean id="nbbean" class="bean.NoticeBoard">
<jsp:setProperty name="nbbean" property="*"/>
</jsp:useBean>
<%
/*Date d1=new Date();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
d1=nbbean.getNbdate();

d1=sdf.parse(sdf.format(d1));*/


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



							<a><input type="submit" name="searchButton" id="searchButton"
								value="검색"></a>



						</div>



					</form>
				</div>


				<div class="board_box">


					<table>

						<colgroup>
							<col width="25%">
							<col width="50%">
							<col width="75%">

						</colgroup>
						<tbody>


							<tr>

								<th>글번호</th>
								<th>제목</th>
								<th>날짜</th>

							</tr>

							<%
								for (int i = 0; i < vec.size(); i++) {
								NoticeBoard bean = vec.get(i);
							%>

							<tr>
								<td><%=number--%></td>
								<td><a
									href="BikeMain.jsp?center=board/Notice/NoticeInfo.jsp?no=<%=bean.getNo()%>">
										<%=bean.getTitle()%></a></td>
								<td><%=bean.getNbdate().substring(0,16)%></td>

							</tr>





						</tbody>


						<%
							}
						%>




					</table>



					<%
						if (id.equals("admin")) {
					%>

					<button id="writeBtn"
						onclick="location.href='BikeMain.jsp?center=board/Notice/BoardWrite.jsp'">
						글작성</button>


					<%
						}
					%>


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
							href="BikeMain.jsp?center=board/Notice/NoticeBoardList.jsp?pageNum=<%=startPage + 10%>">이전</a>


						<%
							}

						//페이징 처리 
						for (int i = startPage; i <= endPage; i++) {
						%>

						<a
							href="BikeMain.jsp?center=board/Notice/NoticeBoardList.jsp?pageNum=<%=i%>">[<%=i%>]
						</a>


						<%
							}

						//다음이라는 링크를 만들건지 파악
						if (endPage < pageCount) {
						%>

						<a
							href="BikeMain.jsp?center=board/Notice/NoticeBoardList.jsp?pageNum=<%=startPage + 10%>">[다음]</a>


						<%
							}

						}
						%>


					</p>





				</div>



			</div>









		</div>


	</div>

	<!-- container 끝 -->


</body>
</html>