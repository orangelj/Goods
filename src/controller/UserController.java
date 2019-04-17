package controller;

import com.alibaba.fastjson.JSON;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.UserService;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("selectAll")
    public String selectAll(HttpServletResponse response,Integer page,Integer rows,String username)throws Exception{
        response.setCharacterEncoding("UTF-8");
        List<User> users = userService.selectAll(page, rows, username);
        System.out.println(users);

        Integer total = userService.selectCount(username);
        Map<String, Object> maps = new HashMap<String,Object>();
        maps.put("rows",users);
        maps.put("total",total);

        PrintWriter out = response.getWriter();
        out.print(JSON.toJSONString(maps));
        return null;
    }

    @RequestMapping("add")
    public String add(HttpServletResponse response,User user)throws Exception{
        response.setCharacterEncoding("UTF-8");
        userService.insert(user);

        PrintWriter out = response.getWriter();
        out.print(JSON.toJSONString("success"));
        return null;
    }

    @RequestMapping("update")
    public String update(HttpServletResponse response,User user)throws Exception{
        response.setCharacterEncoding("UTF-8");
        userService.update(user);

        PrintWriter out = response.getWriter();
        out.print(JSON.toJSONString("success"));
        return null;
    }

    @RequestMapping("deleteByIds")
    public String deleteByIds(HttpServletResponse response,int[] ids)throws Exception{
        response.setCharacterEncoding("UTF-8");
        userService.deleteByIds(ids);
        PrintWriter out = response.getWriter();

        out.print(JSON.toJSONString("success"));
        return null;
    }
}
