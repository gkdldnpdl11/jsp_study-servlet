<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내장 객체</title>
	</head>
	<body>
		<%--
			JSP 내장 객체 : JSP에서 사용할 수 있도록 지원하는 객체를 말한다
				: request, response, out, page, pageContext, session, application, config, exception
			out 은 화면에 출력할 때 사용하는 객체이다
			
			<% 자바코드; %> // 자바코드 안에서도 변수 선언 가능
			<%! 변수 선언이나 메소드 선언할때 사용; %>
			<%= 변수 결과값이나 메소드 결과값을 출력  %>	=> EL(표현언어) = ${}	// 뒤에있는걸 사용함
		--%>
		<% out.println("<h2>Hello JSP</h2>"); %>
		<%! String str = "Hello JSP"; %>
		<h2><%= str %></h2>
		<h2>결과 : ${str}</h2>
	</body>
</html>