package model;

public class Twitter {
    private int twitIdx;
    private String twitContents;
    private int twitRts;

    public int getTwitIdx() {
        return twitIdx;
    }

    public void setTwitIdx(int twitIdx) {
        this.twitIdx = twitIdx;
    }

    public String getTwitContents() {
        return twitContents;
    }

    public void setTwitContents(String twitContents) {
        this.twitContents = twitContents;
    }

    public int getTwitRts() {
        return twitRts;
    }

    public void setTwitRts(int twitRts) {
        this.twitRts = twitRts;
    }
}
