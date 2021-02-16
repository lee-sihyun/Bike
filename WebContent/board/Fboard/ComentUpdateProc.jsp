<%@page import="bean.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>

	<jsp:useBean id="bean" class="bean.BoardBean">

		<jsp:setProperty name="bean" property="*" />

	</jsp:useBean>



<%

NoticeBoard board= new NoticeBoard();
/*board.updateNotice(bean)*/

%>





</body>
</html>