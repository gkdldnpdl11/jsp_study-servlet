<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 3가지 전부 객체로 넘어오기 때문에 주소가 호출된다 -->
		<h1>결과 보기</h1>
		<!-- 배열, 객체 -->
		<h2>${hobby}</h2>
		<!-- 객체, VO, Object -->
		<h2>${vo}</h2>
		<!-- List<VO>, 객체 -->
		<h2>${list}</h2>
	</body>
</html>