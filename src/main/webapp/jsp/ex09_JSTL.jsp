<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.ict.db.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL(JSP Standard Tag Library) : Core</title>
	</head>
	<body>
		<%--
			JSTL : JSP Standard Tag Library
			1. library 다운 받아서 해당 프로젝트에 넣기 (tomcat.apache.org)
			2. 다운 받은 4개의 파일을 WEB-INF 안에 lib 폴더(없으면) 생성 후 넣기
			3. JSTL을 사용하기 위해서는 지시어 중 taglib 선언 후 사용한다 (보통 page 지시어 및에 선언 후 사용)
				- 코어 : <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				- 포맷팅 : <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			4. 사용 방법 : 
				- 코어 : <c: 사용명령어>
				- 포멧팅 : <fmt: 사용명령어>
		--%>
		<%--
			1. 변수 생성 및 데이터 저장 : 디폴트는 pageContext 에 저장
				<c:set var="변수명" value="데이터 값"></c:set>
				
			2. 선언한 변수 값 출력 : out
				<c:out value="출력할 데이터 또는 EL 사용"></c:out>
				<c:out value="str"></c:out>		=> 저장한 변수값을 출력하는게 아니고 일반 문자열 출력
				<c:out value="${str}"></c:out>		=> 저장한 변수값을 출력
				${str}												=> 저장된 변수값은 기본적으로 pageContext에 저장되기 때문에 사용 가능함
				
			3. 변수 삭제 : remove
				<c:remove var="삭제할 데이터"/>		=> 저장한 변수의 값을 삭제
				
			4. if 문 : else가 없음, 조건식이 참일때만 실행한다
				<c:if test="조건식(관계 연산, 비교 연산, 논리 연산 -> EL 방식으로 작성)" var="변수명">
					조건식이 참일때 실행할 문장
				</c:if>
				
			5. choose 문 : if 문 에는 else가 없어서 불편하므로 대신 사용하는 것, switch~case 와 비슷함, if~else 처럼 사용 가능
				** 정수는 정수와 비교, 실수는 실수와 비교해야 웹브라우저 상에서 에러가 나지 않는다
				
				<c:choose>
					<c:when test="조건식(관계 연산, 비교 연산, 논리 연산 -> EL 방식으로 작성)">참일때 실행</c:when>	=> case
					<c:when test="조건식(관계 연산, 비교 연산, 논리 연산 -> EL 방식으로 작성)">
						참일때 실행
					</c:when>
					<c:when test="조건식(관계 연산, 비교 연산, 논리 연산 -> EL 방식으로 작성)">
						참일때 실행
					</c:when>
					<c:otherwise>
						위의 모든 조건들을 만족하지 못할 때 실행할 문장, 나머지와 같은 개념
					</c:otherwise>		=> default
				</c:choose>
			
			6. for문 : 일반적인 for문과 foreach 같은 개선된 for문이 있다
				- 일반적인 for문 : 
					<c:forEach begin="시작값" end="종료값" step="증감" 
						var="for문 안에서 사용할 변수명" varStatus="변수의 상태값"></c:forEach>
				
				- 개선된 for문 : 
					<c:forEach var="사용할 변수명" items="배열이나 Array 리스트를 EL형식으로 표현"></c:forEach>
				
				- 반복해서 나누는 forTokens
				<c:forTokens items="${배열이나 컬렉션}" delims="구분자" var="변수명"></c:forTokens>
			
			7. redirect : 페이지 이동, request, response는 새로 만들어진다		
				<c:redirect url="이동할 주소"></c:redirect>

			8. import : 지시자 include와 같은 기능, 이동할 주소의 소스를 가져와서 현재 페이지에 나타낸다	
				<c:import url="이동할 주소"></c:import>
			
		--%>
		<c:set var="str" value="Hello JSTL"/>
		<c:out value="str"/>
		<c:out value="${str}"/>
		${str}
		<hr>
		
		<c:remove var="str"/>
		<c:out value="${str}"/>
		${str}<br>
		<hr>
		
		<c:if test="${4>3}">
			<h2>결과 : 참이라서 실행</h2>
		</c:if>
		<hr>
		
		<c:if test="${4<3}">
			<h2>결과 : 거짓이라 실행 안됨</h2>
		</c:if>
		<hr>
		
		<%-- avg 가 80이상이면 합격 --%>
		<c:set var="avg" value="87" />
		<%-- <c:if test="${avg >= 80}"> --%>
		<c:if test="${avg ge 80}">
			<h3>결과 : 합격</h3>
		</c:if>
		<hr>
		
		<%-- avg 가 80이상이면 합격, 아니면 불합격 --%>
		<c:set var="avg" value="77" />
		<c:choose>
			<c:when test="${avg ge 80}">
				<h3>결과 : 합격</h3>
			</c:when>
			<c:otherwise>
				<h3>결과 : 불합격</h3>
			</c:otherwise>
		</c:choose>
		<hr>
		
		<%-- avg2 가 90이상이면 A, 80이상 B, 70이상 C, 나머지 F --%>
		<c:set var="avg2" value="85" />
		<c:choose>
			<c:when test="${avg2 ge 90}">
				<h3>결과 : A학점</h3>
			</c:when>
			<c:when test="${avg2 ge 80}">
				<h3>결과 : B학점</h3>
			</c:when>
			<c:when test="${avg2 ge 70}">
				<h3>결과 : C학점</h3>
			</c:when>
			<c:otherwise>
				<h3>결과 : F학점</h3>
			</c:otherwise>
		</c:choose>
		<hr>
		
		<h2>10~20까지 출력</h2>
		<c:forEach begin="10" end="20" step="1" var="k" varStatus="vs">
			<h3>${k} : ${vs.index} : ${vs.count} : ${vs.first} : ${vs.last}</h3>
		</c:forEach>
		<hr>
		
		<h2>10~20 짝수만 출력</h2>
		<c:forEach begin="10" end="20" step="1" var="k" varStatus="vs">
			<c:if test="${k%2 eq 0}">
				<h3>${k} : ${vs.index} : ${vs.count} : ${vs.first} : ${vs.last}</h3>
			</c:if>
		</c:forEach>
		<hr>
		
		<!-- 배열 생성 -->
		<c:set var="arr_1" value="둘리, 도우너, 마이콜, 희동이, 고길동" />
		<c:forEach var="k" items="${arr_1}">
			<h3>${k}님, 환영합니다.</h3>
		</c:forEach>
		<hr>
		
		<%
			// Model 에서 Array lilst 를 가져왔다고 가정
			VO vo1=new VO("2", "도우너", "2", "경기");
			VO vo2=new VO("3", "마이콜", "34", "대구");
			VO vo3=new VO("4", "희동이", "15", "대전");
			
			// 강제로 DB에서 처리한 것 처럼 List<VO>에 정보를 넣음
			List<VO> list =new ArrayList<VO>();
			list.add(vo1);
			list.add(vo2);
			list.add(vo3);
			
			request.setAttribute("list", list);
		%>
		
		<c:forEach var="k" items="${list}">
			<li>${k.idx} : ${k.name} : ${k.age} : ${k.addr}</li>
		</c:forEach>
		<hr>
		
		<!-- / 를 기준으로 나눔 -->
		<c:set var="arr_2" value="둘리,도우너,마이콜/홍길동,장길산,임꺽정/태권브이,마징가,짱가" />
		<c:forTokens items="${arr_2}" delims="/" var="k">
			<h3>${k}님</h3>
		</c:forTokens>
		<hr>

		<!-- , 를 기준으로 나눔 -->
		<c:forTokens items="${arr_2}" delims="," var="k">
			<h3>${k}님</h3>
		</c:forTokens>
		<hr>
		
		<!-- / 와 , 를 기준으로 나눔 (둘 다 적용) -->
		<c:forTokens items="${arr_2}" delims=", /" var="k">
			<h3>${k}님</h3>
		</c:forTokens>
		<hr>
		
		<c:redirect url="ex07_EL.jsp"></c:redirect>
		
		<c:import url="ex07_EL.jsp"></c:import>
	</body>
</html>
