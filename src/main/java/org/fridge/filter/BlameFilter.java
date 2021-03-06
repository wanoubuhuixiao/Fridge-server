package org.fridge.filter;

import org.springframework.core.annotation.Order;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

//@Order(1)
//@WebFilter(urlPatterns = "/*")
public class BlameFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpServletRequest req = (HttpServletRequest) request;
        resp.addHeader("Access-Control-Allow-Origin", req.getHeader("Origin"));
        resp.addHeader("Access-Control-Allow-Credentials", "true");
        resp.addHeader("Scumbag-Is", "ZKY");
        resp.addHeader("Flag", "ZKYCTF{" + UUID.randomUUID() + "}");
        req.getSession();
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
