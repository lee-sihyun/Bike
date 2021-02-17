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
<title>Insert title here</title>
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

	int option = rbean.getCharger();
	String temp = "";

	if (option == 1)
		temp = "선택안함";
	else if (option == 2)
		temp = "추가";
	%>

	<div class="board_box">


		<table>
			<!-- <colgroup>
				<col width="20%">
				<col width="20%">
				<col width="20%">
				<col width="20%">
				<col width="20%">

			</colgroup> -->

			<tbody>


				<tr>

					<th>예약번호</th>
					<th>예약일</th>
					<th>예약기간</th>

					<th>상태</th>
					<th>반납</th>
				</tr>

				<%
					for (int i = 0; i < vec.size(); i++) {
					BikeRe bean = vec.get(i);
				%>

				<tr>
					<td><a
						href="BikeMain.jsp?center=reserve/ReResult.jsp?no=<%=bean.getNo()%>">
					</a><%=bean.getNo()%></td>

					<td><%=bean.getRday()%></td>
					<td><%=bean.getDday()%>일</td>
					<td><%=bean.getProc()%></td>

					<td>
					
					<%if((bean.getProc()).equals("예약완료")) { %>
					 <input type=button value="반납하기"
						onclick="location.href='BikeMain.jsp?center=reserve/ReturnBike.jsp?no=<%=bean.getNo()%>'">
						

						<input type="hidden" name="no" value="<%=bean.getNo()%>">
						<input type="hidden" name="id" value="<%=id%>"> 
 	
						<%} %>

					</td>
				
				
				</tr>





			</tbody>


			<%
				}
			%>




		</table>
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


</body>
</html>