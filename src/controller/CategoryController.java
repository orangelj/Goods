package controller;


import com.alibaba.fastjson.JSON;
import entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.CategoryService;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("selectAll")
    public String selectAll(HttpServletResponse response,Integer page,Integer rows,String cname)throws Exception{
        response.setCharacterEncoding("UTF-8");
        List<Category> categories =   categoryService.selectAll(page, rows, cname);
        Integer total = categoryService.selectCount(cname);
        Map<String,Object> maps = new HashMap<>();
        maps.put("total",total);
        maps.put("rows",categories);

        PrintWriter out = response.getWriter();
        out.print(JSON.toJSONString(maps));
        return null;
    }

    @RequestMapping("selectByFid")
    public String selectByFid(HttpServletResponse response,Integer parentId)throws Exception{
        response.setCharacterEncoding("UTF-8");
        List<Category> categories = categoryService.selectByFid(parentId);

        PrintWriter out = response.getWriter();
        out.print(JSON.toJSONString(categories));
        return null;
    }
}
