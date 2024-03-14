<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>표현 언어 : EL</title>
	</head>
	<body>
		<%--
			EL (Expression Language) : 표현 언어
			JSP 표현식 <%= %> 대신에 사용함
			<%= 변수값이나 메소드의 결과 %> => ${변수나 메소드의 결과}
			
			앞에서 배운 pageContext, request, session, application 을 이용해서
			데이터를 저장한 정보를 EL 이나 JSTL 을 이용하면 저장된 정보를 바로 사용할 수 있다
			
		--%>
		<h2>표현식을 사용한 산술 연산</h2>
		<h3>
			<ul>
				<li>15+7= <%= 15+7 %> </li>
				<li>15-7= <%= 15-7 %> </li>
				<li>15*7= <%= 15*7 %> </li>
				<li>15/7= <%= 15/7 %> </li>
				<li>15%7= <%= 15%7 %> </li>
			</ul>
		</h3>
		<h2>EL을 사용한 산술 연산</h2>
		<h3>
			<ul>
				<li>15+7= ${15+7}</li>
				<li>15-7= ${15-7}</li>
				<li>15*7= ${15*7}</li>
				<li>15/7= ${15/7}</li>
				<li>15%7=${15%7}</li>
			</ul>
		</h3>
		<hr>
		
		<h2>표현식 변수 사용 예제</h2>
		<% int su=157+47; %>
		<h3>결과 : <%= su %></h3>
		<%-- EL은 pageContext, request, session, application 에 저장되어야 사용 가능, 현재는 EL 사용못함 --%>
		<h3>결과 : ${su}</h3>
		
		<!-- setattribute로 파라미터 저장 후 EL 사용하면 결과값 반환 가능 -->
		<% pageContext.setAttribute("su", su); %>
		<h3>결과 : ${su}</h3>
	</body>
</html>
