<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.name {
	border-bottom: 1px #222 solid;
	margin: 40px auto 30px auto;
	width: 270px;
}

.name input {
	line-height: 30px;
	height: 30px;
	font-size: 14px;
	width: 261px;
	display: inline-block;
	-webkit-box-shadow: 0 0 0 1000px white inset;
    border: none;
}

.pass {
	border-bottom: 1px #222 solid;
	width: 270px;
	margin: 0 auto;
}

.pass input {
	line-height: 30px;
	height: 30px;
	font-size: 12px;
	width: 261px;
	display: inline-block;
	-webkit-box-shadow: 0 0 0 1000px white inset;
    border: none;
}

.btn {
	width: 270px;
	margin: 20px auto;
}

.btn input {
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


</style>


</head>


<body>




	<form action="member/LoginProc.jsp" method="post">


		<div class="name">
			<input type="text" name="id" placeholder="아이디">

		</div>

		<div class="pass">
			<input type="password" name="pass" placeholder="비밀번호">

		</div>

		<div class="btn">

			<input type="submit" value="로그인">

		</div>









	</form>



</body>
</html>