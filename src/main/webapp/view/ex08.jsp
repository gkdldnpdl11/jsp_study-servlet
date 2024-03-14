<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>성적표</title>
		<script type="text/javascript">
			function send_go(f) {
				/* 확인 작업이 1~2개 일 때 사용
				let name=f.name.value;
				if (name==='') {
					alert("이름을 입력하세요");
					f.name.focus();
					return;
				}
				 */

				/* input 타입의 요소들을 검사할 때 사용함 */
				for (let i = 0; i < f.elements.length; i++) {
					// 국어를 제외 시킴(필수요소가 아닌 선택사항으로 만듬)
					// fieldset = index 0 , name=1, kor=2...
					// if (i===2) continue;
					
					if (f.elements[i].value==='') {
						alert(f.elements[i].name+"을 입력하세요");
						f.elements[i].focus();
						return;
					}
				}
				f.submit();
			}
		</script>
	</head>
	<body>
		<form action="/01_servlet/Ex08" method="post">
			<fieldset>
				<legend>성적입력</legend>
				<p>이름 : <input type="text" name="name"></p>
				<p>국어 : <input type="number" name="kor"></p>
				<p>영어 : <input type="number" name="eng"></p>
				<p>수학 : <input type="number" name="math"></p>
				<input type="button" value="결과보기" onclick="send_go(this.form)">
				<input type="reset" value="취소">
			</fieldset>		
		</form>
	</body>
</html>