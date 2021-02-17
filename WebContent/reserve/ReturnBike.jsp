<%@page import="model.Reserve"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 반납 -->

<body>


<jsp:useBean id="bean" class="bean.BikeRe">

<jsp:setProperty name="bean" property="*"/>

</jsp:useBean>

<% 

int no= Integer.parseInt(request.getParameter("no"));
String id= request.getParameter("id");


Reserve re= new Reserve();

re.upDateProc(bean);



%>


<script type="text/javascript">

alert("반납이 완료되었습니다.");
location.href = "BikeMain.jsp?center=reserve/ReList.jsp";
</script>



</body>
</html>