<%@page import="bean.ComentBean"%>
<%@page import="model.Coment"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>

	<jsp:useBean id="bean" class="bean.ComentBean">

		<jsp:setProperty name="bean" property="*" />

	</jsp:useBean>




<% 
int seq = Integer.parseInt(request.getParameter("seq"));
int no = Integer.parseInt(request.getParameter("no"));


Coment coment= new Coment();
coment.updateComent(bean);


%>
<script type="text/javascript">
alert("수정이완료되었습니다.");
location.href="/Bike/BikeMain.jsp?center=board/Fboard/Info.jsp?no="+"<%=no%>"

</script>






</body>
</html>