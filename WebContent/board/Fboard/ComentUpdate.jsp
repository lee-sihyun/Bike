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
	color: #fff;
	cursor: pointer;
	background-color: #056531;
	padding: 0 20px;
	height: 44px;
}

#ldubtn, #listbtn {
	text-align: center;
}

/*<!--코멘트 !-->*/
#cmtd {
	border-bottom: 1px solid #444444;
	padding: 10px 15px;
}

.comentList input {
	color: green;
	margin-right: 15px;
	-webkit-box-shadow: 0 0 0 1000px white inset;
}

.BtnList {
	margin-top: 20px;
}

.comentdiv {
	margin-top: 20px;
}

#cms {
	color: #fff;
	cursor: pointer;
	background-color: #056531;
	padding: 0 20px;
	height: 22px;
	border: 0;
}

.BtnList input {
	color: green;
	margin-right: 15px;
	-webkit-box-shadow: 0 0 0 1000px white inset;
}
</style>


</head>
<body>
	<!-- 댓글 수정화면-->





	<%
		int no = Integer.parseInt(request.getParameter("no"));

	String id = (String) session.getAttribute("id");

	Board board = new Board();
	BoardBean bean = board.getBoardInfo(no);
	%>
	<div class="container">

		<div class="content">


			<div class="read_box">


				<table>

					<tr id="titleTop" style="height: 100px;">




						<td>제목 &nbsp;&nbsp;<strong><b><%=bean.getTitle()%></b></strong>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성자&nbsp;&nbsp;<strong><b><%=bean.getId()%>&nbsp;&nbsp;</b></strong>님
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(작성시간
							&nbsp;&nbsp;<%=bean.getDay().substring(0, 16)%>)
					</tr>



					<tr>

						<td colspan="2"><%=bean.getContent()%></td>
					</tr>
				</table>


			</div>




			<!-- 댓글출력 read_box -->


			<div class="comentList" style="border: 1px solid;">
				<form action="board/Fboard/ComentUpdateProc.jsp" method="get">
					<table>

						<colgroup>
							<col width="20%">
							<col width="30%">
							<col width="20%">
							<col width="15%">
							<col width="15%">

						</colgroup>


						<tr id="cmtd" style="text-align: center;">
							<td id="cmtd">작성자</td>
							<td id="cmtd">내용</td>
							<td id="cmtd">작성시간</td>
							<td id="cmtd">수정</td>
							<td id="cmtd">삭제</td>



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
								<%
									if ((cbean.getId()).equals(id)) {
								%> <input type="button" value="수정"
								onclick="location.href='BikeMain.jsp?center=board/Fboard/ComentUpdate.jsp?seq=<%=cbean.getSeq()%>&&no=<%=bean.getNo()%>'">&nbsp;&nbsp;





								<input type="hidden" value="<%=bean.getNo()%>" name="no">
								<input type="hidden" value="<%=cbean.getSeq()%>" name="seq">

								<%
									}
								%>

							</td>

							<td>
								<%
									if ((cbean.getId()).equals(id)) {
								%> <input type="button" value="삭제"
								onclick="location.href='BikeMain.jsp?center=board/Fboard/ComentDel.jsp?seq=<%=cbean.getSeq()%>&&no=<%=bean.getNo()%>'">

								<input type="hidden" value="<%=bean.getNo()%>" name="no">
								<input type="hidden" value="<%=cbean.getSeq()%>" name="seq">
								<%
									}
								%>
							</td>
						</tr>
						<%
							}
						%>









					</table>
				</form>
			</div>

			<!-- 댓글출력 .comentList끝  -->



			<!-- 수정폼이동 -->









			<!-- 댓글입력창 비회원 사용자는 입력할수없음 -->



			<%
				if (id == null) {
			%>



			<p>회원만 작성가능합니다.</p>


			<%
				} else {
			%>

			<form action="board/Fboard/ComentUpdateProc.jsp?" method="get"
				onsubmit="return Comenttrim();" name="comentForm">


				<div class="comentdiv">



					<input type="text" name="coment" value="<%=cbean.getComent()%>">




					<input type="submit" value="제출" id="cms"
						style="border: none; border-bottom: 1px solid;"> <input
						type="hidden" name="seq" value="<%=cbean.getSeq()%>"> <input
						type="hidden" name="no" value="<%=bean.getNo()%>"> <input
						type="hidden" name="id" value="<%=id%>">



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

			<!-- BtnList 게시물 처리 버튼 -->



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