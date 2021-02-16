<%@page import="model.Board"%>
<%@page import="bean.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">

.container {

width:1472px;
height: 1050px;


}

.content {
    width: 1030px;
    margin: 0 auto;
    position: relative;
    min-height: 500px;
}


.read_box{

width: auto;
height: 787px;



}

.read_box #titleTop {
    padding: 10px 15px;
    border-bottom: #056531 1px solid;
    border-top: none;
    line-height: 20px;

}

.read_box #titleTop td {
	color: #222;
    font-size: 14px;
    margin-bottom: 5px;
}



#Ndate {
color: #666;
    font-size: 13px;
    margin-right: 20px;

}

.read_box #id {
    
    width:1000px;
    height:701px;
    
    padding: 10px 15px;
    color: #666;
    font-size: 12px;
    line-height: 18px;

}

</style>


</head>
<body>
<!-- 공지사항게시물 상세화면 -->

<%

int no= Integer.parseInt(request.getParameter("no"));

Board board= new Board();
NoticeBoard bean= board.getNoticeInfo(no);


String id=(String) session.getAttribute("id");

if(id ==null ){
	
	id="GUEST";
}



%>


<div class="container">

<div class="content">
<form action="" method="post">

<div class="read_box">


<!--  -->

<table >
				
				<tr id="titleTop">
						
						<td ><%=bean.getTitle() %></td>
						<td id="Ndate" ><%=bean.getNbdate().substring(0,16) %></td>
				</tr>
				
								
				
					
				
				
	
				<tr id="dd">
					
						<td ><%=bean.getContent() %></td>
				</tr>
				
				
			<%if(id.equals("admin")) {
				%>
				<tr >
						<td  colspan = "2">
							<input type="button" onclick="location.href='BikeMain.jsp?center=board/Notice/NoticeBoardList.jsp'" 
							value="목록">&nbsp;&nbsp;
							<input type= "button"  value="삭제" 
							onclick="location.href='BikeMain.jsp?center=board/Notice/Del.jsp?no=<%=bean.getNo()%>'"
							
							>&nbsp;&nbsp;
							<input type= "button"  value="수정" onclick="location.href='BikeMain.jsp?center=board/Notice/Update.jsp?no=<%=bean.getNo()%>'" >&nbsp;&nbsp;
							
							<input type="hidden" name="id"value="<%=bean.getId() %>">
							
					
						</td>
				</tr>
				
				<%}else { %>
				<tr >
						<td  colspan = "2">
							<input type="button" onclick="location.href='BikeMain.jsp?center=board/Notice/NoticeBoardList.jsp'" 
							value="목록">&nbsp;&nbsp;
							
							</td>
							</tr>
							<%} %>
				
			</table>		
</div>
</form>

</div>
<!-- 컨텐트끝 -->

</div> 
<!-- 컨테이너끝 -->
</body>
</html>