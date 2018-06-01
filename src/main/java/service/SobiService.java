package service;

import dao.IBunsokFileDao;
import dao.ISobiDao;
import model.BunsokFile;
import model.Sobi;
import model.sobiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.*;

@Service("sobiService")
public class SobiService implements ISobiService {
    @Autowired
    private ISobiDao sobiDao;
    @Autowired
    private IBunsokFileDao bunsokFileDao;

    @Override
    public int insertSobi(String stringDate, int balance, String brand, String means, String means2, String cate1, String cate2,
                          String cate3, String phoneNum) {
        int mon = stringDate.indexOf(' ');
        String month = stringDate.substring(0, mon);
        int da = stringDate.indexOf(", ");
        String day = stringDate.substring(mon + 1, da);
        String year = stringDate.substring(da + 2, da + 6);
        int hou = stringDate.indexOf(":");
        String hour = stringDate.substring(da + 7, hou);
        int min = stringDate.lastIndexOf(' ');
        String minute = stringDate.substring(hou + 1, min);
        String time = stringDate.substring(stringDate.length() - 2, stringDate.length());

        if (time.equals("PM") && !hour.equals("12"))
            hour = String.valueOf(Integer.parseInt(hour) + 12);

        String monthString = "";
        switch (month) {
            case "January":
                monthString = "1";
                break;
            case "February":
                monthString = "2";
                break;
            case "March":
                monthString = "3";
                break;
            case "April":
                monthString = "4";
                break;
            case "May":
                monthString = "5";
                break;
            case "June":
                monthString = "6";
                break;
            case "July":
                monthString = "7";
                break;
            case "August":
                monthString = "8";
                break;
            case "September":
                monthString = "9";
                break;
            case "October":
                monthString = "10";
                break;
            case "November":
                monthString = "11";
                break;
            case "December":
                monthString = "12";
                break;
        }
        String a = year + "-" + monthString + "-" + day + " " + hour + ":" + minute + ":" + "00";
        Timestamp date = Timestamp.valueOf(a);

        Sobi addSobi = new Sobi();
        addSobi.setSobiBalance(balance);
        addSobi.setSobiBrand(brand);
        addSobi.setSobiCate(cate1);
        addSobi.setSobiCate2(cate2);
        addSobi.setSobiCate3(cate3);
        addSobi.setSobiDate(date);
        addSobi.setSobiMeans(means);
        addSobi.setSobiMeans2(means2);
        addSobi.setSobiPhonenum(phoneNum);

        return sobiDao.insertSobi(addSobi);
    }

    @Override
    public int getSobiSum(String year, String month, String cate, String phoneNum) {
        HashMap<Object, Object> params = new HashMap<>();

        params.put("year", year);
        params.put("month", month);
        params.put("cate", cate);
        params.put("phoneNum", phoneNum);
        return sobiDao.getSobiAmount(params);
    }

    @Override
    public List<Sobi> getCateSobi(String year, String month, String cate, String phoneNum) {
        HashMap<Object, Object> params = new HashMap<>();
        params.put("year", year);
        params.put("month", month);
        params.put("cate", cate);
        params.put("phoneNum", phoneNum);
        return sobiDao.selectAllByCate(params);
    }

    @Override
    public String getSobiDay(String year, String month, String cate, String phoneNum) {
        HashMap<Object, Object> params = new HashMap<>();

        params.put("year", year);
        params.put("month", month);
        params.put("cate", cate);
        params.put("phoneNum", phoneNum);
//        HashMap<day요일, count횟수>
        HashMap<String, Object> maps = sobiDao.selectAllByDay(params);
        return (String) maps.get("dayname");
    }

    @Override
    public int getSobiHour(String year, String month, String cate, String phoneNum) {
        HashMap<Object, Object> params = new HashMap<>();

        params.put("year", year);
        params.put("month", month);
        params.put("cate", cate);
        params.put("phoneNum", phoneNum);
//        HashMap<hour 시간, count횟수>
        HashMap<Integer, Integer> maps = sobiDao.selectAllByHour(params);
        return (Integer) maps.get("hour");
    }

    @Override
    public int getSobiCount(String year, String month, String cate, String phoneNum) {
        HashMap<Object, Object> params = new HashMap<>();

        params.put("year", year);
        params.put("month", month);
        params.put("cate", cate);
        params.put("phoneNum", phoneNum);

        return sobiDao.getSobiCountByCate(params);
    }

    @Override
    public HashMap<String, Integer> getCateSobiCount(String year, String month, String cate, String phoneNum) {
        HashMap<Object, Object> params = new HashMap<>();

        params.put("year", year);
        params.put("month", month);
        params.put("cate", cate);
        params.put("phoneNum", phoneNum);

        return sobiDao.selectAllByCateCount(params);
    }

    @Override
    public List<HashMap<String, Object>> getAllSobiSum(String phoneNum) {
        return sobiDao.selectAllSobiByCate(phoneNum);
    }

    @Override
    public List<HashMap<String, Object>> getBrandCount(String year, String month, String cate, String phoneNum) {
        HashMap<Object, Object> params = new HashMap<>();

        params.put("year", year);
        params.put("month", month);
        params.put("cate", cate);
        params.put("phoneNum", phoneNum);

        return sobiDao.selectCountByBrand(params);
    }

    @Override
    public List<sobiParam> getCalendarList(int year, int month, String userPhone) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("year", year);
        params.put("month", month + 1);
        params.put("userPhone", userPhone);
        List<sobiParam> sobiSumList = sobiDao.getCalendarList(params);

        return sobiSumList;
    }

    @Override
    public List<Sobi> getDailySobiList(String day, String userPhone) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("day", day);
        params.put("userPhone", userPhone);
        List<Sobi> sobiList = sobiDao.getDailySobiList(params);

        return sobiList;
    }

    @Override
    public List<sobiParam> getDailyCateChart(String day, String userPhone) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("day", day);
        params.put("userPhone", userPhone);
        List<sobiParam> sp = sobiDao.getDailyCateChart(params);

        for (sobiParam s : sp) {
            if (s.getBalance() == 0) {
                s.setCateCount(0);
            }
        }

        return sp;
    }

    @Override
    public List<Sobi> getDailySobiListByCate(String day, String userPhone, String cate) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("day", day);
        params.put("userPhone", userPhone);
        params.put("cate", cate);
        List<Sobi> sobiList = sobiDao.getDailySobiListByCate(params);

        return sobiList;
    }

    @Override
    public HashMap<String, Object> getMonthlySobiList(int page, int year, int month, String userPhone) {
        //10개씩 끊기
        HashMap<String, Object> params = new HashMap<>();
        params.put("year", year);
        params.put("month", month);
        params.put("userPhone", userPhone);

        int start = (page - 1) / 10 * 10 + 1;
        int end = ((page - 1) / 10 + 1) * 10;
        int first = 1;
        int last = (sobiDao.getMonthlySobiAllCount(params) - 1) / 10 + 1;
        int skip = (page - 1) * 10;
        int count = 10;
        if (page != -1) {
            params.put("skip", skip);
            params.put("count", count);
        }

        end = last < end ? last : end;
        List<Sobi> sobiList = new ArrayList<>();
        sobiList = sobiDao.getMonthlySobiList(params);

        HashMap<String, Object> results = new HashMap<>();
        if (page != -1) {
            results.put("start", start);
            results.put("end", end);
            results.put("first", first);
            results.put("last", last);
            results.put("current", page);
        }
        results.put("sobiList", sobiList);

        return results;
    }

    @Override
    public List<sobiParam> getMonthlyCateChart(int year, int month, String userPhone) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("year", year);
        params.put("month", month);
        params.put("userPhone", userPhone);
        List<sobiParam> sp = sobiDao.getMonthlyCateChart(params);

        for (sobiParam s : sp) {
            if (s.getBalance() == 0) {
                s.setCateCount(0);
            }
        }

        return sp;
    }

    @Override
    public List<Sobi> getMonthlySobiListByCate(int year, int month, String userPhone, String cate) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("year", year);
        params.put("month", month);
        params.put("userPhone", userPhone);
        params.put("cate", cate);

        List<Sobi> sobiList = sobiDao.getMonthlySobiListByCate(params);

        return sobiList;
    }

    @Override
    public HashMap<String, Object> getMonthlyReportValue(String userPhone) {
        // 1.커피 (cate3)
        HashMap<String, Object> params = new HashMap<>();
        HashMap<String, Object> result = new HashMap<>();
        params.put("userPhone", userPhone);
        params.put("cate3", "카페");
        int coffee_all = sobiDao.getMonthlyReportValue(params);
        double coffee = coffee_all / 4100.0;
        result.put("coffee", coffee);

        // 2. 편의점(cate3)
        params.put("cate3", "편의점");
        int market = sobiDao.getMonthlyReportValue(params);
        result.put("market", market);

        // 3. 패스트푸드(cate3)
        params.put("cate3", "햄버거");
        int burger_all = sobiDao.getMonthlyReportValue(params);
        double burger = burger_all / 5500.0;
        result.put("burger", burger);

        // 4. 서점(cate3)
        params.put("cate3", "서점");
        int book_all = sobiDao.getMonthlyReportValue(params);
        double book = book_all / 12000.0;
        result.put("book", book);


        // 5. 영화관(cate3)
        params.put("cate3", "영화관");
        int movie_all = sobiDao.getMonthlyReportValue(params);
        double movie = movie_all / 10000.0;
        result.put("movie", movie);


        params.remove("cate3");

        // 6. 술집(cate2)
        params.put("cate2", "술집");
        int bar_all = sobiDao.getMonthlyReportValue(params);
        double bar = bar_all / 1500.0;
        result.put("bar", bar);

        // 7. 주유소(cate2)
        params.put("cate2", "주유소");
        int gas_all = sobiDao.getMonthlyReportValue(params);
        double gas = gas_all / 1600.0;
        result.put("gas", gas);

        //9. 병원/약국(최근날짜)
        params.put("cate2", "건강,의료");
        params.put("cate2_2", "병원,의원");
        HashMap<String, Object> hsList = sobiDao.getMonthlyReportDate(params);
        result.put("hsList", hsList);

        params.remove("cate2");
        //9.미용실(최근날짜)
        params.put("cate3", "미용실");
        HashMap<String, Object> hairList = sobiDao.getMonthlyReportDate(params);
        result.put("hairList", hairList);

        return result;
    }


    @Override
    public List<HashMap<String, Object>> getCardUseValue(int year, int month, String userPhone) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("year", year);
        params.put("month", month);
        params.put("userPhone", userPhone);

        List<HashMap<String,Object>> cardList = sobiDao.getCardUseValue(params);

        return cardList;
    }

    @Override
    public BunsokFile getBunsokFile(int fId) {
        BunsokFile bunsokFile = bunsokFileDao.selectBunsokFile(fId);
        return bunsokFile;
    }

    @Override
    public List<HashMap<String, Object>> budgetProgress(int year, int month, String userPhone) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("year", year);
        params.put("month", month);
        params.put("userPhone", userPhone);

        List<HashMap<String,Object>> bp = sobiDao.budgetProgress(params);

        return bp;
    }


}
