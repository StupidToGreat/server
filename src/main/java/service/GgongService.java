package service;

import dao.IGgongDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class GgongService implements IGgongService {
    @Autowired
    private IGgongDao ggongDao;

    Calendar today = Calendar.getInstance();
    int year = today.get(Calendar.YEAR);
    int month = today.get(Calendar.MONTH) + 1;

    @Override
    public List<HashMap<String, Object>> selectAllByGenderAge(String phoneNum) {
        return ggongDao.selectAllByAgeGender(phoneNum);
    }

    @Override
    public HashMap<String, Object> selectMyGenderAge(String phoneNum) {
        return ggongDao.selectMyAgeGender(phoneNum);
    }

    @Override
    public List<Object> getMonthlySum(String phoneNum) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("year", year);
        params.put("month", month);
        params.put("phoneNum", phoneNum);
        Object ms = ggongDao.getMyMonthSum(params);
        params = ggongDao.selectMyAgeGender(phoneNum);

        Object myage = params.get("age");
        int age = Integer.parseInt(myage.toString());
        if (age < 20)
            myage = 20;
        else if (age >= 70)
            myage = 60;

        List<Object> gs = ggongDao.getSumBySameAge(myage);
        gs.add(ms);
        gs.add(myage);

        return gs;
//        [0의 금액, 1의 금액, 내금액, 내 나이대]
    }
}