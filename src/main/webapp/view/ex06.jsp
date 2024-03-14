<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>to_servlet</title>
		<script type="text/javascript">
			function send_go(f) {
				// form에 action이 없으면
				let name = f.userName.value;
				if (name==='') {
					alert("insert your name");
					f.userName.focus();
					return;
				}
				f.action="/01_servlet/Ex06";
				f.submit();
			}
		</script>
	</head>
	<body>
		<h2>HTML을 활용한 서버(servlet에게 정보 보내기)</h2>
		<form action="/01_servlet/Ex06" method="post">
			<p>이름 : <input type="text" name="userName" placeholder="이름을 입력해주세요" required></p>
			<p>나이 : <input type="number" name="userAge" required></p>
			<input type="submit" value="to_server">
			<input type="reset" value="cancel">
		</form>

		<h2>JS를 활용한 서버(servlet에게 정보 보내기)</h2>
		<form method="post">
			<!-- required 가 작동하지 않는다, 그래서 위의 스크립트에서 function을 삽입하여 점검함 -->
			<p>이름 : <input type="text" name="userName" placeholder="이름을 입력해주세요"></p>
			<p>나이 : <input type="number" name="userAge"></p>
			<!-- <input type="submit" value="to_server"> -->
			<input type="button" value="to_server" onclick="send_go(this.form)">
			<input type="reset" value="cancel">
		</form>
		
	</body>
</html>