<%@page import="bean.BikeBean"%>
<%@page import="model.Reserve"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<!-- 예약처리 완료  -->


	<jsp:useBean id="rbean" class="bean.BikeRe">

		<jsp:setProperty name="rbean" property="*" />


	</jsp:useBean>
	
	

	
	

	<%
		String id = (String) session.getAttribute("id");
	if (id == null) {


	%>
	
	<script type="text/javascript">
	alert("로그인후 예약이 가능합니다");
	location.href="BikeMain.jsp?center=member/Login.jsp";
	</script>

	<%
	
	}
	
	Date d1=new Date();
	Date d2=new Date();
	
		
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

			d1=sdf.parse(rbean.getRday());
			d2=sdf.parse(sdf.format(d2));
	
		
			
			int compare =d1.compareTo(d2);
			if(compare < 0) {//기준일보다 이전 날짜 선택
	
	
	%>
	
	<script type="text/javascript">
	
	alert("오늘보다 이전 날짜는 선택 할 수 없습니다.");
	history.go(-1);
	</script>
	
	<%} 
			
			/*아이디*/
	String id2=(String) session.getAttribute("id");
		rbean.setId(id2);

		Reserve re = new Reserve();
		re.setReBike(rbean);
	
		/*자전거정보*/
			BikeBean bikebean= re.getBikeInfo(rbean.getNo());
			
		/*옵션설정*/
		int charger=0;
		if(rbean.getCharger()==2)charger=2000;
		
	
			
		
		
		/*자전거비용=(자전거비용*대여기간)+옵션가*/
		int bikePrice=bikebean.getPrice()*rbean.getDday();
	/*int bikePrice=(bikebean.getPrice()*rbean.getDday()+charger ) ;*/

	
	
	%>
	
	
	
				<table>
			<tr>
				<td align="center" colspan="2">
					예약 완료 화면
				</td>
			</tr>
			
			<tr >
				<td align="center">
					<img alt="" src="img/bike/<%=bikebean.getImg() %>"  width="470">
				</td>
			</tr>
			
			<tr >
				<td align="center">
					 예약 금액<%=bikePrice %>원
				</td>
			</tr>
			
			<tr >
				<td align="center">
					옵션 금액 <%=charger %>원 
				</td>
			</tr>
			
			<tr >
				<td align="center">
					총 금액원<%= bikePrice+charger%> 원
				</td>
			</tr>
		</table>
	
	
	


</body>
</html>