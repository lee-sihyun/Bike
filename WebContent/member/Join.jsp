<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<style type="text/css">




#joinform, #reset {
	-webkit-box-shadow: 0 0 0 1000px white inset;
	color: green;
}

.inptubtn {


    margin-top: 50px;

}


#joinform{
   margin-right: 10px;


}



#inputid,#inputpass,#inputemail,#inputtel{

    line-height: 30px;
    height: 30px;
    font-size: 12px;
    width: 261px;
    display: inline-block;
    -webkit-box-shadow: 0 0 0 1000px white inset;
    border: none;
    border-bottom: 1px #222 solid


}


</style>


</head>

<!-- 회원가입 -->
<body>

	<!-- ID    NOT NULL VARCHAR2(500) 
PASS  NOT NULL VARCHAR2(500) 
EMAIL NOT NULL VARCHAR2(500) 
TEL   NOT NULL VARCHAR2(500) 
JOB   NOT NULL VARCHAR2(500) 
AGE   NOT NULL VARCHAR2(500) 
INFO           VARCHAR2(500)  -->
	<div class="join">

		<form action="member/JoinProc.jsp" method="post" name="joinForm"
			onsubmit="return trim();"
			style="margin-top: 100px; margin-bottom: 100px;">
			<table>
				<tr>

					<td>아이디</td>
					<td><input type="text" name="id" id="inputid"></td>

				</tr>

				<tr>

					<td>비밀번호</td>
					<td><input type="password" name="pass" id="inputpass"></td>

				</tr>



				<tr>

					<td>이메일</td>
					<td><input type="email" name="email"
						placeholder="이메일 주소는'@'형식으로 입력하세요" size="40" id="inputemail"></td>

				</tr>

				<tr>

					<td>전화번호</td>
					<td><input type="tel" name="tel" id="inputtel"></td>

				</tr>



				<tr>

					<td>직업</td>
					<td><select name="job">
							<option value="개발자">개발자</option>
							<option value="학생">학생</option>
							<option value="그외">그외</option>

					</select></td>

				</tr>

				<tr>

					<td>나이</td>
					<td><input type="radio" name="age" value="10">10대&nbsp;&nbsp;
						<input type="radio" name="age" value="20">20대&nbsp;&nbsp;
						<input type="radio" name="age" value="30">30대&nbsp;&nbsp;
						<input type="radio" name="age" value="40">40대&nbsp;&nbsp;
						<input type="radio" name="age" value="etc">그외&nbsp;&nbsp;


					</td>

				</tr>

				<tr>

					<td>가입메세지</td>
					<td><textarea rows="5" cols="40">
					
				
					</textarea></td>

				</tr>











			</table>

			<div class="inptubtn">

				<input type="submit" value="회원가입" id="joinform"> <input
					type="reset" value="초기화" id="reset">
			</div>
		</form>

	</div>
	<!-- ID    NOT NULL VARCHAR2(500) 
PASS  NOT NULL VARCHAR2(500) 
EMAIL NOT NULL VARCHAR2(500) 
TEL   NOT NULL VARCHAR2(500) 
JOB   NOT NULL VARCHAR2(500) 
AGE   NOT NULL VARCHAR2(500) 
INFO           VARCHAR2(500)  -->

	<script type="text/javascript">
		/*공백체크*/
		function trim() {
			var f = document.joinForm;

			if (f.id.value == "") {
				alert("아이디를 입력하세요");
				f.id.focus();
				return false;
			}

			if (f.pass.value == "") {
				alert("비밀번호를 입력하세요");
				f.pass.focus();
				return false;
			}

			if (f.email.value == "") {
				alert("이메일를 입력하세요");
				f.email.focus();
				return false;
			}

			if (f.tel.value == "") {
				alert("전화번호를 입력하세요");
				f.tel.focus();
				return false;
			}

			if (f.job.value == "") {
				alert("직업을 선택하세요");
				f.job.focus();
				return false;
			}

			if (f.age.value == "") {
				alert("나이를 선택하세요");
				f.age.focus();
				return false;
			}

		}
		</script>


</body>
</html>