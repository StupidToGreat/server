package dao;

import model.Sobi;
import model.sobiParam;

import java.util.HashMap;
import java.util.List;

public interface ISobiDao {
    public int insertSobi(Sobi sobi);

    public List<Sobi> selectAllByCate(HashMap<Object, Object> params);

    public HashMap<String, Object> selectAllByDay(HashMap<Object, Object> params);

    public HashMap<Integer, Integer> selectAllByHour(HashMap<Object, Object> params);

    public Integer getSobiAmount(HashMap<Object, Object> params);

    public Integer getSobiCountByCate(HashMap<Object, Object> params);

    public HashMap<String, Integer> selectAllByCateCount(HashMap<Object, Object> params);

    public List<HashMap<String, Object>> selectAllSobiByCate(String phoneNum);

    public List<HashMap<String, Object>> selectCountByBrand(HashMap<Object, Object> params);

    public List<sobiParam> getCalendarList(HashMap<String, Object> params);

    public List<HashMap<String, Object>> sobiList();

    public List<Sobi> getDailySobiList(HashMap<String, Object> params);

    public List<sobiParam> getDailyCateChart(HashMap<String, Object> params);

    public List<Sobi> getDailySobiListByCate(HashMap<String, Object> params);

    public Integer getMonthlySobiAllCount(HashMap<String, Object> params);

    public List<Sobi> getMonthlySobiList(HashMap<String, Object> params);

    public List<sobiParam> getMonthlyCateChart(HashMap<String, Object> params);

    public List<Sobi> getMonthlySobiListByCate(HashMap<String, Object> params);

    public Integer getMonthlyReportValue(HashMap<String, Object> params);

    public HashMap<String, Object> getMonthlyReportDate(HashMap<String, Object> params);

    public List<HashMap<String, Object>> getCardUseValue(HashMap<String, Object> params);
}
