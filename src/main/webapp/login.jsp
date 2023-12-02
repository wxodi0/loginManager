<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp"%>
	<h3>회원가입</h3>
	<form name="join" action="loginOk.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input name="userid" type="text"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="usernm" type="text"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input name="passwd" type="password"></td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input name="passwdCheck" type="password"></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><input name="jumin1" type="text"> - <input name="jumin2" type="text"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="1">남
					<input type="radio" name="gender" value="2">여
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input name="address" type="text"></td>
			</tr>
			<tr>
				<td>직업</td>
				<td>
					<select name="jobcd">
						<option value="1">학생</option>
						<option value="2">회사원</option>
						<option value="3">공무원</option>
						<option value="4">군인</option>
						<option value="9">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>메일수신여부</td>
				<td><input name="mailrcv" type="checkbox" value="Y"></td>
			</tr>
			<tr>
				<td>자기소개</td>
				<td><textarea name="intro"></textarea></td>
			</tr>
			<tr>
				<td><input type="button" value="가입" onClick="login()"></td>
			</tr>
			<tr>
				<td><a href="index.jsp">홈으로</a></td>
			</tr>
		</table>
	</form>
<%@include file="footer.jsp"%>
</body>
<script type="text/javascript">
	const form = document.join;
	function login() {
		if(form.userid.value == "") {
			alert("아이디를 입력해주세요");
			form.userid.focus();
		}else if(form.userid.value.length < 4 || form.userid.value.length > 12) {
			alert("아이디는 4자~12자 이내로 입력가능합니다.");
			form.userid.focus();
		}else if(form.usernm.value == "") {
			alert("이름을 입력해주세요");
			form.usernm.focus();
		}else if(form.usernm.value[0] >= 0) {
			alert("이름 첫자리에는 숫자가 들어갈 수 없습니다");
			form.usernm.focus();
		}else if(form.passwd.value == "") {
			alert("비밀번호를 입력해주세요");
			form.passwd.focus();
		}else if(form.passwd.value.length < 4) {
			alert("비밀번호가 너무 짧습니다. 다시 입력해주세요");
			form.passwd.focus();
		}else if(form.passwdCheck.value == "") {
			alert("비밀번호 확인을 입력해주세요");
			form.passwdCheck.focus();
		}else if(form.passwdCheck.value != form.passwd.value) {
			alert("비밀번호가 맞지 않습니다.");
			form.passwdCheck.focus();
		}else if(form.jumin1.value == "") {
			alert("주민번호 앞자리를 입력해주세요");
			form.jumin1.focus();
		}else if(form.jumin2.value == "") {
			alert("주민번호 뒷자리를 입력해주세요");
			form.jumin2.focus();
		}else if(form.gender.value == "") {
			alert("성별을 선택해주세요");
			form.gender.focus();
		}else if(form.address.value == "") {
			alert("주소를 입력해주세요");
			form.address.focus();
		}else if(form.jobcd.value == "") {
			alert("집업을 선택해주세요");
			form.jobcd.focus();
		}else if(form.mailrcv.value == "") {
			alert("메일수신여부를 체크해주세요");
			form.mailrcv.focus();
		}else if(form.intro.value == "") {
			alert("자기소개를 입력해주세요");
			form.intro.focus();
		}else {
			form.submit();
		}
	}
</script>
</html>