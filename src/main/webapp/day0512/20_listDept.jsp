<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>부서목록</h2>
	<table border="1">
	<tr>
		<th>부서번호</th>
		<th>부서명</th>
		<th>위치</th>
	</tr>
	<%
		try{			
			Connection conn = ConnectionProvider.getConnection();
			String sql = "select * from dept";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				int no = rs.getInt(1);
				String dname = rs.getString(2);
				String dloc = rs.getString(3);
				out.print("<tr>");
				out.print("<td>"+no+"</td>");
				out.print("<td>"+dname+"</td>");
				out.print("<td>"+dloc+"</td>");
				out.print("</tr>");
			}
			ConnectionProvider.close(rs, stmt, conn);
		}catch(Exception e){
			System.out.println("예외발생:"+e.getMessage());
		}
	%>
	</table>
</body>
</html>












