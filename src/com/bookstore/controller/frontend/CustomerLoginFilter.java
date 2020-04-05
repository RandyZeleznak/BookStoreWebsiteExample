package com.bookstore.controller.frontend;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



/**
 * This is the Login Filter for Customer - rez
 */


@WebFilter("/*")
public class CustomerLoginFilter implements Filter {

	private static final String[] LoginRequiredURLS = {
			"/view_profile","/edit_profile","/update_profile","/write_review"
	};
    
    public CustomerLoginFilter() {
        // TODO Auto-generated constructor stub
    }

	
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession(false);
		
		String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
		
		if(path.startsWith("/admin/")) {
			chain.doFilter(request, response);
			return;
		}
		
		boolean loggedIn = session != null && session.getAttribute("loggedCustomer") != null;
		
		String requestURL = httpRequest.getRequestURL().toString();
		System.out.println("Path: " + path);
		System.out.println("loggedIn: " + loggedIn);
		
		
		if(!loggedIn  && isLoginRequired(requestURL)) {
			String queryString = httpRequest.getQueryString();
			String redirectURL = requestURL;
			
			if(queryString != null) {
				redirectURL = redirectURL.concat("?").concat(queryString);
			}
			
			
			session.setAttribute("redirectURL", redirectURL);
			
			String loginPage = "frontend/login.jsp";
			RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginPage);
			dispatcher.forward(request, response);
		} else {
			chain.doFilter(request, response);
		}
		
		
	}

	private boolean isLoginRequired(String requestURL) {
		for(String loginRequiredURL : LoginRequiredURLS) {
			if(requestURL.contains(loginRequiredURL)) {
			return true;
			}
		}
		return false;
	}
	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
