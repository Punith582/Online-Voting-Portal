<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result page</title>
<link rel="stylesheet" href="./result1.css"/>
</head>
<body>
	<%
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String qry = "select Name,votes from demo.candidate order by votes desc";
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "12345");
	ps = con.prepareStatement(qry);
	rs = ps.executeQuery();
	%>
	<table border="1">
		<tr>
			<th>Name</th>
			<th>Votes</th>
		</tr>
		<%
		while (rs.next()) {
			String name = rs.getString("Name");
			int votes = rs.getInt("votes");
		%>
		<tr>
			<td><%=name%></td>
			<td><%=votes%></td>
		</tr>
	<%
	}
	%>
	</table>
	<a href="vote.html"><button>Go To Home</button></a>
</body>
</html>