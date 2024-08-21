package com.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.db.UsersDTO;
import com.user.service.UsersService;

@WebServlet("/login123")
public class UsersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UsersController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;
        String uri = request.getRequestURI();
        String conPath = request.getContextPath();
        String com = uri.substring(conPath.length());
        
		if(com.equals("/login123")) {
			view = "login.jsp";
			request.getRequestDispatcher(view).forward(request, response);
	
	    	String login_id = request.getParameter("login_id");
	    	String pw = request.getParameter("pw");
	    	
	    	UsersDTO dto = new UsersService().login(login_id, pw);
	    	System.out.println(dto);
	    	if (dto != null) {
	    		System.out.println("들어옴");
	    		//if(dto.getLogin_id().equals(login_id) && dto.getPw().equals(pw)){
		    		request.setAttribute("user_id", dto.getUser_id());
		    		request.setAttribute("user_pw", dto.getPw());
		    		request.setAttribute("user_tel", dto.getTel());
		    		view = "index.jsp";
	    		//}
	    	} else {
	    		System.out.println("XXX");
	    	}
		}
//		response.sendRedirect(view);
		System.out.println(view);
		request.getRequestDispatcher(view).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
