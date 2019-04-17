package dao;

import entity.City;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CityDAO {

    List<City> select(@Param("parentId") Integer parentId);

}
