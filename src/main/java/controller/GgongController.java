package controller;

import model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.IGgongService;
import service.IMemberService;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class GgongController {
    @Autowired
    private IGgongService ggongService;
    @Autowired
    private IMemberService memberService;

    @RequestMapping(value = "ggongData.do", produces = {"application/json"})
    public @ResponseBody
    List<HashMap<String, Object>> ggongData(HttpServletRequest request) {
        String id = (String) request.getSession().getAttribute("id");
        Member member = memberService.getMemberOne(id);

        String phoneNum = member.getMemberPhonenum();
        List<HashMap<String, Object>> glist = ggongService.selectAllByGenderAge(phoneNum);
        return glist;
    }

    @RequestMapping(value = "ggongMyData.do", produces = {"application/json"})
    public @ResponseBody
    HashMap<String, Object> ggongMyData(HttpServletRequest request) {
        String id = (String) request.getSession().getAttribute("id");
        Member member = memberService.getMemberOne(id);

        String phoneNum = member.getMemberPhonenum();
        return ggongService.selectMyGenderAge(phoneNum);
    }


    @RequestMapping(value = "ggongChartData.do", produces = {"application/json"})
    public @ResponseBody
    List<Object> ggongChartData(HttpServletRequest request) {
        String id = (String) request.getSession().getAttribute("id");
        Member member = memberService.getMemberOne(id);

        String phoneNum = member.getMemberPhonenum();
        return ggongService.getMonthlySum(phoneNum);
    }

    /**
     * 나의 소비그룹 비교
     *
     * @param request
     * @return
     */
    @RequestMapping("ggongChart.do")
    public String ggongChart(HttpServletRequest request) {
        return "ggongChart";
    }
}