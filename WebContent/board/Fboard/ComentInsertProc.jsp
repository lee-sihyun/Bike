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


	<jsp:useBean id="bean" class="bean.ComentBean">
		<jsp:setProperty name="bean" property="*" />
	</jsp:useBean>
<%

request.setCharacterEncoding("utf-8"); 

String id=(String) session.getAttribute("id");
int no=Integer.parseInt(request.getParameter("no"));

bean.setId(id);
bean.setNo(no);


Coment cm= new Coment();
cm.InsertComent(bean);


%>




	<script type="text/javascript">
	
	alert("댓글작성이 완료 되었습니다");


	location.href="/Bike/BikeMain.jsp?center=board/Fboard/Info.jsp?no="+"<%=no%>";
	
	</script>


</body>
</html>