package com.ict.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// @WebServlet("/Ex01") : 인터넷 웹브라우저 주소
// URL mapping => 프로젝트명/@WebServlet명
@WebServlet("/Ex01")
public class Ex01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// 보통은 생략, 이 다음부터는 생략함(처음이라서 해봄)
    public Ex01() {
    	System.out.println("생성자()");
    }

	public void init(ServletConfig config) throws ServletException {
		// 생성자를 대신해서 멤버초기화를 할 수 있다, 초기화가 필요할 때 사용
		// init()이 끝나면 자동으로 service()로 넘어간다
		System.out.println("init()");
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request => 요청 정보를 가지고 있는 객체 (클라이언트 => 서버)
		// response => 응답 정보를 가지고 있는 객체 (서버 => 클라이언트)
		
		// 클라이언트의 요청 방식에 따라 알맞는 메소드를 호출하는 역할을 한다
		// 요청 방식 - get()(default), post()
		System.out.println("service()");
		if (request.getMethod().equalsIgnoreCase("get")) {
			// doGet일때 실행
			doGet(request, response);
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			// doPost일때 실행
			doPost(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("get()");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		System.out.println("post()");
	}

	// 톰켓에서 빠져나올때
	public void destroy() {
		System.out.println("dstroy()");
	}

}
