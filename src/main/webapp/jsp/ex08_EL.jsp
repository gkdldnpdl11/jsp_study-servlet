<%@page import="com.ict.db.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>EL</title>
	</head>
	<body>
		<%
			// Model 에서 했다고 가정
			VO vo=new VO("1", "둘리", "24", "서울");
			request.setAttribute("vo", vo);
		%>
		<h2>
			<ul>
				<!-- VO에 getter가 없으면 값이 출력되지 않는다 -->
				<li>${vo}</li>
				<li>${vo.idx}</li>
				<li>${vo.name}</li>
				<li>${vo.age}</li>
				<li>${vo.addr}</li>
			</ul>
		</h2>
	</body>
</html>
