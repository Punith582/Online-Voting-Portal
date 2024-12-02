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
<link rel="stylesheet" href="./vote_apply_jsp.css">
</head>
<body>
	<%
	String fname = request.getParameter("fn");
	String lname = request.getParameter("ln");
	int age = Integer.parseInt(request.getParameter("ag"));
	String email = request.getParameter("em");
	int phone = Integer.parseInt(request.getParameter("ph"));
	String pass = request.getParameter("pow");
	String add = request.getParameter("ad");

	if (age >= 18) {
		Connection con = null;
		PreparedStatement ps = null;
		String qry = "insert into demo.voters(fname, lname, age, email, phone, pass, adde,count) values(?,?,?,?,?,?,?,?)";
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "12345");
		ps = con.prepareStatement(qry);
		ps.setString(1, fname);
		ps.setString(2, lname);
		ps.setInt(3, age);
		ps.setString(4, email);
		ps.setInt(5, phone);
		ps.setString(6, pass);
		ps.setString(7, add);
		ps.setInt(8, 0);
		ps.executeUpdate();
		response.sendRedirect("vote_login.html");
		if (con != null) {
			con.close();
		}
		if (ps != null) {
			ps.close();
		}
	} else {
	%>
	<!-- response.sendRedirect("vote.html"); -->
	<h1>You are not eligible for vote</h1>
	<jsp:include page="vote.html" />
	<%
	}
	%>


</body>
</html>