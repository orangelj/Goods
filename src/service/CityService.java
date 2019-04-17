package service;

import entity.City;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CityService {

    List<City> select(@Param("parentId") Integer parentId);
}
