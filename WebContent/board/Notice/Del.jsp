<%@page import="bean.NoticeBoard"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



</head>
<body>
<%

int no=Integer.parseInt(request.getParameter("no"));

Board board= new Board();
board.delNoticeBoard(no);



%>


<script type="text/javascript">




alert("삭제완료");
location.href = "BikeMain.jsp?center=board/Notice/NoticeBoardList.jsp";
</script>




</body>
</html>