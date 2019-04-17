package test;

import dao.ProductDAO;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestProduct {
    @Test
    public void test(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        ProductDAO productDAO = (ProductDAO) ac.getBean("productDAO");
        Integer integer = productDAO.selectCount(null);
        System.out.println(integer);

    }
}
