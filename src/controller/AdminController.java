package controller;

import com.alibaba.fastjson.JSON;
import entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.AdminService;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("login")
    public String login(HttpServletResponse response, Admin admin, HttpSession session)throws Exception{
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        Admin admin1 = adminService.login(admin);
        if (admin1!=null){
            session.setAttribute("username",admin1.getUsername());
            out.print(JSON.toJSONString(1));
        }else {
            out.print(JSON.toJSONString(2));
        }
        return null;
    }

    @RequestMapping("register")
    public String register(HttpServletResponse response,Admin admin,HttpSession session)throws Exception{
        response.setCharacterEncoding("UTF-8");
        adminService.register(admin);

        session.setAttribute("username",admin.getUsername());

        PrintWriter out = response.getWriter();
        out.print(JSON.toJSONString(1));
        return null;
    }
}
