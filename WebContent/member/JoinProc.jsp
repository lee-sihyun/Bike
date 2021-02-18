<%@page import="bean.MemberBean"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>

	<jsp:useBean id="mbean" class="bean.MemberBean">
		<jsp:setProperty name="mbean" property="*" />

	</jsp:useBean>
	<%
		request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	
	//dao선언
	Member member = new Member();

	//중복검사 사용  -아이디찾기 
	MemberBean search = member.search(id);

	
	/*System.out.println(search.getId());
	System.out.println(id); */
	

	
	if ((search.getId())==null) {
		member.insertMember(mbean);
	%>

	<script type="text/javascript">
		alert("회원가입을 축하드립니다.");
		location.href = "/Bike/BikeMain.jsp?center=member/Login.jsp";
	</script>



	<%
		} else {
	%>

	<script type="text/javascript">
		alert("이미존재하는아이디입니다.");
		history.go(-1);
	</script>


	<%
		}
	%>
</body>
</html>