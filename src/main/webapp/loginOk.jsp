<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	String sql = "insert into tbl_geuest values(?,?,?,?,?,?,?,?,?)";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	String userid = request.getParameter("userid");
	String usernm = request.getParameter("usernm");
	String passwd = request.getParameter("passwd");
	String jumin1 = request.getParameter("jumin1");
	String jumin2 = request.getParameter("jumin2");
	String gender = request.getParameter("gender");
	System.out.println(gender);
	String address = request.getParameter("address");
	String jobcd = request.getParameter("jobcd");
	String mailrcv = request.getParameter("mailrcv");
	String intro = request.getParameter("intro");
	
	
	if(mailrcv.equals("Y")) {
		mailrcv = "Y";
	} else {
		mailrcv = "N";
	}
	
	String jumin = jumin1 + jumin2;
	
	pstmt.setString(1,userid);
	pstmt.setString(2,usernm);
	pstmt.setString(3,passwd);
	pstmt.setString(4,jumin);
	pstmt.setString(5,gender);
	pstmt.setString(6,address);
	pstmt.setString(7,jobcd);
	pstmt.setString(8,mailrcv);
	pstmt.setString(9,intro);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	
	response.sendRedirect("index.jsp");
%>
</body>
</html>