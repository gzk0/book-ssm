package com.bms.interceptor;

import com.bms.pojo.Admin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.Set;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Set<String> paths = new HashSet<>();
        paths.add("/login.do");
        paths.add("/admin/login.do");
        String servletPath = request.getServletPath();
        if(paths.contains(servletPath)){
            return true;
        }

        Set<String> adminPaths = new HashSet<>();
        adminPaths.add("/admin/getReaders.do");
        adminPaths.add("/admin/showReaderInfo.do");
        adminPaths.add("/admin/addReader.do");
        adminPaths.add("/admin/getAllAdmins.do");
        adminPaths.add("/admin/addAdmin.do");
        adminPaths.add("/admin/showReaderInfo.do");
        adminPaths.add("/admin/disableAdmin.do");
        adminPaths.add("/admin/ableAdmin.do");
        adminPaths.add("/admin/deleteAdmin.do");
        HttpSession session = request.getSession();
        if(servletPath.startsWith("/admin/")){
            Admin admin = (Admin) session.getAttribute("admin");

            if(admin==null || admin.getaState()==1){
                response.sendRedirect("/admin/login.do");
                return false;
            }else{
                if(adminPaths.contains(servletPath)&&admin.getaPrivilege()==1){
                    return false;
                }
                return true;
            }
        }else{
            if(session.getAttribute("reader")==null){
                response.sendRedirect("/login.do");
                return false;
            }
        }
        return true;
    }


}
