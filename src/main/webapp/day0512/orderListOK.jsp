<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		Connection conn = ConnectionProvider.getConnection();
		String sql = "select * from book where bookid in (select bookid from orders	where custid in (select custid from customer where name=?))";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		ResultSet rs = pstmt.executeQuery();
		
		out.print("<h2>"+name+"님의 주문목록</h2>");
		out.print("<table border='1'>");
		
		out.print("<tr>");
		out.print("<th>도서번호</th><th>도서명</th><th>출판사</th><th>가격</th>");
		out.print("</tr>");
		while(rs.next())
		{
			int bookid = rs.getInt(1);
			String bookname = rs.getString(2);
			String publisher = rs.getString(3);
			int price = rs.getInt(4);
			out.print("<tr>");
			out.print("<td>"+bookid+"</td>");
			out.print("<td>"+bookname+"</td>");
			out.print("<td>"+publisher+"</td>");
			out.print("<td>"+price+"</td>");
			out.print("</tr>");
		}
		ConnectionProvider.close(rs, pstmt, conn);
	%>
</body>
</html>