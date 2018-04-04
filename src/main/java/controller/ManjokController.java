package controller;

import model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.IManjokService;
import service.IMemberService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ManjokController {
    @Autowired
    private IManjokService manjokService;
    @Autowired
    private IMemberService memberService;

    /**
     * 만족도 설정
     * @param day
     * @param score
     * @return
     */
    @RequestMapping("setManjokScore.do")
    public String setManjokScore(HttpServletRequest request, String day, int score) {
        Member member = memberService.getMemberOne((String) request.getSession().getAttribute("id"));
        manjokService.setManjokScore(day, member.getMemberIdx(), score);
        return "redirect:dailyCategory.do?day=" + day;
    }

}
