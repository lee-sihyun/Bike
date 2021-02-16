<%@page import="bean.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<%
		int pageSize = 10;

	String pageNum = request.getParameter("pageNum");

	if (pageNum == null) {
		pageNum = "1";
	}

	int count = 0;
	int number = 0;

	int currentPage = Integer.parseInt(pageNum);

	Board board = new Board();

	count = board.getAllCount();

	int startRow=(currentPage-1)*pageSize+1;
	int endRow=currentPage*pageSize;

	Vector<BoardBean> vec = board.getAllBoard(startRow, endRow);

	number = count - (currentPage - 1) * pageSize;
	%>



	<h2>자유게시판</h2>



	<table>

		<tr height="">
			<td width="" align="center">글번호</td>
			<td width="" align="center">제목</td>
			<td width="" align="center">작성자</td>
			<td width="" align="center">작성일</td>
			<td width="" align="center">조회수</td>



		</tr>


		<%
			for (int i = 0; i < vec.size(); i++) {
			BoardBean bean = vec.get(i);
		%>

		<tr height="">
		
		<!--  <td width="250" align="center"><number--</td>-->
		 <td width="" align="left">
		<%=number--%>
		
		</td>	
		
			<td>  <a href="BikeMain.jsp?center=board/Fboard/Info.jsp?no=<%=bean.getNo()%>"><%=bean.getTitle()%></a></td>
			
			<td width="" align="center"><%=bean.getId()%></td>
			<td width="" align="center"><%=bean.getDay().substring(0,16)%></td>
			<td width="" align="center"><%=bean.getReadcount()%></td>



		</tr>

		<%
			}
		%>



	</table>



<p>


	<%
		if (count > 0) {
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		int startPage = 1;
		if (currentPage % 10 != 0) {
			startPage = (int) (currentPage / 10) * 10 + 1;
		} else {
			startPage = ((int) (currentPage / 10) - 1) * 10 + 1;
		}

		
		int pageBlock=10;
		int endPage=startPage*pageBlock-1;
		
		if(endPage>pageCount) endPage=pageCount;
		
		if(startPage>10) {
			
	
		%>

	<a href="BikeMain.jsp?center=board/Fboard/List.jsp?pageNum=<%=startPage+10 %>
		">이전</a>
		
	
		<%
	
		
		
		}
		
		
		//페이징 처리 
		for(int i=startPage; i<=endPage ; i++) {
			
%>	
			
			<a href="BikeMain.jsp?center=board/Fboard/List.jsp?pageNum=<%=i%>">[<%=i %>]</a>
			
			
<%
			
			
			
		}
		
		//다음이라는 링크를 만들건지 파악
		if(endPage <pageCount){
			
			
%>	
			
			<a href="BikeMain.jsp?center=board/Fboard/List.jsp?pageNum=<%=startPage+10%>">[다음]</a>
			
			
<%
		
			
			
		}
		
		
	}
	
	
			
			%>
			
</p>








</body>
</html>