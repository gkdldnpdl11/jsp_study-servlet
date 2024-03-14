package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.GuestDAO;
import com.ict.db.GuestVO;

public class ListCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// guestbook 테이블의 모든 정보를 가져와야 한다
		// DB처리는 MyBatis 사용
		// 오라클 lib 와 MyBatis lib 를 WEB-INF 안 lib를 넣자
		
		List<GuestVO> list = GuestDAO.getlist();
		request.setAttribute("list", list);
		
		return "guestbook/list.jsp";
	}
}
