<%@page import="bean.BikeBean"%>
<%@page import="model.Bike"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<style type="text/css">

/*input{

ine-height: 43px;
	text-align: center;
	display: block;
	cursor: pointer;
	width: 100%;
	height: 43px;
	font-weight: bold;
	font-size: 14px;
	border-radius: 3px;
	color: #fff;
	background: #056531;

}
*/

</style>


</head>

<!-- 상세 페이지로 이동 -->
<body>

	<%
		///bikere 테이블 이용
	int no = Integer.parseInt(request.getParameter("no"));

	Bike bike = new Bike();
	BikeBean bean = bike.getReinfo(no);

	int cate = bean.getCategory();
	String temp = "";

	if (cate == 1)
		temp = "마포";
	else if (cate == 2)
		temp = "강남";
	else if (cate == 3)
		temp = "도봉";
	else if (cate == 4)
		temp = "영등포";
	else if (cate == 5)
		temp = "송파";
	

	
	
	
	%>


	<form action="BikeMain.jsp?center=reserve/ReResult.jsp" method="post" onsubmit="retrun trim();" name="ReservForm">
		<table>



			<tr>
			
				


		

			

				<td rowspan="6" width="500" align="center"><img alt=""
					src="img/bike/<%=bean.getImg()%>" width="450"></td>

				<td>지역</td>
				<td><%=temp%> 따릉이</td>


			</tr>
			
			<tr>


				<td>가격</td>
				<td><%=bean.getPrice()%>원</td>

			</tr>
			


	<tr>

				<td>대여일</td>
				<td><input type="date" name="rday" size="15"></td>



			</tr>



			<tr>
				<td>대여기간</td>
				<td><select name="dday">

						<option value="1">1일</option>
						<option value="2">2일</option>
						<option value="3">3일</option>
						<option value="4">4일</option>
						<option value="5">5일</option>
						<option value="6">6일</option>
						<option value="7">7일</option>
				</select></td>
			</tr>

			<tr>


				<td>충전기추가</td>
				<td><select name="charger">

						<option value="1">선택안함</option>
						<option value="2">추가(2000원)</option>

				</select></td>



			</tr>



	
			




		

		
			

		

		</table>
		<input type="hidden" name="no" value="<%=bean.getNo()%>"> 
		
				<input type="hidden" name="price" value="<%=bean.getPrice()%>">
			
		
		<input
			type="hidden" name="img" value="<%=bean.getImg()%>"> <input
			type="submit" value="예약하기">

	</form>

<script type="text/javascript">

		/*공백체크*/
		function trim() {
			var f = document.ReservForm;

			if (f.rday.value == null) {
				alert("대여일을 선택 하세요");
				f.rday.focus();
				return false;
			}

			

		}
		</script>

</body>
</html>