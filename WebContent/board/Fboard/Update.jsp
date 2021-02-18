<%@page import="bean.BoardBean"%>
<%@page import="model.Board"%>
<%@page import="bean.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<head>
<meta charset="UTF-8">
<style>
.container {
	width: 1472px;
	height: 1050px;
}

.content {
	width: 1030px;
	position: relative;
	min-height: 500px;
}

.read_box {
	width: auto;
	height: 600px;
}

.read_box {
	width: auto;
	height: 450px;
}

.read_box table {
	border: 1px solid;
	width: 802px;
	height: 402px;
	margin-top: 50px;
}

#tbtn {
	text-align: center;
}

#tbtn input {
    color: green;
    margin-right: 15px;
    -webkit-box-shadow: 0 0 0 1000px white inset;
}
</style><body>

	<%
	request.setCharacterEncoding("utf-8");
	int no = Integer.parseInt(request.getParameter("no"));
	Board board = new Board();
	BoardBean bean = board.getBoardInfo(no);
	%>

<h2 style="margin-top: 65px;">게시물 수정</h2>


<div class="container">
		<div class="content">

			<div class="read_box">


	<form action="board/Fboard/UpdateProc.jsp" method="get" name="BudForm"
					onsubmit="return trim();">

		<table>

			<tr height="40">
				<td style="text-align: center;">제목</td>
				<td style="border-bottom: 1px #222 solid;">
				<input type="text" name="title" value=" [수정]<%=bean.getTitle()%>"
								style="line-height: 30px; height: 30px; font-size: 14px; width: 261px; display: inline-block; -webkit-box-shadow: 0 0 0 1000px white inset; border-bottom: 1px solid; border: none;">
							</td>
					
					
					
					
			</tr>




			<tr>
				<td>글 내용</td>

				<td width="450"><textarea rows="10" cols="60"
									style="margin: 0px; height: 260px; width: 728px;"
									name="content">
				<%=bean.getContent()%></textarea></td>



			</tr>

			<tr >
				<td  colspan="2" id="tbtn"><input type="submit" value="수정">&nbsp;&nbsp;
					<input type="reset" value="다시 작성">&nbsp;&nbsp; <input
								type="hidden" name="no" value="<%=bean.getNo()%>"></td>
			</tr>
		</table>
	</form>
	
	
		</div>
			<!-- read_box 끝 -->








		</div>
		<!-- content끝 -->
	</div>
	<!-- container끝 -->
	
	

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