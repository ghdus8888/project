package project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter {



	
    @Override
    public void init(FilterConfig config) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(false);
        	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
        PrintWriter script = response.getWriter();

        if(excludeUrl(httpRequest)) {
        	chain.doFilter(request, response);
        }
        else {
        	
       
        boolean login = false;
        if (session != null) {
            if (session.getAttribute("b_id") != null) {
                login = true;
            }
        }
        if (login) {
            chain.doFilter(request, response);
        } else {
        //	response.setCharacterEncoding("utf-8");
        	
   		 script.println("<script>");
         script.println("alert('沅뚰븳�씠 �뾾�뒿�땲�떎.')");
         script.println("location.href = 'main.jsp'");
         script.println("</script>");
 /*           RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
            dispatcher.forward(request, response);*/
        }
        }
    }

    private boolean excludeUrl(HttpServletRequest httpRequest) {
		// TODO Auto-generated method stub
    	
    	String uri = httpRequest.getRequestURI().toString().trim();
    	
    	if(uri.startsWith("/project/loginsuccess.jsp")) {
    		return true;
    	}
    	if(uri.startsWith("/project/findid.jsp")) {
    		return true;
    	}
    	if(uri.startsWith("/project/find_id_success.jsp")) {
    		return true;
    	}
    	if(uri.startsWith("/project/find_pass_succeess.jsp")) {
    		return true;
    	}
    	if(uri.startsWith("/project/join.jsp")) {
    		return true;
    	}
    	if(uri.startsWith("/project/joinsuccess.jsp")) {
    		return true;
    	}
    	if(uri.startsWith("/project/check.jsp")) {
    		return true;
    	}
    	if(uri.startsWith("/project/dbconnTest.jsp")) {
    		return true;
    	}
    	if(uri.startsWith("/project/borrow.jsp")) {
    		return true;
    	}
    	if(uri.startsWith("/project/return1.jsp")) {
    		return true;
    	}
    	if(uri.startsWith("/project/Mapcheck.jsp")) {
    		return true;
    	}
    	if(uri.startsWith("/project/login.jsp")) {
    		return true;
    	}
    	if(uri.startsWith("/project/Mapcheck.jsp")) {
    		return true;
    	}
    	if(uri.startsWith("/project/main.jsp")) {
    		return true;
    	}
    	
    	if(uri.startsWith("/project/retrunsuccess.jsp")) {
    		return true;
    	}
    
		return false;
	}

	@Override
    public void destroy() {
    }
}