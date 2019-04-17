package controller;

import com.alibaba.fastjson.JSON;
import entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.ProductService;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @RequestMapping("selectAll")
    public String selectAll(HttpServletResponse response,Integer page,Integer rows,String pname)throws Exception{
        response.setCharacterEncoding("UTF-8");
        //分页
        List<Product> products = productService.selectAll(page,rows,pname);
        //数据总条数
        Integer total = productService.total(pname);

        Map<String,Object> maps = new HashMap<String,Object>();
        maps.put("total",total);
        maps.put("rows",products);

        PrintWriter out = response.getWriter();
        out.print(JSON.toJSONString(maps));
        return null;
    }

    @RequestMapping("add")
    public String add(HttpServletResponse response,Product product)throws Exception{
        response.setCharacterEncoding("UTF-8");
        productService.add(product);

        System.out.println(product);

        PrintWriter out = response.getWriter();
        out.print(JSON.toJSONString("success"));
        return null;
    }

    @RequestMapping("update")
    public String update(HttpServletResponse response,Product product)throws Exception{

        response.setCharacterEncoding("UTF-8");
        productService.update(product);

        PrintWriter out = response.getWriter();
        out.print(JSON.toJSONString("success"));
        return null;
    }

    @RequestMapping("delete")
    public String delete(HttpServletResponse response,Integer pid)throws Exception{
        response.setCharacterEncoding("UTF-8");
        productService.delete(pid);

        PrintWriter out = response.getWriter();
        out.print(JSON.toJSONString("success"));
        return null;
    }

    @RequestMapping("deleteByIds")
    public String deleteByIds(HttpServletResponse response,int[] ids)throws Exception{
        response.setCharacterEncoding("UTF-8");
        productService.deleteByIds(ids);

        PrintWriter out = response.getWriter();
        out.print(JSON.toJSONString("success"));
        return null;
    }

    @RequestMapping("selectOne")
    public String selectOne(HttpServletResponse response,String pid,Product product)throws Exception{
        response.setCharacterEncoding("UTF-8");
        product = productService.selectOne(pid);

        PrintWriter out = response.getWriter();
        out.print(JSON.toJSONString(product));
        return null;
    }
}
