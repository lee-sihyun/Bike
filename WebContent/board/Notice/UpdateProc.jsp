<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
<jsp:useBean id="bean" class="bean.NoticeBoard">

<jsp:setProperty name="bean" property="*"/>

</jsp:useBean>
<%



//int no=Integer.parseInt(request.getParameter("no"));

Board board=new Board();

board.upDateBoard(bean);





%>

<script type="text/javascript">
alert("수정이완료되었습니다.");


</script>

<%response.sendRedirect(request.getContextPath() + "/BikeMain.jsp?center=board/Notice/NoticeBoardList.jsp"); %>









</body>
</html>