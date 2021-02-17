<%@page import="org.apache.tomcat.util.net.openssl.OpenSSLSessionStats"%>
<%@page import="java.util.Vector"%>
<%@page import="bean.ComentBean"%>
<%@page import="model.Coment"%>
<%@page import="bean.BoardBean"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
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
	height: 787px;
}

.read_box #titleTop {
	padding: 10px 15px;
	border-bottom: #056531 1px solid;
	border-top: none;
	line-height: 20px;
}

.read_box #titleTop td {
	color: #222;
	font-size: 14px;
	margin-bottom: 5px;
}

#Ndate {
	color: #666;
	font-size: 13px;
	margin-right: 20px;
}

.read_box #id {
	width: 1000px;
	height: 701px;
	padding: 10px 15px;
	color: #666;
	font-size: 12px;
	line-height: 18px;
}
</style>


</head>
<body>
	<!-- 자유게시판게시물 상세화면 -->





	<%
		int no = Integer.parseInt(request.getParameter("no"));

	String id = (String) session.getAttribute("id");

	Board board = new Board();
	BoardBean bean = board.getBoardInfo(no);

	
	%>


	<div class="container">

		<div class="content">




			<!--  -->

			<table>

				<tr id="titleTop">

					<td>제목 &nbsp;&nbsp;<%=bean.getTitle()%></td>
					<td id="Ndate">작성시간 &nbsp;&nbsp;<%=bean.getDay().substring(0, 16)%></td>
				</tr>

				<tr>

					<td>작성자&nbsp;&nbsp; <%=bean.getId()%></td>
				</tr>

				<tr>
					<td>내용</td>
					<td><%=bean.getContent()%></td>
				</tr>
			</table>



			


			<!-- 댓글출력 -->



			<form action="board/Fboard/ComentUpdateProc.jsp" method="get">
				<table>


					<!-- 댓글 -->
					<tr id="dd" style="text-align: center;">
						<td>작성자</td>
						<td>내용</td>
						<td>작성시간</td>
						<td>수정</td>
						<td>삭제</td>



					</tr>

					<%
						Coment coment = new Coment();
					ComentBean cbean = new ComentBean();
					Vector<ComentBean> v = coment.getComentInfo(no);

					for (int i = 0; i < v.size(); i++) {

						cbean = v.get(i);
					%>
					<tr style="text-align: center;">




						<td><%=cbean.getId()%></td>
						<td><%=cbean.getComent()%></td>
						<td><%=cbean.getDday().substring(0, 16)%></td>

						<td>
						
						<%if((cbean.getId()).equals(id)) { %>
						
						<input type="button" value="수정"
							onclick="location.href='BikeMain.jsp?center=board/Fboard/Update.jsp?seq=<%=cbean.getSeq()%>&&no=<%=bean.getNo()%>'">&nbsp;&nbsp;



							<input type="button" value="삭제"
							onclick="location.href='BikeMain.jsp?center=board/Fboard/ComentDel.jsp?seq=<%=cbean.getSeq()%>&&no=<%=bean.getNo()%>'">

							<input type="hidden" value="<%=bean.getNo()%>" name="no">
							<input type="hidden" value="<%=cbean.getSeq()%>" name="seq">

					<%} %>

						</td>


					</tr>
					<%
						}
					%>









				</table>
			</form>

			<!-- 댓글출력 -->



			<!-- 수정폼이동 -->









			<!-- 댓글입력창 비회원 사용자는 입력할수없음 -->



			<%
				if (id == null) {
			%>



			<p>회원만 작성가능합니다.</p>


			<%
				} else {
			%>

			<form action="board/Fboard/ComentUpdateProc.jsp?" method="get"  onsubmit="return Comenttrim();" name="comentForm">


				<div class="comentdiv">



					<input type="text" name="coment" value="<%=cbean.getComent() %>" > 
					
					
					
					<input
						type="submit" value="제출"> 
						<input type="hidden" name="no"
						value="<%=bean.getNo()%>"> 
						<input type="hidden" name="id"
						value="<%=id%>">



				</div>

			</form>

			<%
				}
			%>
			<!-- 댓글 입력끝 -->


			<!-- 게시물 처리 버튼 -->

			<div class="BtnList">


				<input type="button"
					onclick="location.href='BikeMain.jsp?center=board/Fboard/List.jsp'"
					value="목록">&nbsp;&nbsp;


				<!-- 작성자의 아이디와 현재 로그인 사용자의 아이디가 동일하면 생성 -->

				<%
					if ((bean.getId()).equals(id)) {
				%>


				<input type="button" value="수정"
					onclick="location.href='BikeMain.jsp?center=board/Fboard/Update.jsp?no=<%=bean.getNo()%>'">&nbsp;&nbsp;


				<input type="button" value="삭제"
					onclick="location.href='BikeMain.jsp?center=board/Fboard/Del.jsp?no=<%=cbean.getNo()%>'">

				<input type="hidden" value="<%=cbean.getNo()%>" name="no"> <input
					type="hidden" value="<%=cbean.getSeq()%>" name="seq">






				<%
					}
				%>



			</div>

			<!-- 게시물 처리 버튼 -->












		</div>


		<!-- 컨텐트끝 -->
	</div>

	<!-- 컨테이너끝 -->
	<script type="text/javascript">
	
	function Comenttrim() {

		var f = document.comentForm;

		if (f.coment.value == "") {
			alert("내용을 입력하세요");
			f.coment.focus();
			return false;
		}

	}

	</script>

</body>
</html>