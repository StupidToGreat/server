package dao;

import model.Ggong;

import java.util.HashMap;
import java.util.List;

public interface IGgongDao {
    public Integer insertGgong(Ggong ggong);

    public Integer updateGgong(Ggong ggong);

    public Integer deleteGgong(Integer idx);

    public List<HashMap<String, Object>> selectAllByAgeGender(String phoneNum);

    public HashMap<String, Object> selectMyAgeGender(String phoneNum);

    public List<Object> getSumBySameAge(Object age);

    public Object getMyMonthSum(HashMap<String, Object> params);
}
