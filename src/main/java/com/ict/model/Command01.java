package com.ict.model;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Command01 implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 실제 일처리 하는곳 (화면단에는 노출되지 않는다)
		
		// 오늘 날짜 구하기
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH)+1;
		int day = now.get(Calendar.DATE);
		String result = year+"년 "+month+"월 "+day+"일";
		
		// 일처리의 결과를 저장(request 에 저장) => controller 에서 페이지 이동을 forward 로 한다
		// redirect 를 사용하면 request, response 의 값이 사라지기 때문에 forward 사용함
		request.setAttribute("res", result);
		
		// return "결과를 보여줄 jsp 파일 위치" => 반환값이 String 이기 때문에 "" 사용
		return "view/ex13_res01.jsp";
	}
}
