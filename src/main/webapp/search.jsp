<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
검색조건 : 
<form name="searchf" action="" method="post" onsubmit="searchs()">
    <select name="search">
        <option value="usernm">회원이름</option>
        <option value="userid">회원ID</option>
    </select>
    <input type="text" name="searchId"> 
    <input type="submit" value="검색">
</form>

<%
String searchCriteria = request.getParameter("search");
String searchId = request.getParameter("searchId");

Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

String sql = "SELECT  userid, usernm, jumin, gender, jobcd, intro "
			+ "FROM tbl_geuest ";
if (searchCriteria != null && searchId != null && !searchId.isEmpty()) {
    sql += " WHERE TRIM(" + searchCriteria + ") = ?";
}

PreparedStatement pstmt = con.prepareStatement(sql);

if (searchCriteria != null && searchId != null && !searchId.isEmpty()) {
    pstmt.setString(1, searchId);
}

ResultSet rs = pstmt.executeQuery();
%>

<table>
    <tr>
        <td>회원아이디</td>
        <td>회원이름</td>
        <td>생년월일</td>
        <td>성별</td>
        <td>직업</td>
        <td>자기소개</td>
    </tr>
    <% while(rs.next()) {
        String userid = rs.getString(1);
        String usernm = rs.getString(2);
        String jumin = rs.getString(3).substring(0,6);
        String gen = rs.getString(4);
        if("1".equals(gen)) {
            gen = "남";
        } else {
            gen = "여";
        }
        String job = rs.getString(5);
        if("1".equals(job)) {
            job = "학생";
        } else if("2".equals(job)) {
            job = "회사원";
        } else if("3".equals(job)) {
            job = "공무원";
        } else if("4".equals(job)) {
            job = "군인";
        } else if("9".equals(job)) {
            job = "기타";
        }
        String intro = rs.getString(6);
    %>
    <tr>
        <td><%=userid%></td>
        <td><%=usernm%></td>
        <td><%=jumin%></td>
        <td><%=gen%></td>
        <td><%=job%></td>
        <td><%=intro%></td>
    </tr>
    <% } %>
</table>

<%
rs.close();
pstmt.close();
con.close();
%>

<%@ include file="footer.jsp" %>
</body>
<script type="text/javascript">
function searchs() {
    if(document.searchf.searchId.value == "") {
    	alert("값을 넣어주세요");
        document.searchf.searchId.focus();
        return false;
    }
}
</script>
</html>