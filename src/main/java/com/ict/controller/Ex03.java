package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex03")
public class Ex03 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 처리
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out=response.getWriter();
		
		// 오늘의 날짜, 운수는 model에서 처리(자바, 비즈니스로직)
		// 오늘 날짜
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH)+1;
		int day = now.get(Calendar.DATE);
		// 오늘의 운수
		int lucky = (int) (Math.random()*101);
		
		out.println("<h2>"+year+"년 "+month+"월 "+day+"일의 운수는 "+lucky+"%입니다"+"</h2>");
		out.println("<hr>");
		out.println("<h2>요청 정보 출력</h2>");
		out.println("<ul>");
		out.println("<li>요청 주소 : "+request.getRemoteAddr()+"</li>");
		out.println("<li>요청 주소 : "+request.getRemoteHost()+"</li>");
		out.println("<li>요청 포트 : "+request.getRemotePort()+"</li>");
		out.println("<li>요청 메소드 : "+request.getMethod()+"</li>");
		out.println("<li>프로젝트 주소 : "+request.getContextPath()+"</li>");
		out.println("<li>파일 주소 : "+request.getRequestURI()+"</li>");
		out.println("</ul>");
	}

}