package model;

import java.sql.Timestamp;
import java.util.Date;

public class Manjok {
    private int manjokIdx;
    private int manjokScore;
    private int manjokMemberIdx;
    private Timestamp manjokSobiDate;
    private int manjokCateIdx;

    public int getManjokIdx() {
        return manjokIdx;
    }

    public void setManjokIdx(int manjokIdx) {
        this.manjokIdx = manjokIdx;
    }

    public int getManjokScore() {
        return manjokScore;
    }

    public void setManjokScore(int manjokScore) {
        this.manjokScore = manjokScore;
    }

    public int getManjokMemberIdx() {
        return manjokMemberIdx;
    }

    public void setManjokMemberIdx(int manjokMemberIdx) {
        this.manjokMemberIdx = manjokMemberIdx;
    }

    public Timestamp getManjokSobiDate() {
        return manjokSobiDate;
    }

    public void setManjokSobiDate(Timestamp manjokSobiDate) {
        this.manjokSobiDate = manjokSobiDate;
    }

    public int getManjokCateIdx() {
        return manjokCateIdx;
    }

    public void setManjokCateIdx(int manjokCateIdx) {
        this.manjokCateIdx = manjokCateIdx;
    }
}
