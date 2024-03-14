<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Action Tag : include, forward</title>
	</head>
	<body>
		<%--
			액션 태그 : JSP 페이지간의 흐름 제어, 자바빈즈 컴포넌트 지원
			사용 방법 : <jsp: 액션태그>
			
			1. include : 현재 페이지에서 다른 페이지 호출 또는 다른 페이지의 결과를 현재 페이지에 보여준다
				1) 지시어 include : <%@ include file="가져올 파일의 경로, 위치" %>
					- 다른 페이지 소스 전체를 가져와서 현재 페이지에서 한번에 처리하는 것
					- 파라미터 전달 안됨, 잘 변경되지 않는 정적 페이지에 많이 사용된다
					
				2) 액션 include : <jsp:include page=""></jsp:include>
					- 지정한 다른 페이지의 결과를 가져와서 현재 페이지에 결과를 표시한다
					- 파라미터 전달 가능, 자주 변경되는 동적 페이지에 많이 사용된다
					- 만약에 파라미터를 전달하려면 
						<jsp:include page="">
							<jsp:param value="" name=""/>
						</jsp:include>
		--%>
		<h2>include 지시어 사용하기1</h2>
		<%@ include file="ex03_request.jsp" %>

		<h2>include action 사용하기2</h2>
		<jsp:include page="ex03_request.jsp" />
		<hr>
		
		<%-- <% request.setAttribute("phone", "010-1111-2222"); %>
		<%--
			위에서 처럼 선언 후 사용하면 가능함, ex05파일에는 phone에 대한 value가 없지만
			include 지시어를 사용하여 경로를 불러온 곳 아래에 ex05파일의 소스가 아래에 전부 있다고 생각하면된다.
			그래서 파일을 불러오기 전에 먼저 선언 한 후 사용하면 ex05파일의 선언한 name의 대한 value가 없어도 사용 가능함
		--%>
		<h2>include 지시어 사용하기3</h2>
		<%@ include file="ex05_pageContext.jsp" %> --%>

		<%-- <% request.setAttribute("phone", "010-1111-2222"); %> --%>
		<h2>include action 사용하기4</h2>
		<jsp:include page="ex05_pageContext.jsp">
			<jsp:param value="010-1111-1111" name="phone"/>
		</jsp:include>
	</body>
</html>
