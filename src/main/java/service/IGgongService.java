package service;

import java.util.HashMap;
import java.util.List;

public interface IGgongService {
    public List<HashMap<String, Object>> selectAllByGenderAge(String phoneNUm);

    public HashMap<String, Object> selectMyGenderAge(String phoneNum);

    public List<Object> getMonthlySum(String phoneNum);
}
