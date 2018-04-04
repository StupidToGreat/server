package service;

import model.Member;

public interface IMemberService {
    public void join(Member member);

    public boolean checkId(String id);

    public boolean checkPwd(String id, String pwd);

    public Member getMemberOne(String id);

    public void modifyMember(Member member);
}

