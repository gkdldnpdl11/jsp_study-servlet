<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL : 포멧팅(fmt)_숫자와 날짜 포멧팅</title>
	</head>
	<body>
		<h2>천 단위 숫자 처리(1,000)와 숫자만 받기</h2>
		<h3>
			<li><fmt:formatNumber value="123456.5749" /></li>
			
			<%-- 
				숫자만 받기 때문에 실행 오류
				<li><fmt:formatNumber value="aaa123456.5749" /></li>
				<li><fmt:formatNumber value="123456.a5749" /></li> 
			--%>
		</h3>
		<hr>
		
		<h2>숫자만 받기</h2>
		<h3>
			<li><fmt:parseNumber value="123456.5749" /></li>
			
			<!-- 숫자와 문자가 섞여있으면 문자가 나오기 전까지만 인식한다 -->
			<li><fmt:parseNumber value="12345c4b56a.a5749" /></li>
			
			<%-- 
				무조건 오류 발생
				<li><fmt:parseNumber value="aaa123456.5749" /></li> 
			--%>
		</h3>
		<hr>
		
		<h2>정수만 구하기(반올림 처리, 소수점 첫째자리까지 구하기)</h2>
		<h3>
			<li><fmt:formatNumber value="11123456.4449" pattern="#,###.#" /></li>
			<li><fmt:formatNumber value="11123456.5749" pattern="#,###" /></li>
			<li><fmt:formatNumber value="11123456" pattern="#,###.#" /></li>
			<li><fmt:formatNumber value="11123456" pattern="#,###.0" /></li>
		</h3>
		<hr>
		
		<h2>pattern 에서의 # 과 0 의 차이점</h2>
		<h3>
			<li><fmt:formatNumber value="127" pattern="#,###" /></li>
			<li><fmt:formatNumber value="127" pattern="#,###.#" /></li>
			<li><fmt:formatNumber value="127" pattern="0,000" /></li>
			<li><fmt:formatNumber value="127" pattern="0,000.0" /></li>
		</h3>
		<hr>
		
		<h2>현재 운영 체제에 맞는 화폐 단위 표시 (반올림)</h2>
		<h3>
			<li><fmt:formatNumber value="11123456.4449" type="currency" /></li>
			<li><fmt:formatNumber value="11123456.5749" type="currency" /></li>
			<li><fmt:formatNumber value="11123456" type="currency" /></li>
			<li><fmt:formatNumber value="11123456" type="currency" /></li>
		</h3>
		<hr>
		
		<h2>% 구하기 / 퍼센트(value * 100 + "%")</h2>
		<h3>
			<li><fmt:formatNumber value="12" type="percent" /></li>
			<li><fmt:formatNumber value="0.12" type="percent" /></li>
		</h3>
		<hr>
		
		<h2>오늘 날짜 구하기</h2>
		<!-- 자바의 객체 생성과 같음 -->
		<jsp:useBean id="now" class="java.util.Date" />
		<h2>현재 운영 체제에 맞는 날짜 표시</h2>
		<h3>
			<li>오늘 날짜 : ${now}</li>
			<li><fmt:formatDate value="${now}" dateStyle="short" /></li>
			<li><fmt:formatDate value="${now}" dateStyle="medium" /></li>
			<li><fmt:formatDate value="${now}" dateStyle="long" /></li>
			<li><fmt:formatDate value="${now}" dateStyle="full" /></li>
			<hr>
			
			<!-- 현재 시간만 출력 -->
			<li><fmt:formatDate value="${now}" type="time" timeStyle="short" /></li>
			<li><fmt:formatDate value="${now}" type="time" timeStyle="medium" /></li>
			<li><fmt:formatDate value="${now}" type="time" timeStyle="long" /></li>
			<li><fmt:formatDate value="${now}" type="time" timeStyle="full" /></li>
			<hr>
			
			<!-- 현재 날짜와 시간 모두 출력 -->
			<li><fmt:formatDate value="${now}" type="both" dateStyle="short" timeStyle="short" /></li>
			<li><fmt:formatDate value="${now}" type="both" dateStyle="medium" timeStyle="medium" /></li>
			<li><fmt:formatDate value="${now}" type="both" dateStyle="long" timeStyle="long" /></li>
			<li><fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full" /></li>
			<hr>
		</h3>
	</body>
</html>
