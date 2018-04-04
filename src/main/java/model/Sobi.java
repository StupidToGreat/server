package model;

import org.joda.time.DateTime;

import java.sql.Timestamp;

public class Sobi {
    private Timestamp sobiDate;
    private int sobiBalance;
    private String sobiBrand;
    private String sobiMeans;
    private String sobiCate;
    private String sobiCate2;
    private String sobiCate3;
    private String sobiPhonenum;

    public Timestamp getSobiDate() {
        return sobiDate;
    }

    public void setSobiDate(Timestamp sobiDate) {
        this.sobiDate = sobiDate;
    }

    public int getSobiBalance() {
        return sobiBalance;
    }

    public void setSobiBalance(int sobiBalance) {
        this.sobiBalance = sobiBalance;
    }

    public String getSobiBrand() {
        return sobiBrand;
    }

    public void setSobiBrand(String sobiBrand) {
        this.sobiBrand = sobiBrand;
    }

    public String getSobiMeans() {
        return sobiMeans;
    }

    public void setSobiMeans(String sobiMeans) {
        this.sobiMeans = sobiMeans;
    }

    public String getSobiCate() {
        return sobiCate;
    }

    public void setSobiCate(String sobiCate1) {
        this.sobiCate = sobiCate1;
    }

    public String getSobiCate2() {
        return sobiCate2;
    }

    public void setSobiCate2(String sobiCate2) {
        this.sobiCate2 = sobiCate2;
    }

    public String getSobiCate3() {
        return sobiCate3;
    }

    public void setSobiCate3(String sobiCate3) {
        this.sobiCate3 = sobiCate3;
    }

    public String getSobiPhonenum() {
        return sobiPhonenum;
    }

    public void setSobiPhonenum(String sobiPhonenum) {
        this.sobiPhonenum = sobiPhonenum;
    }
}
