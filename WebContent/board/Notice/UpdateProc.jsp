<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


</head>
<body>
<jsp:useBean id="bean" class="bean.NoticeBoard">

<jsp:setProperty name="bean" property="*"/>

</jsp:useBean>
<%

request.setCharacterEncoding("utf-8");

int no=Integer.parseInt(request.getParameter("no"));

Board board=new Board();

board.updateNoticeBoard(bean);





%>

<script type="text/javascript">
alert("수정이완료되었습니다.");
location.href="/Bike/BikeMain.jsp?center=board/Notice/NoticeInfo.jsp?no="+"<%=no%>"


</script>

<!--response.sendRedirect(request.getContextPath() + "/BikeMain.jsp?center=board/Notice/NoticeBoardList.jsp");  --> 









</body>
</html>