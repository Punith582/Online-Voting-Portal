<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./vote_login_jsp.css">
</head>
<body>
	<%
	String email = request.getParameter("em");
	String pass = request.getParameter("pow");
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String qry = "select id,fname,lname,age,email,phone,adde,count from demo.voters where email=? and pass=?";
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "12345");
	ps = con.prepareStatement(qry);
	ps.setString(1, email);
	ps.setString(2, pass);
	rs = ps.executeQuery();
	if (rs.next()) {
		String vid = rs.getString("id");
		String fname = rs.getString("fname");
		String lname = rs.getString("lname");
		int age = rs.getInt("age");
		String email1 = rs.getString("email");
		int phone = rs.getInt("phone");
		String add = rs.getString("adde");
		int count = rs.getInt("count");
		session.setAttribute("count", count);
		session.setAttribute("vid", vid);
	%>
	<table border="1">
		<tr>
			<th>VoterId</th>
			<th>FirstName</th>
			<th>LastName</th>
			<th>Age</th>
			<th>Email</th>
			<th>Phone</th>
			<th>Address</th>
		</tr>
		<tr>
			<td><%=vid%></td>
			<td><%=fname%></td>
			<td><%=lname%></td>
			<td><%=age%></td>
			<td><%=email1%></td>
			<td><%=phone%></td>
			<td><%=add%></td>
		</tr>
	</table>
	<a href="vote.jsp"><button>Vote</button></a>
	<%
	} else {
	%>
	<h1>Use proper credentials to login</h1>
	<%
	}
	%>
</body>
</html>