<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>


<body>

	<%
		String id = (String) session.getAttribute("id");

	if (id == null) {

		id = "GUEST";
	}
	%>

	<table>
		<tr>
			<td align="center"><img alt="" src="img/Template/Maincenter1.JPG">

			</td>
		</tr>

		<tr>
			<td align="center"><img alt="" src="img/Template/Maincenter2.JPG">

			</td>
		</tr>


		<tr>
			<td align="center"><img alt="" src="img/Template/Maincenter3.JPG"></td>
		</tr>

		<tr>

			<td align="center"><img alt="" src="img/Template/Maincenter4.JPG"></td>



		</tr>

	</table>

</body>
</html>