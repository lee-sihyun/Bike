<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">


body{

margin: 0 auto;
/*width:1265px;*/
height:200px;

}



</style>



</head>



<body>

	<%
		String center = request.getParameter("center");

	if (center == null) {

		center = "Center.jsp";
	}
	%>


	<table>

		<!-- 탑 -->
		<tr align="center" class="top">

			<td><jsp:include page="Top.jsp"></jsp:include></td>
		</tr>


		<!-- 센터 -->

		<tr align="center" class="center">

			<td><jsp:include page="<%=center %>"></jsp:include></td>
		</tr>
		
		<!-- 푸터 -->


		<tr align="center" class="footer">

			<td><jsp:include page="Footer.jsp"></jsp:include></td>
		</tr>


	</table>



</body>
</html>