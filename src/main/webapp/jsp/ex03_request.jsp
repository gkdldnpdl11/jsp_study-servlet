<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내장 객체 : request</title>
	</head>
	<body>
		<%--
			request(요청) : 클라이언트가 요청한 정보를 가지고 있다(파라미터도 가지고 있다)
			** request 의 생명주기는 response(응답)하면 종료된다
			
			request 가 가지고 있는 정보들 :
			
				1. 클라이언트의 정보 및 서버의 정보를 얻을 수 있는 메소드 제공
					: getRemoteAddr(), getContentLength(), getCharacterEncoding(), getContentType()
						getProtocol(), getContentPath(), getRequestURI(), getContextPath(), getServerName()
				
				** 2. 파라미터의 정보 제공
					1) getParameter(String name)			: String
					2) getParameterValues(String name)	: String[]
					3) getParameterMap(String name) 	: Map<String, String>
					4) getParameterNames()					: Enumeration<String>
			
				** 다른 주요 메소드
					- forward(포워드) : request.getRequestDispather("이동할 주소").forward(request, response);
					- 속성을 이용한 데이터 저장 : request.setAttribute("저장이름", 데이터명);
					- 속성이 저장된 데이터 호출 : request.getAtrribute("저장이름"); 또는 EL 표현식 = ${이름}
					- Model에서 나중에 세션을 호출할 때 사용 : request.getSession();
		--%>
		<h2>Request를 활용한 클라이언트 정보 및 서버 정보 보기</h2>
		<h3>
			<ul>
				<li>클라이언트 IP 			: <%= request.getRemoteAddr() %></li>
				<li>요청 정보 길이 			: <%= request.getContentLength() %></li>
				<li>요청 정보 인코딩			: <%= request.getCharacterEncoding() %></li>
				<li>요청 정보 컨텐츠 타입	: <%= request.getContentType() %></li>
				<li>요청 정보 프로토콜 		: <%= request.getProtocol() %></li>
				<li>요청 정보 전달 방식 		: <%= request.getMethod() %></li>
				<li>요청 정보 URI 			: <%= request.getRequestURI() %></li>
				<li>요청 정보 URL 			: <%= request.getRequestURL() %></li>
				<li>컨텍스트 경로 			: <%= request.getContextPath() %></li>
			</ul>
		</h3>
	</body>
</html>