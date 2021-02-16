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
	del.jsp

	<%
	//int no=Integer.parseInt(request.getParameter("no"));
	int seq = Integer.parseInt(request.getParameter("seq"));

Coment coment = new Coment();
coment.delComent(seq);

/*

int checkNo = Integer.parseInt(request.getParameter("checkNo"));
for (int seq : checkNo) {

	Coment coment = new Coment();
	coment.delComent(seq);
}*/
%>
<script type="text/javascript">

alert("삭제완료");

/*location.href="/Bike/BikeMain.jsp?center=board/Fboard/Info.jsp?no="+"=no%>"; */


location.href = "BikeMain.jsp?center=board/Fboard/List.jsp";



</script>
</body>
</html>