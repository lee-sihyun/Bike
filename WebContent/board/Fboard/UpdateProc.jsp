<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
<jsp:useBean id="bean" class="bean.BoardBean">

<jsp:setProperty name="bean" property="*"/>

</jsp:useBean>
<%

request.setCharacterEncoding("utf-8");

int no=Integer.parseInt(request.getParameter("no"));

Board board=new Board();

board.updateBoard(bean);





%>

<script type="text/javascript">
alert("수정이완료되었습니다.");
location.href="/Bike/BikeMain.jsp?center=board/Fboard/Info.jsp?no="+"<%=no%>"

</script>









</body>
</html>