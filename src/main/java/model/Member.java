package model;

import java.util.Date;

public class Member {
    private int memberIdx;
    private String memberId;
    private String memberPwd;
    private String memberName;
    private int memberGender;
    private Date memberBirth;  
    private String memberPhonenum;
    private int memberBudget;
    private Date memberJoindate;

    public int getMemberIdx() {
        return memberIdx;
    }

    public void setMemberIdx(int memberIdx) {
        this.memberIdx = memberIdx;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getMemberPwd() {
        return memberPwd;
    }

    public void setMemberPwd(String memberPwd) {
        this.memberPwd = memberPwd;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public int getMemberGender() {
        return memberGender;
    }

    public void setMemberGender(int memberGender) {
        this.memberGender = memberGender;
    }

    public Date getMemberBirth() {
        return memberBirth;
    }

    public void setMemberBirth(Date memberBirth) {
        this.memberBirth = memberBirth;
    }

    public String getMemberPhonenum() {
        return memberPhonenum;
    }

    public void setMemberPhonenum(String memberPhonenum) {
        this.memberPhonenum = memberPhonenum;
    }

    public int getMemberBudget() {
        return memberBudget;
    }

    public void setMemberBudget(int memberBudget) {
        this.memberBudget = memberBudget;
    }

    public Date getMemberJoindate() {
        return memberJoindate;
    }

    public void setMemberJoindate(Date memberJoindate) {
        this.memberJoindate = memberJoindate;
    }

}
