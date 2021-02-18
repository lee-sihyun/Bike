<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>


<body>


	<!-- 공지사항 게시글 작성 -->
	


	<jsp:useBean id="boardbean" class="bean.BoardBean">
		<jsp:setProperty name="boardbean" property="*" />
	</jsp:useBean>




	<%
	
	
	request.setCharacterEncoding("utf-8");
	
	//int no=Integer.parseInt(request.getParameter("no"));



	/*히든값으로 가져온 아이디 설정*/
	String id=(String) session.getAttribute("id");
	boardbean.setId(id)	;
	
	
	Board bd = new Board();
	bd.insertBoard(boardbean);
	
	

	
	%>
	
	<script type="text/javascript">
	
	alert("게시글 작성이 완료 되었습니다");

	location.href="/Bike/BikeMain.jsp?center=board/Fboard/List.jsp";
	
	
	
	</script>
	
	
	
</body>
</html>