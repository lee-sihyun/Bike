<%@page import="bean.NoticeBoard"%>
<%@page import="model.Board"%>
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

int no=Integer.parseInt(request.getParameter("no"));

Board board= new Board();
board.delNoticeBoard(no);



%>


<script type="text/javascript">

alert("게시물 삭제가 완료 되었습니다.");
location.href = "BikeMain.jsp?center=board/Notice/NoticeBoardList.jsp";
</script>




</body>
</html>