package service;

import dao.IMemberDao;
import model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService implements IMemberService {
    @Autowired
    IMemberDao memberDao;

    @Override
    public void join(Member member) {
        memberDao.insertMember(member);
    }

    @Override
    public boolean checkId(String id) {
        Member member = memberDao.selectOne(id);
        if (member == null) {
            return false;
        }
        return true;
    }

    @Override
    public boolean checkPwd(String id, String pwd) {
        Member member = memberDao.selectOne(id);
        if(member.getMemberPwd().equals(pwd)) {
            return true;
        }
        return false;
    }

    @Override
    public Member getMemberOne(String id) {
       Member member = memberDao.selectOne(id);
       return member;
    }

    @Override
    public void modifyMember(Member member) {
        memberDao.updateMember(member);

    }
}
