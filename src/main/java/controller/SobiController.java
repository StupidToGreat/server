package controller;

import model.*;
import org.apache.tools.ant.taskdefs.condition.Http;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;
import service.IManjokService;
import service.IMemberService;
import service.ISobiService;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class SobiController {
    @Autowired
    private ISobiService sobiService;
    @Autowired
    private IManjokService manjokService;
    @Autowired
    private IMemberService memberService;

    /**
     * 홈화면
     *
     * @return
     */
    @RequestMapping(value = "main.do")
    public String main(HttpServletRequest request, Model model) {
        model.addAttribute("id", request.getSession().getAttribute("id"));
        return "main";
    }

    /**
     * 로그인화면 전 첫페이지
     *
     * @return
     */
    @RequestMapping(value = "index.do")
    public String index() {
        return "index";
    }

    /**
     * 트랜드 분석
     *
     * @return
     */
    @RequestMapping(value = "trendAnalysis.do")
    public String trendAnalysis() {
        return "analysis";
    }

    /**
     * 월, 카테고리별 소비 세부정보
     *
     * @param request 사용자 전화번호
     * @param model
     * @param year
     * @param month
     * @param cate
     * @return
     */
    @RequestMapping("monthCategoryDetail.do")
    public String monthCategoryDetail(HttpServletRequest request, Model model, String year, String month, String cate) {
        Member member = memberService.getMemberOne((String) request.getSession().getAttribute("id"));

        int count = sobiService.getSobiCount(year, month, cate, member.getMemberPhonenum());
        if (count == 0) {
            return "go";
        }

        model.addAttribute("year", year);
        model.addAttribute("month", month);
        model.addAttribute("cate", cate);

        return "monthCategoryDetail";
    }

    /**
     * 카테고리별 소비정보
     *
     * @param request 사용자 전화번호
     * @param year
     * @param month
     * @param cate
     * @return
     */
    @RequestMapping("categoryDetail.do")
    public @ResponseBody
    HashMap<String, Object> categoryDetail(HttpServletRequest request, String year, String month, String cate) {
        Member member = memberService.getMemberOne((String) request.getSession().getAttribute("id"));
        String day = sobiService.getSobiDay(year, month, cate, member.getMemberPhonenum());
        int hour = sobiService.getSobiHour(year, month, cate, member.getMemberPhonenum());
        int count = sobiService.getSobiCount(year, month, cate, member.getMemberPhonenum());
        int sum = sobiService.getSobiSum(year, month, cate, member.getMemberPhonenum());

        HashMap<String, Object> list = new HashMap<>();
        list.put("cate", cate);
        list.put("sum", sum);
        list.put("day", day);
        list.put("hour", hour);
        list.put("count", count);

        return list;
    }

    @RequestMapping(value = "sobiTable.do", produces = {"application/json"})
    public @ResponseBody
    List<Sobi> sobiTable(HttpServletRequest request, String year, String month, String cate) {
        Member member = memberService.getMemberOne((String) request.getSession().getAttribute("id"));

        return sobiService.getCateSobi(year, month, cate, member.getMemberPhonenum());
    }

    @RequestMapping(value = "sobiChart.do", produces = {"application/json"})
    public @ResponseBody
    List<HashMap<String, Object>> sobiChart(HttpServletRequest request, String year, String month, String cate) {
        Member member = memberService.getMemberOne((String) request.getSession().getAttribute("id"));

        return sobiService.getBrandCount(year, month, cate, member.getMemberPhonenum());
    }

    /**
     * 현금 입력양식
     *
     * @return
     */
    @RequestMapping("cashInputForm.do")
    public String cashInputForm(HttpServletRequest request) {
        return "cashInputForm";
    }

    /**
     * 현금입력
     *
     * @param request
     * @param date
     * @param balance
     * @param brand
     * @param means
     * @param means2
     * @param cate1
     * @param cate2
     * @param cate3
     * @return
     * @throws ParseException
     */
    @RequestMapping("cashInput.do")
    public String castInput(HttpServletRequest request, String date, int balance, String brand, String means, String means2, String cate1, String cate2, String cate3) throws ParseException {
        Member member = memberService.getMemberOne((String) request.getSession().getAttribute("id"));

        if (cate1.equals("외식"))
            cate1 = "eatout";
        else if(cate1.equals("마켓/편의점"))
            cate1 = "market";
        else if(cate1.equals("쇼핑"))
            cate1 = "shop";
        else if(cate1.equals("교통"))
            cate1 = "trans";
        else if(cate1.equals("생활비"))
            cate1 = "life";
        else if(cate1.equals("문화생활"))
            cate1 = "interest";
        else if(cate1.equals("기타"))
            cate1 = "etc";
        sobiService.insertSobi(date, balance, brand, means, means2, cate1, cate2, cate3, member.getMemberPhonenum());

        return "redirect:main.do";
    }

    /**
     * 달력
     *
     * @param request
     * @return
     */
    @RequestMapping("calendar.do")
    public String calendar(HttpServletRequest request) {
        return "calendar";
    }

    /**
     * @param request   세션에서 가져온 사용자 전화번호
     * @param currMonth
     * @param currYear
     * @return
     */
    @RequestMapping(value = "getCalendarList.do", produces = {"application/json"})
    public @ResponseBody
    HashMap<String, Object> getCalendarList(HttpServletRequest request, int currMonth, int currYear) {
        Member member = memberService.getMemberOne((String) request.getSession().getAttribute("id"));
        List<sobiParam> sobiList = sobiService.getCalendarList(currYear, currMonth, member.getMemberPhonenum());
        List<Manjok> manjokList = manjokService.getManjokList(currYear, currMonth, member.getMemberIdx());

        HashMap<String, Object> result = new HashMap<>();
        result.put("sobiList", sobiList);
        result.put("manjokList", manjokList);

        return result;
    }

    /**
     * 카테고리, 일별 세부정보
     *
     * @param request 세션에서 사용자 전화번호와 인덱스
     * @param model
     * @param day
     * @return
     */
    @RequestMapping("dailyCategory.do")
    public String dailyCategory(HttpServletRequest request, Model model, String day) {
        Member member = memberService.getMemberOne((String) request.getSession().getAttribute("id"));
        int manjokCheck = manjokService.dailyManjokCheck(day, member.getMemberIdx());

        model.addAttribute("member", member);
        model.addAttribute("manjokCheck", manjokCheck);
        model.addAttribute("day", day);
        if (manjokCheck > 0) {
            int manjokScore = manjokService.getManjokScore(day, member.getMemberIdx());
            model.addAttribute("manjokScore", manjokScore);
        }

        return "dailyCategory";
    }

    @RequestMapping(value = "getdailyChart.do", produces = {"application/json"})
    public @ResponseBody
    HashMap<String, Object> getDailyChartValue(HttpServletRequest request, String day) throws ParseException{
        Member member = memberService.getMemberOne((String) request.getSession().getAttribute("id"));

        List<Sobi> sobiList = sobiService.getDailySobiList(day, member.getMemberPhonenum());
        List<sobiParam> sobiParam = sobiService.getDailyCateChart(day, member.getMemberPhonenum());

        HashMap<String, Object> result = new HashMap<>();
        result.put("sobiList", sobiList);
        result.put("sobiParam", sobiParam);

        return result;
    }

    @RequestMapping(value = "getDailyListByCate.do", produces = {"application/json"})
    public @ResponseBody
    List<Sobi> getDailyListByCate(HttpServletRequest request, String day, String cate) {
        Member member = memberService.getMemberOne((String) request.getSession().getAttribute("id"));

        List<Sobi> sobiList = sobiService.getDailySobiListByCate(day, member.getMemberPhonenum(), cate);

        return sobiList;
    }

    @RequestMapping("monthlyCategory.do")
    public String monthlyCategory(HttpServletRequest request, Model model, @RequestParam(defaultValue = "1") String page, String year, String month) {
        int pg = Integer.parseInt(page);
        int y = Integer.parseInt(year);
        int m = Integer.parseInt(month);

        Member member = memberService.getMemberOne((String) request.getSession().getAttribute("id"));
        float score = manjokService.getMonthlyManjokScore(y, m, member.getMemberIdx());

        model.addAttribute("member", memberService.getMemberOne((String) request.getSession().getAttribute("id")));
        model.addAttribute("year", y);
        model.addAttribute("month", m);
        model.addAttribute("score", Math.round(score * 20));
        model.addAllAttributes(sobiService.getMonthlySobiList(pg, y, m, member.getMemberPhonenum()));

        return "monthlyCategory";
    }

    @RequestMapping(value = "getMonthlyChart.do", produces = {"application/json"})
    public @ResponseBody
    HashMap<String, Object> getMonthlyChartValue(HttpServletRequest request, String year, String month) {
        Member member = memberService.getMemberOne((String) request.getSession().getAttribute("id"));
        int y = Integer.parseInt(year);
        int m = Integer.parseInt(month);

        List<sobiParam> sobiChart = sobiService.getMonthlyCateChart(y, m, member.getMemberPhonenum());
        HashMap<String, Object> result = new HashMap<>();
        result.put("sobiChart", sobiChart);

        return result;
    }

    @RequestMapping(value = "getMonthlyListByCate.do", produces = {"application/json"})
    public @ResponseBody
    List<Sobi> getMonthlyListByCate(HttpServletRequest request, String year, String month, String cate) {
        Member member = memberService.getMemberOne((String) request.getSession().getAttribute("id"));
        int y = Integer.parseInt(year);
        int m = Integer.parseInt(month);

        List<Sobi> sobiList = sobiService.getMonthlySobiListByCate(y, m, member.getMemberPhonenum(), cate);

        return sobiList;
    }

    @RequestMapping(value = "getMonthlyList.do", produces = {"application/json"})
    public @ResponseBody
    HashMap<String, Object> getMonthlyList(HttpServletRequest request, String year, String month) {
        int y = Integer.parseInt(year);
        int m = Integer.parseInt(month);

        Member member = memberService.getMemberOne((String) request.getSession().getAttribute("id"));
        HashMap<String, Object> sobiList = sobiService.getMonthlySobiList(-1, y, m, member.getMemberPhonenum());
        HashMap<String, Object> sobiBeforeList = sobiService.getMonthlySobiList(-1, y, m - 1, member.getMemberPhonenum());
        int sum = 0;
        for (Sobi sobi : (List<Sobi>) sobiList.get("sobiList")) {
            sum += sobi.getSobiBalance();
        }
        sobiList.put("sum", sum);
        sobiList.put("budget", member.getMemberBudget());
        sobiList.put("sobiBefore", (List<Sobi>) sobiBeforeList.get("sobiList"));

        return sobiList;
    }

    /**
     * 월간보고서
     *
     * @param request 세션에서 가져온 사용자 전화번호
     * @param model
     * @return
     */
    @RequestMapping("monthlyReport.do")
    public String monthlyReport(HttpServletRequest request, Model model) {
        Member member = memberService.getMemberOne((String) request.getSession().getAttribute("id"));
        model.addAllAttributes(sobiService.getMonthlyReportValue(member.getMemberPhonenum()));

        return "monthlyReport";
    }

    @RequestMapping(value = "getCardChartValue.do", produces = {"application/json"})
    public @ResponseBody
    List<HashMap<String, Object>> getCardChartValue(HttpServletRequest request, String year, String month) {
        int y = Integer.parseInt(year);
        int m = Integer.parseInt(month);
        Member member = memberService.getMemberOne((String) request.getSession().getAttribute("id"));

        List<HashMap<String, Object>> cardList = sobiService.getCardUseValue(y, m + 1, member.getMemberPhonenum());


        return cardList;
    }

    @RequestMapping("download.do")
    public View download(int fId) {
        BunsokFile bunsokFile = sobiService.getBunsokFile(fId);
        File file = new File(bunsokFile.getUri());
        return new DownloadView(file, bunsokFile.getName());
    }
}
