<%@page import="model.Board"%>
<%@page import="bean.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
</head>
<body>

	<%
		int no = Integer.parseInt(request.getParameter("no"));
	Board board = new Board();
	NoticeBoard bean = board.getNoticeInfo(no);
	%>




	<form action="board/Notice/UpdateProc.jsp" method="get" name="BudForm"
		onsubmit="return trim();">

		<table width="600" border="1" bordercolor="gray">

			<tr height="40">
				<td align="center" width="150">제목</td>
				<td width="450"><input type="text" name="title" size="60"
					value=" [수정]<%=bean.getTitle()%>"></td>
			</tr>




			<tr height="40">
				<td align="center" width="150">글 내용</td>

				<td width="450"><textarea rows="10" cols="60" name="content">
				<%=bean.getContent()%></textarea></td>



			</tr>

			<tr height="40">
				<td align="center" colspan="2"><input type="submit" value="수정">&nbsp;&nbsp;
					<input type="reset" value="다시 작성">&nbsp;&nbsp; <input
					type="hidden" name="no" value="<%=bean.getNo()%>"></td>
			</tr>
		</table>
	</form>

	<!-- 공백체크 -->
	<script type="text/javascript">
		function trim() {

			var f = document.BudForm;

			if (f.title.value == "") {
				alert("제목을 입력하세요");
				f.title.focus();
				return false;
			}

			if (f.content.value == "") {
				alert("내용을 입력하세요");
				f.content.focus();
				return false;
			}

		}
	</script>


</body>
</html>