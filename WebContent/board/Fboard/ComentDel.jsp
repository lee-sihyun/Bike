<%@page import="model.Coment"%>
<%@page import="bean.ComentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
	
	
	request.setCharacterEncoding("utf-8");
	int seq = Integer.parseInt(request.getParameter("seq"));
	int no = Integer.parseInt(request.getParameter("no"));
	
	

	Coment coment = new Coment();
	coment.delComent(seq,no);
	
	%>



	<script type="text/javascript">

alert("삭제완료");

location.href="/Bike/BikeMain.jsp?center=board/Fboard/Info.jsp?no="+"<%=no%>"

	</script>
</body>
</html>