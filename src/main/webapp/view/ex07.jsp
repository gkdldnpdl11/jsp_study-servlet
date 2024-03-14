<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>계산기</title>
		<script type="text/javascript">
			function send(f) {
				let name=f.su1.value;
				if (name==='') {
					alert("insert your name");
					f.su1.focus();
					return;
				} else {
					f.action="/01_servlet/Ex07";
					f.submit();
				}
			}
		</script>
		<style type="text/css">
			fieldset {
				width: 300px;
			}
		</style>
	</head>
	<body>
		<!-- 1번 html, 2번 js // 0은 나누기 안됨 -->
		<form action="/01_servlet/Ex07" method="get">
			<fieldset>
				<legend>계산기</legend>
				<p>수1 : <input type="number" name="su1" required></p>
				<p>수2 : <input type="number" name="su2" required></p>
				<p>연산자 : 
					<input type="radio" name="op" value="+" checked> +
					<input type="radio" name="op" value="-"> -
					<input type="radio" name="op" value="*"> *
					<input type="radio" name="op" value="/"> /
				</p>
				<input type="submit" value="결과보기">
			</fieldset>
		</form>
		
		<form method="get">
			<fieldset>
				<legend>계산기</legend>
				<p>수1 : <input type="number" name="su1" required></p>
				<p>수2 : <input type="number" name="su2" required></p>
				<p>연산자 : 
					<input type="radio" name="op" value="+" checked> +
					<input type="radio" name="op" value="-"> -
					<input type="radio" name="op" value="*"> *
					<input type="radio" name="op" value="/"> /
				</p>
				<!-- <input type="submit" value="결과보기"> -->
				<input type="button" value="결과보기" onclick="send(this.form)">
			</fieldset>
		</form>
		
	</body>
</html>