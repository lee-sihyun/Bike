<%@page import="bean.BikeBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.Bike"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">

#sbbtn, #allbtn{
    -webkit-box-shadow: 0 0 0 1000px white inset;
    color: green;
    margin-right: 15px;
}

#allbtn {
margin-top: 20px;

}
</style>

</head>
<body>

	<!-- 
	
	카테고리별 선택 화면
	1.마포 2.강남 3.도봉 4. 영등포 5.송파 -->

	<%
		int cate = Integer.parseInt(request.getParameter("category"));
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

<h3><%=temp%> 따릉이 목록 </h3>

<div>
	<form action="BikeMain.jsp?center=reserve/BikeCategoryList.jsp" method="post">
		<font size="3" color="gray"><b>지역별 조회</b></font>&nbsp;&nbsp; 
		<select
			name="category">
		
			<option value="1">마포</option>
			<option value="2">강남</option>
			<option value="3">도봉</option>
			<option value="4">영등포</option>
			<option value="5">송파</option>
		</select> <input type="submit" value="검색 " id="sbbtn">&nbsp;&nbsp;

	</form>
 
 	<button onclick="location.href='BikeMain.jsp?center=reserve/BikeList.jsp'" id="allbtn">
		전체조회</button>
	 
</div>

<table id="listtable">
		<tr >
			<td align="center"colspan="3">
			
			</td>
		</tr>
	<% 
		Bike bike = new Bike();
		Vector<BikeBean> v = bike.getCateBike(cate);
		//tr를 3개씩 보여주고 다시 tr을 실행 할수 있도록 하는 변수 선언 
		int j = 0;
		for(int i = 0; i < v.size();i++){
			//벡터에 저장되어 있는 빈클래스를 추출
			BikeBean bean = v.get(i);
			if(j%3==0){
	%>		
			<tr >
	<% 
			}
	%>
			<td  align="center">
				<a href ="BikeMain.jsp?center=reserve/ReInfo.jsp?no=<%=bean.getNo()%>">
			
				
				<img alt ="" src="img/bike/<%=bean.getImg()%>" width="300" height="200"> 
				</a>
			</td>

	<% 		
			j = j+1;//j값을 가하여 하나의 행에 총 3개의 차량정보를 보여주기 위해서 증가
		}
 	%>
	</table>
	<!--  -->
	
	


</body>
</html>