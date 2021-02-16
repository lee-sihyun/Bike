<%@page import="org.apache.tomcat.util.net.openssl.OpenSSLSessionStats"%>
<%@page import="java.util.Vector"%>
<%@page import="bean.ComentBean"%>
<%@page import="model.Coment"%>
<%@page import="bean.BoardBean"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.container {
	width: 1472px;
	height: 1050px;
}

.content {
	width: 1030px;
	margin: 0 auto;
	position: relative;
	min-height: 500px;
}

.read_box {
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
	width: 1000px;
	height: 701px;
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
		int no = Integer.parseInt(request.getParameter("no"));

	String id = request.getParameter("id");

	Board board = new Board();
	BoardBean bean = board.getBoardInfo(no);

	/*
	Coment coment =new Coment();
	ComentBean cbean =new ComentBean();
	int seq=cbean.getSeq();

	*/
	/*
	Coment coment =new Coment();
	ComentBean cbean= coment.getComentInfo(no);
		
		*/
	/*
	Coment coment =new Coment();
	ComentBean cbean =new ComentBean();
	int seq=cbean.getSeq();
	 cbean= coment.getComentInfo(no,seq);
	*/
	%>


	<div class="container">

		<div class="content">
			<form action="board/Fboard/ComentUpdateProc.jsp" method="get"
				onsubmit="return trim();" name="BudForm">



				<!--  -->

				<table>

					<tr id="titleTop">

						<td><%=bean.getTitle()%></td>
						<td id="Ndate"><%=bean.getDay().substring(0, 16)%></td>
					</tr>

					<tr>
						<td><%=bean.getContent()%></td>
					</tr>
				</table>
			</form>






			<!-- 댓글출력 -->

			<table>


				<!-- 댓글 -->
				<tr id="dd" style="text-align: center;">
					<td>작성자</td>
					<td>내용</td>
					<td>작성시간</td>
				 <td>삭제</td> 



				</tr>

				<%
					Coment coment = new Coment();
				ComentBean cbean = new ComentBean();
				Vector<ComentBean> v = coment.getComentInfo(no);

				for (int i = 0; i < v.size(); i++) {

					cbean = v.get(i);
				%>
				<tr style="text-align: center;">

					


					<td><%=cbean.getId()%></td>
					<td><%=cbean.getComent()%></td>
					<td><%=cbean.getDday().substring(0, 16)%></td>
					
						
					<!-- <td><input type="checkbox" name="checkNo" id="checkNo"
						value="<cbean.getSeq()%>" class="check"></td>
					 -->
					

				</tr>
				<%
					}
				%>









			</table>

			<!-- 댓글출력 -->



			<!-- 수정폼이동 -->









			<!-- 댓글입력창 비회원 사용자는 입력할수없음 -->



<%

String id2 = (String) session.getAttribute("id");
if (id2 == null) {
	id2= "GUEST";



 %>



<p>test</p>


<%}else { %>

			<form action="board/Fboard/ComentInsertProc.jsp?" method="get">


				<div class="comentdiv">



					<input type="text" name="coment" placeholder="댓글을 입력하세요"> <input
						type="submit" value="제출" > <input type="hidden" name="no"
						value="<%=bean.getNo()%>">
						
						<!-- <input type="hidden" name="no"
						value="<no>">이것도안됨 -->
						 <input type="hidden" name="id"
						value="<%=id2%>">



				</div>

			</form>
			
<%} %>
			<!-- 댓글입력끝 -->

			<!-- BikeMain.jsp?center=board/Notice/NoticeInfo.jsp?no=<=bean.getNo()%> -->



			<input type="button"
				onclick="location.href='BikeMain.jsp?center=board/Fboard/List.jsp'"
				value="목록">&nbsp;&nbsp;

			<!-- 삭제이동 -->

			<%
				/*String id2=request.getParameter("id");
				if (id2==cbean.getId()) {
					
					System.out.println("출력");
				}else{
					
					System.out.println("출력오류");
					
				}*/

			/*
			String id2=request.getParameter("id");
			System.out.println(id2);
			System.out.println(cbean.getId());
			System.out.println(bean.getId());
			*/
			/*이거는 게시글 테스트에서 사용할것*/

			/*
			String test1=bean.getId(); 
			String test2=cbean.getId();

			if(test1==test2) {
				System.out.println("아이디같음");
			}else if(test1==null){
				
				System.out.println("아이디다름");
			}
			*/

			/*String t1=bean.getId();
			System.out.println(t1);//게시글의 작성자 아이디 
			*/
			//String t2=bean.getId();
			//System.out.println(t2);

			//String id2=request.getParameter("id");
			//System.out.println(id);
			%>
			<input type="button" value="댓글삭제" id="del" 	
			onclick="location.href='BikeMain.jsp?center=board/Fboard/Del.jsp?seq=<%= cbean.getSeq()%>'">
		

		<!--  <input type="hidden" value="<cbean.getSeq()%>" name="seq">
			<input type="hidden" value="<id%>" name="id">
		-->	
		</div>


		<!-- 컨텐트끝 -->
	</div>

	<!-- 컨테이너끝 -->
	<script type="text/javascript">
		function trim() {

			var f = document.BudForm;

			if (f.coment.value == "") {
				alert("내용을 입력하세요");
				f.coment.focus();
				return false;
			}

		}
		
		/*
		$("#check").change(function() {
			if ($(this).is(":checked")) {
				$(".check").prop("checked", true);
			} else {
				$(".check").prop("checked", false);
			}
		});
		*/
		
	
		
		
		
		
	</script>

</body>
</html>