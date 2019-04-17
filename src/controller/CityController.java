package controller;

import com.alibaba.fastjson.JSON;
import entity.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.CityService;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/city")
public class CityController {
    @Autowired
    private CityService cityService;

    @RequestMapping("select")
    public String select(Integer parentId, HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("UTF-8");
        List<City> cities = cityService.select(parentId);

        PrintWriter out = response.getWriter();
        out.print(JSON.toJSONString(cities));
        return null;
    }
}
