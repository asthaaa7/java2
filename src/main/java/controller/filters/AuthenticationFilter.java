package controller.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet Filter implementation class AuthenticationFilter
 */
@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter implements Filter {
    
    
    /**
     * @see Filter#init(FilterConfig)
     */
     public void init(FilterConfig fConfig) throws ServletException {
            // No initialization needed
        }
     
     /**
      * This method checks if the user is authenticated or has cookies containing user information. 
      * If the user is authenticated or has cookies, access is allowed. 
      * Otherwise, the user is redirected to the login page.
     **/

        public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
            // Cast the ServletRequest and ServletResponse to their HTTP counterparts
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            
            
            // Get the current session, or null if the session doesn't exist
            HttpSession session = httpRequest.getSession(false);

            // Check if the user is authenticated and is an admin
            boolean isAuthenticated = session != null && session.getAttribute("userType") != null && session.getAttribute("userType").equals("admin");

            // Check if user information is present in cookies
            Cookie[] cookies = httpRequest.getCookies();
            boolean hasCookies = false;
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("username") && cookie.getValue() != null && !cookie.getValue().isEmpty()) {
                        hasCookies = true;
                        break;
                    }
                }
            }

            if (isAuthenticated || hasCookies) {
                // User is authenticated or has cookies, allow access
                chain.doFilter(request, response);
            } else {
                // User is not authenticated or doesn't have cookies, redirect to login page
                httpResponse.sendRedirect("/pages/login.jsp");
            }
        }

        public void destroy() {
            // No cleanup needed
        }
    

}