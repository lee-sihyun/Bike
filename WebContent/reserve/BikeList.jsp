<%@page import="bean.BikeBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.Bike"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 추가가 왜안되니 -->
<body>

		<form action="BikeMain.jsp?center=reserve/BikeCategoryList.jsp" method="post">
		<font size="3" color="gray"><b>지역별 조회</b></font>&nbsp;&nbsp; 
		<select
			name="category" >
			
		
			<option value="1">마포</option>
			<option value="2">강남</option>
			<option value="3">도봉</option>
			<option value="4">영등포</option>
			<option value="5">송파</option>
		</select> <input type="submit" value="검색 ">&nbsp;&nbsp;

	</form>

<!-- 213 -->


<table>

<tr >
			<td  colspan="3"><font size="6" color="gray">
			
			<a></a>
			전체 따릉이보기 </font></td>
		</tr>

<%

Bike bike =new Bike();
Vector<BikeBean> v= bike.getAllBike();




	int j = 0;
	for (int i = 0; i < v.size(); i++) {
	
		BikeBean bean = v.get(i);
		if(j%3==0){
		
	
	%>
	<tr >
		<% }%>
		
		
		<td align="center">
		<a href="BikeMain.jsp?center=reserve/ReInfo.jsp?no=<%=bean.getNo()%>">
		
		<img alt="" src="img/bike/<%=bean.getImg()%>" width="300" height="200">
		</a> 
		<p>
		<font size="3" color="gray"><b> <%=bean.getName() %></b></font>
		</p></td>
		
		
		
		<%
		
		j=i+1;
	
	}  %>
	</table>
	

		
		
	
</body>
</html>