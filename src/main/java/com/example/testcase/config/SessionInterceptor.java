package com.example.testcase.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class SessionInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        HttpSession session = request.getSession(false);
        String path = request.getRequestURI();

        // this is for static files
        if (path.startsWith("/auth") || path.startsWith("/css") ||
                path.startsWith("/js") || path.startsWith("/images")) {
            return true;
        }

        // this is to require user to login
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("/auth/");
            return false;
        }

        return true;
    }
}
