package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex07")
public class Ex07 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		int su1=Integer.parseInt(request.getParameter("su1"));
		int su2=Integer.parseInt(request.getParameter("su2"));
		String op=request.getParameter("op");
		
		int res=0;
		switch (op) {
			case "+": res=su1+su2; break;
			case "-": res=su1-su2; break;
			case "*": res=su1*su2; break;
			case "/": 
				if (su2==0) {
					out.println("<h2>0 으로는 나눌 수 없습니다</h2>");
				} else {
					res=su1/su2;
				}
				break;
		}
		if (su2 != 0) {
			out.println("<h3>");
			out.println("<p>결과 : "+su1+op+su2+" = "+res+"</p>");
			out.println("</h3>");
		}
	}

}
