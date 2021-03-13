package com.bms.controller;

import com.bms.pojo.Admin;
import com.bms.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;

    /**
     * 去登录
     *
     * @return
     */
    @GetMapping("/login.do")
    public String toLogin() {
        return "pageAdmin/login";
    }

    /**
     * 提交表单登录
     *
     * @param admin
     * @param model
     * @param session
     * @return
     */
    @PostMapping("/login.do")
    public String login(Admin admin, Model model, HttpSession session) {
        Admin user = adminService.getAdmin(admin);
        if (user == null) {
            model.addAttribute("Login_error", "用户名或密码不正确！");
            return "pageAdmin/login";
        } else if(user.getaState()!=0){
            model.addAttribute("Login_error", "该用户已被管理员禁用");
            return "pageAdmin/login";

        }
        session.setAttribute("admin", user);
        return "redirect:/admin/index.do";
    }

    @PutMapping("/update.do")
    public String update(Admin admin, HttpSession session,
                         @RequestParam(value = "aphoto",required = false) MultipartFile multipartFile,HttpServletRequest request) {
        String parentPaht = request.getServletContext().getRealPath("/");
        File file = new File(parentPaht+File.separator+"headPhoto"+File.separator);

        if(!file.exists() || !file.isDirectory()){
            file.mkdirs();
        }
        String fileName = UUID.randomUUID().toString().replace("-", "");
        if(!multipartFile.isEmpty()){
            String path = file.getPath();
            String originalFilename = multipartFile.getOriginalFilename();
            fileName=fileName+originalFilename.substring(originalFilename.lastIndexOf('.'));
            File headPhoto = new File(path+File.separator+ fileName);
            try {
                multipartFile.transferTo(headPhoto);
            } catch (IOException e) {
                e.printStackTrace();
            }
            admin.setaPhoto(fileName);
        }


        Admin user = (Admin) session.getAttribute("admin");
        admin.setaId(user.getaId());
        if(admin.getaNick()==null || admin.getaNick()==""){
            admin.setaNick(null);
        }
        adminService.updateAdmin(admin);
        Admin tempAdmin = new Admin();
        tempAdmin.setaId(user.getaId());
        user = adminService.getAdmin(tempAdmin);
        session.setAttribute("admin", user);
        return "redirect:/admin/AdminInfo.do";
    }

    @GetMapping("/updatePwd.do")
    public String toUpdatePwd() {
        return "pageAdmin/updatePwd";
    }

    @PutMapping("/updatePwd.do")
    public String updatePwd(String old_password, String new_password, String repwd, HttpSession session, Model model, HttpServletResponse response) {
        if (new_password != null && new_password.equals(repwd)) {
            Admin admin = (Admin) session.getAttribute("admin");
            if (old_password != null && old_password.equals(admin.getaPassword())) {
                Admin tempAdmin = new Admin();
                tempAdmin.setaId(admin.getaId());
                tempAdmin.setaPassword(new_password);
                adminService.updateAdmin(tempAdmin);
                session.removeAttribute("admin");
                return "redirect:/admin/login.do";
            } else {
                model.addAttribute("pwd_error", "原密码错误");
                return "pageAdmin/updatePwd";
            }
        } else {
            model.addAttribute("pwd_error", "两次密码不一致");
            return "pageAdmin/updatePwd";
        }
    }


    /**
     * 注销
     * @param session
     * @return
     */
    @GetMapping("/logout.do")
    public String logout(HttpSession session){
        session.removeAttribute("admin");
        return "redirect:/admin/login.do";
    }


}
