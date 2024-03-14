package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 인터페이스는 상수와 추상메소드만 가지고 있는 것
public interface Command {
	// 요청 사항을 처리할 Model 들이 사용할 메소드를 가지고 있다
	public String exec(HttpServletRequest request, HttpServletResponse response);
}
