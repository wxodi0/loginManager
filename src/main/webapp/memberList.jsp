<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");

String sql = "SELECT * FROM tbl_geuest";

Statement stmt = con.createStatement();

ResultSet rs = stmt.executeQuery(sql);
%>
<%@include file="header.jsp" %>
<table>
	<tr>
		<td>회원ID</td>
		<td>회원명</td>
		<td>비밀번호</td>
		<td>주민등록번호</td>
		<td>성별</td>
		<td>주소</td>
		<td>직업</td>
		<td>메일수신</td>
		<td>자기소개</td>
	</tr>
	<%while(rs.next()){
		String userid = rs.getString(1);
		String usernm = rs.getString(2);
		String passwd = rs.getString(3);
		String jumin = rs.getString(4);
		
		String jumin1 = jumin.substring(0,6);
		String jumin2 = jumin.substring(6,7);
		
		String gen = rs.getString(5);
		if(gen.equals("1")) {
			gen = "남";
		} else {
			gen = "여";
		}
		String address = rs.getString(6);
		String job = rs.getString(7);
		if(job.equals("1")) {
			job = "학생";
		}else if(job.equals("2")) {
			job = "회사원";
		}else if(job.equals("3")) {
			job = "공무원";
		}else if(job.equals("4")) {
			job = "군인";
		}else if(job.equals("9")) {
			job = "기타";
		}
		String mail = rs.getString(8);
		String intro = rs.getString(9);
		%>
		
		<tr>
			<td><%=userid%></td>
			<td><%=usernm%></td>
			<td><%=passwd%></td>
			<td><%=jumin1%>-<%=jumin2%>******</td>
			<td><%=gen%></td>
			<td><%=address%></td>
			<td><%=job%></td>
			<td><%=mail%></td>
			<td><%=intro%></td>
		</tr>
	<%}
	rs.close();
	stmt.close();
	con.close();
	%>
</table>
<%@include file="footer.jsp" %>
</body>
</html>