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
<link rel="stylesheet" href="./end.css"> 
</head>
<body>
	<h1>You successfully casted your vote</h1>
	<%
	int id=Integer.parseInt(request.getParameter("vote"));
	Connection con=null;
	PreparedStatement ps=null;
	String qry="update demo.candidate set votes= votes + 1 where SNO=?";
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","12345");
	ps=con.prepareStatement(qry);
	ps.setInt(1, id);
	ps.executeUpdate();
	%>
	<a href="result.jsp"><button>Results</button></a>
</body>
</html>