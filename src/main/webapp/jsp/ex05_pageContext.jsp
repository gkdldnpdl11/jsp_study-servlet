<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내장 객체 : pageContext</title>
	</head>
	<body>
		<%--
			pageContext 객체는 JSP 기본 내장 객체이다
			JSP 페이지에서 1:1로 연결된 객체로 JSP 페이지 당 하나의 pageContext 객체가 생성
			같은 페이지에서 서로 값을 공유할 수 있으며(페이지 안에서만 사용 가능), 
				다른 기본 내장 객체(request, response, session, application)를 구하거나 페이지의 흐름을 제어한다
			
			1. 데이터 저장 : pageContext.setAttribute("이름", 객체);
				데이터 호출 : pageContext.getAttribute("이름");	=> EL 사용 ${이름}
				생명 주기 : 해당 페이지를 벗어나면 저장 정보도 사라진다
			
			** 속성을 이용해서 데이터를 저장 및 호출하는 내장 객체들
				우선 순위 : pageContext -> request -> session -> application
				생명 주기 : application(제일 오래 살아남음) -> *session -> **request -> *pageContext(가장 먼저 끝남)
				pageContext : 현재 페이지를 벗어나면 정보도 사라진다
				request : response 가 되면 정보도 사라진다
				session : 해당 브라우저가 종료되면 정보도 사라진다
								(예외적으로 시간을 지정할 수 있다 => 팝업에서 일주일간 안보이기, 일정 시간이 지나면 자동 로그아웃)
								보통 로그인 처리할 때 사용한다
				application : 해당 프로젝트가 종료될 때 정보가 사라진다
									전역적으로 사용하던가 환경 정보 등을 가지고 있다
			
		--%>
			<%! String str = "Hello JSP"; %>
			<h2><%= str %></h2>
			<h2>결과 : ${str}</h2>
			<hr>
		<%
			// 데이터 저장
			pageContext.setAttribute("addr", "서울시 마포구");
			pageContext.setAttribute("age", 24);
			pageContext.setAttribute("gender", true);
			pageContext.setAttribute("str", "Hello JSP");
		%>
		
		<h2>결과 보기</h2>
		<h2>EL : pageContext, request, session, application에 저장된 데이터 호출 가능</h2>
		<h3>주소 : ${addr}</h3>
		<h3>나이 : ${age}</h3>
		<h3>성별 : ${gender}</h3>
		<h3>str : ${str}</h3>
		<hr>
		
		<h2>우선 순위 : pageContext, request, session, application</h2>
		<%
			// 데이터 저장
			pageContext.setAttribute("name", "둘리");
			request.setAttribute("name", "도우너");
			session.setAttribute("name", "희동이");
			// application의 데이터값을 반환하기 위해서는 session의 생명주기를 종료해야한다 
			//		웹브라우저 종료 => 다시 웹브라우저 실행하면 application의 데이터값을 반환할 수 있다
			application.setAttribute("name", "마이콜");
			
			String phone = request.getParameter("phone");
			pageContext.setAttribute("phone", phone);
		%>
		<%-- 저장 이름이 4가지 전부 다 동일하지만 우선 순위가 있어 pageContext의 데이터값인 둘리만 반환한다 --%>
		<h3>결과 : ${name}</h3>
		<h3>결과 : ${pageScope.name}</h3>
		<h3>결과 : ${requestScope.name}</h3>
		<h3>결과 : ${sessionScope.name}</h3>
		<h3>결과 : ${applicationScope.name}</h3>
		<!-- ex06에서 include 할 때 -->
		<h3>결과 : ${phone}</h3>
	</body>
</html>
