package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.GuestDAO;
import com.ict.db.GuestVO;

public class UpdateCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// idx 로 나머지 데이터를 불러옴
		String idx = request.getParameter("idx");
		GuestVO gvo = GuestDAO.getOneList(idx);
		request.setAttribute("gvo", gvo);
		
		return "guestbook/update.jsp";
	}
}
