<%@page import="bean.BoardBean"%>
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
		request.setCharacterEncoding("UTF-8");

	/*String id= (String)Integer.parseInt(request.getParameter("id"));*/
	String id = (String) session.getAttribute("id");
	
	/*
	if (id == null) {
		id = "GUEST";
	}*/
	
	

		BoardBean bean=new BoardBean();

	

	
	%>

	





	<form action="board/Fboard/BoardWriteProc.jsp" method="get"
		name="BwcForm" onsubmit="return trim();">

		<table width="600" border="1" bordercolor="gray">

			<tr height="40">
				<td align="center" width="150">제목</td>
				<td width="450"><input type="text" name="title" size="60"></td>
			</tr>




			<tr height="40">
				<td align="center" width="150">글 내용</td>
				<td width="450"><textarea rows="10" cols="60" name="content"></textarea></td>
			</tr>

			<tr height="40">
				<td align="center" colspan="2"><input type="submit" value="글쓰기"
					id="BwcForm">&nbsp;&nbsp; <input type="reset" value="다시 작성">&nbsp;&nbsp;
					<input type="hidden" name="id" value="<%=bean.getId()%>"> 
			<!-- <input type="hidden" name="no" value="<bean.getNo()%>"> -->
			
			</tr>
		</table>
	</form>

	<!-- 공백체크 -->
	<script type="text/javascript">
		function trim() {

			var f = document.BwcForm;

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