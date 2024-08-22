package com.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.board.db.*;
import com.board.service.BoardService;
import com.user.db.UsersDAO;
import com.user.db.UsersDTO;

@WebServlet("/")
public class BoardController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BoardController() {
        super();
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                                 throws ServletException, IOException {
        String view = null;
		HttpSession session = request.getSession();

        // URL에서 프로젝트 이름 뒷 부분의 문자열 얻어내기
        String uri = request.getRequestURI();
        String conPath = request.getContextPath();
        String com = uri.substring(conPath.length());

        // 주어진 URL에 따라 지정된 동작 수행
        if (com.equals("/")) {
        	view = "index.jsp";
        }
        if (com.equals("/list")) {
        	
            String tmp = request.getParameter("page");
            int pageNo = (tmp != null && tmp.length() > 0)
                    ? Integer.parseInt(tmp) : 1;

            request.setAttribute("msgList",
                    new BoardService().getMsgList(pageNo));
            request.setAttribute("pgnList",
                    new BoardService().getPagination(pageNo));
            System.out.println(new BoardService().getPagination(pageNo));
            view = "list.jsp";

        } else if (com.equals("/view")){
            int num = Integer.parseInt(request.getParameter("num"));

            request.setAttribute("msg", new BoardService().getMsg(num));
            view = "view.jsp";

        } else if (com.equals("/write")){
            String tmp = request.getParameter("num");
            int num = (tmp != null && tmp.length() > 0)
                    ? Integer.parseInt(tmp) : 0;

            BoardDTO dto = new BoardDTO();
            String action = "insert";

            if (num > 0) {
                dto = new BoardService().getMsgForWrite(num);
                action = "update?num=" + num;
            }

            request.setAttribute("msg", dto);
            request.setAttribute("action", action);
            view = "write.jsp";

        } else if (com.equals("/insert")){
            request.setCharacterEncoding("utf-8");
            String writer  = request.getParameter("writer" );
            String title   = request.getParameter("title"  );
            String content = request.getParameter("content");

            try {
                new BoardService().writeMsg(writer, title, content);
                view = "redirect:list";

            } catch(Exception e) {
                request.setAttribute("errorMessage", e.getMessage());
                view = "errorBack.jsp";
            }

        } else if (com.equals("/update")){
            request.setCharacterEncoding("utf-8");
            int num = Integer.parseInt(request.getParameter("num"));
            String writer  = request.getParameter("writer" );
            String title   = request.getParameter("title"  );
            String content = request.getParameter("content");

            try {
                new BoardService().updateMsg(writer, title, content, num);
                view = "redirect:list";

            } catch(Exception e) {
                request.setAttribute("errorMessage", e.getMessage());
                view = "errorBack.jsp";
            }

        } else if (com.equals("/delete")){
            int num = Integer.parseInt(request.getParameter("num"));

            new BoardService().deleteMsg(num);
            view = "redirect:list";
            
            // 로그인
        } else if(com.equals("/loginForm")) {
        	view = "/sign-in/loginForm.jsp";
        	
        } else if(com.equals("/login")) {
        	request.setCharacterEncoding("utf-8");
	    	String login_id = request.getParameter("login_id");
	    	String pw = request.getParameter("pw");
	    	
	    	UsersDTO dto = new UsersDTO(0, login_id, pw, "", "", "");
	    	UsersDAO dao = new UsersDAO();
	    	
	    	int login = dao.isUser(dto);
	    	if (login == 1) {
	    		dto = dao.findUser(dto);
	    		session.setAttribute("userInfo", dto);
	    		session.setAttribute("userLoggedIn", true);
	    		view = "index.jsp";
	    	} else {
	    		System.out.println("로그인 실패");
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script> alert('아이디 또는 비밀번호가 틀립니다.');");
				out.println("history.go(-2); </script>"); 
				out.close();
	    	}
	    	
	    	// 로그아웃
        } else if (com.equals("/logout")) {
        	session.removeAttribute("userInfo");
        	session.removeAttribute("userLoggedIn");
        	
        	view = "index.jsp";
        }

        // view에 담긴 문자열에 따라 포워딩 또는 리다이렉팅
        if (view.startsWith("redirect:")) {
            response.sendRedirect(view.substring(9));
        } else {
            request.getRequestDispatcher(view).forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                                  throws ServletException, IOException {
        doGet(request, response);
    }
}