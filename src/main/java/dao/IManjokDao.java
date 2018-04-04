package dao;

import model.Manjok;

import java.util.HashMap;
import java.util.List;


public interface IManjokDao {
    public int dailyManjokCheck(HashMap<String, Object> params);

    public int getManjokScore(HashMap<String, Object> params);

    public Integer setManjokScore(HashMap<String, Object> params);

    public float getMonthlyManjokScore(HashMap<String, Object> params);

    public List<Manjok> getManjokList(HashMap<String, Object> params);
}
