package service;

import model.BunsokFile;
import model.Sobi;
import model.sobiParam;

import java.util.HashMap;
import java.util.List;

public interface ISobiService {
    public int insertSobi(String stringDate, int balance, String brand, String means, String means2, String cate, String cate2, String cate3, String phoneNum);

    public int getSobiSum(String year, String month, String cate, String phoneNum);

    public List<Sobi> getCateSobi(String year, String month, String cate, String phoneNum);

    public String getSobiDay(String year, String month, String cate, String phoneNum);

    public int getSobiHour(String year, String month, String cate, String phoneNum);

    public int getSobiCount(String year, String month, String cate, String phoneNum);

    public HashMap<String, Integer> getCateSobiCount(String year, String month, String cate, String phoneNum);

    public List<HashMap<String, Object>> getAllSobiSum(String phoneNum);

    public List<HashMap<String, Object>> getBrandCount(String year, String month, String cate, String phoneNum);

    public List<sobiParam> getCalendarList(int year, int month, String userPhone);

    public List<Sobi> getDailySobiList(String day, String userPhone);

    public List<sobiParam> getDailyCateChart(String day, String userPhone);

    public List<Sobi> getDailySobiListByCate(String day, String userPhone, String cate);

    public HashMap<String, Object> getMonthlySobiList(int page, int year, int month, String userPhone);

    public List<sobiParam> getMonthlyCateChart(int year, int month, String userPhone);

    public List<Sobi> getMonthlySobiListByCate(int year, int month, String userPhone, String cate);

    public HashMap<String, Object> getMonthlyReportValue(String userPhone);

    public List<HashMap<String, Object>> getCardUseValue(int year, int month, String userPhone);

    public BunsokFile getBunsokFile(int fId);
}
