<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.Bike"%>
<%@page import="bean.BikeRe"%>
<%@page import="java.util.Vector"%>
<%@page import="model.Reserve"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
#retrunBtn {
    -webkit-box-shadow: 0 0 0 1000px white inset;
    color: green;
    margin-right: 15px;
}

</style>




</head>
<body>
	<!-- 예약 리스트 -->



	<%
		//int no=Integer.parseInt(request.getParameter("no")); 

	String id = (String) session.getAttribute("id");
	if (id == null) {
	%>


	<script type="text/javascript">
		alert("로그인후 확인이 가능합니다");
		location.href = "BikeMain.jsp?center=member/Login.jsp";
	</script>

	<%
		}
	%>


	<!-- no넘겨서 해당 예약보게하기  -->




	<jsp:useBean id="rbean" class="bean.BikeRe">
		<jsp:setProperty name="rbean" property="*" />
	</jsp:useBean>

	<%
		int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}

	int count = 0;
	int number = 0;

	int currentPage = Integer.parseInt(pageNum);

	Reserve reserve = new Reserve();

	count = reserve.getReAllCount();

	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	Vector<BikeRe> vec = reserve.getAllRe(startRow, endRow);
	%>


	<div class="container">
		<div class="content">


			<div class="top">
				<h3>예약확인</h3>

			</div>


			<div class="board_box">

				<div class="board_box">


					<table>


						<tbody>


							<tr>

								<th>예약번호</th>
								<th>예약일</th>
								<th>예약기간</th>
								<th>가격</th>
								<th>옵션가</th>
								<th>총금액</th>
								<th>상태</th>
								<th>반납</th>
							</tr>

							<%
								for (int i = 0; i < vec.size(); i++) {
								BikeRe bean = vec.get(i);

								int charger = 0;
								if (bean.getCharger() == 2)
									charger = 2000;
							%>

							<tr>






								<td><%=bean.getNo()%></td>

								<td><%=bean.getRday()%></td>
								<td><%=bean.getDday()%>일</td>
								<td><%=bean.getPrice()%></td>
								<td><%=charger%></td>
								<td><%=bean.getPrice() + charger%></td>
								<td><%=bean.getProc()%></td>




								<td>
									<%
										if ((bean.getProc()).equals("예약완료")) {
									%> <input type=button value="반납하기" id="retrunBtn"
									onclick="location.href='BikeMain.jsp?center=reserve/ReturnBike.jsp?no=<%=bean.getNo()%>'">


									<input type="hidden" name="no" value="<%=bean.getNo()%>">
									<input type="hidden" name="id" value="<%=id%>"> <%
 	}
 %>

								</td>


							</tr>





						</tbody>


						<%
							}
						%>




					</table>
				</div>

</div>



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
						href="BikeMain.jsp?center=reserve/ReList.jsp?pageNum=<%=startPage + 10%>">이전</a>


					<%
						}

					//페이징 처리 
					for (int i = startPage; i <= endPage; i++) {
					%>

					<a href="BikeMain.jsp?center=reserve/ReList.jsp?pageNum=<%=i%>">[<%=i%>]
					</a>


					<%
						}

					//다음이라는 링크를 만들건지 파악
					if (endPage < pageCount) {
					%>

					<a
						href="BikeMain.jsp?center=reserve/ReList.jsp?pageNum=<%=startPage + 10%>">[다음]</a>


					<%
						}

					}
					%>


				</p>

			</div>
			<!-- content끝 -->
		</div>

		<!-- container끝 -->
</body>
</html>