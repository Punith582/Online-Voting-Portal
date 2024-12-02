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
<link rel="stylesheet" href="./vote_jsp.css"> 
</head>
<body>
	<%
	int c=(int)session.getAttribute("count");
	Connection con=null;
	PreparedStatement ps=null;
	if(c==0) {%>
	<form action="end.jsp">
		<table>
			<tr>
				<th>SNO</th>
				<th>Candidate Name</th>
				<th>Vote</th>
			</tr>
			<tr>
				<td>1</td>
				<td>Ramarao</td>
				<td><input type="radio" name="vote" value="1" ></td>
			</tr>
			<tr>
				<td>2</td>
				<td>Punith</td>
				<td><input type="radio" name="vote" value="2"></td>
			</tr>
			<tr>
				<td>3</td>
				<td>NTR</td>
				<td><input type="radio" name="vote" value="3" ></td>
			</tr>
			<tr>
				<td>4</td>
				<td>Sonali</td>
				<td><input type="radio" name="vote" value="4"></td>
			</tr>
		</table>
		<button type="submit">Caste Vote</button>
	</form>
	<%
	String qry="update demo.voters set count=1 where id=?";
	String vid=(String)session.getAttribute("vid");
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","12345");
	ps=con.prepareStatement(qry);
	ps.setString(1, vid);
	ps.executeUpdate();
	}
	else{ %>
		<h1>Your vote already completed</h1>
		<a href="result.jsp"><button>Results</button></a>
	<%
	}
	%>
</body>
</html>