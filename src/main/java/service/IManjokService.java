package service;

import model.Manjok;

import java.util.List;

public interface IManjokService {
    public int dailyManjokCheck(String day, int memIdx);

    public int getManjokScore(String day, int memIdx);

    public int setManjokScore(String day, int memIdx, int score);

    public float getMonthlyManjokScore(int year, int month, int memIdx);

    public List<Manjok> getManjokList(int year, int month, int memIdx);
}
