package com.bms.controller;

import com.bms.pojo.Admin;
import com.bms.pojo.Reader;
import com.bms.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class ReaderConttoller {
    @Autowired
    ReaderService readerService;

    @GetMapping("/login.do")
    public String toLogin(){
        return "PageReader/login";
    }

    @PostMapping("/login.do")
    public String login(Reader reader, HttpSession session){
        Reader user = readerService.getReader(reader);
        if(user!=null){
            session.setAttribute("reader", user);
        }
        return "redirect:/toIndex.do";
    }

    @GetMapping("/updatePwd.do")
    public String toUpdatePwd(){
        return "PageReader/updatePwd";
    }

    /**
     * 注销
     * @param session
     * @return
     */
    @RequestMapping("/logout.do")
    public String logout(HttpSession session){
        session.removeAttribute("reader");
        return "PageReader/login";
    }


    @PutMapping("/updateReader.do")
    public String update(Reader reader, HttpSession session,
                         @RequestParam(value = "rphoto",required = false) MultipartFile multipartFile, HttpServletRequest request) {
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
            reader.setrPhoto(fileName);
        }


        Reader sessionReader = (Reader) session.getAttribute("reader");
        reader.setrId(sessionReader.getrId());
        readerService.updateReader(reader);
        Reader tempReader = new Reader();
        tempReader.setrId(sessionReader.getrId());
        reader = readerService.getReader(tempReader);
        session.setAttribute("reader", reader);
        return "redirect:/showReaderInfo.do";
    }


}
