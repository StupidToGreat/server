package controller;

import model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.IMemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

@Controller
public class MemberController {
    @Autowired
    private IMemberService memberService;

    /**
     * 회원가입
     *
     * @param model
     * @param member
     * @param year
     * @param month
     * @param day
     * @return
     */
    @RequestMapping(value = "register.do", method = RequestMethod.POST)
    public String register(Model model, Member member, String year, String month, String day) {
        try {
            String str = year + "-" + month + "-" + day;
            Date birth = new SimpleDateFormat("yyyy-MM-dd").parse(str);
            member.setMemberBirth(birth);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        memberService.join(member);

        return "main";
    }

    /**
     * 회원가입 양식
     *
     * @return
     */
    @RequestMapping(value = "registerForm.do")
    public String registerForm(HttpServletRequest request) {
        return "register";
    }

    /**
     * SNS계정 회원가입 양식
     *
     * @return
     */
    @RequestMapping(value = "registerSNSForm.do")
    public String registerSNSForm(HttpServletRequest request, Model model) {
        model.addAttribute("email", request.getSession().getAttribute("email"));
        model.addAttribute("name", request.getSession().getAttribute("name"));
        return "registerWithSNS";
    }

    /**
     * 로그인 양식
     *
     * @return
     */
    @RequestMapping("loginForm.do")
    public String loginForm() {
        return "login";
    }

    /**
     * 로그인
     *
     * @param session 사용자의 아이디를 담고있는 세션
     * @param id
     * @return
     */
    @RequestMapping("login.do")
    public @ResponseBody
    HashMap<String, Object> login(HttpSession session, String id) {
        session.setAttribute("id", id);
        HashMap<String, Object> response = new HashMap<>();
        response.put("result", "session");

        return response;
    }

    /**
     * SNS계정 로그인
     * @param session
     * @param email
     * @param name
     * @return
     */
    @RequestMapping("loginWithSNS.do")
    public
    @ResponseBody
    HashMap<String, Object> loginWithSNS(HttpSession session, String email, String name, String gender) {
        System.out.println(gender);
        HashMap<String, Object> response = new HashMap<>();
        if (memberService.checkId(email)) {
            session.setAttribute("id", email);
            response.put("url", "main.do");
        } else {
            session.setAttribute("email", email);
            session.setAttribute("name", name);
            response.put("url", "registerSNSForm.do");
        }

        return response;
    }

    /**
     * 로그아웃
     *
     * @param session 아이디 삭제
     * @return
     */
    @RequestMapping("logout.do")
    public String logout(HttpSession session) {
        session.removeAttribute("id");

        return "redirect:main.do";
    }

    /**
     * 아이디 존재여부 확인
     *
     * @param id
     * @return
     */
    @RequestMapping("idCheck.do")
    public
    @ResponseBody
    HashMap<String, Object> idCheck(String id) {
        HashMap<String, Object> response = new HashMap<>();
        response.put("result", memberService.checkId(id));

        return response;
    }

    /**
     * 마이페이지 양식
     *
     * @param request 사용자 정보
     * @param model
     * @param mode
     * @return
     */
    @RequestMapping("myPageForm.do")
    public String myPage(HttpServletRequest request, Model model, @RequestParam(defaultValue = "0") int mode) {
        String id = (String) request.getSession().getAttribute("id");
        Member member = memberService.getMemberOne(id);
        model.addAttribute("member", member);
        model.addAttribute("mode", mode);

        return "myPage";
    }

    /**
     * 개인정보 변경
     *
     * @param request
     * @param member
     * @return
     */
    @RequestMapping("modifyMemberInfo.do")
    public String modifyMemberInfo(HttpServletRequest request, Member member) {
        Member memberSet = memberService.getMemberOne(member.getMemberId());
        memberSet.setMemberBudget(member.getMemberBudget());
        memberSet.setMemberPwd(member.getMemberPwd());
        memberService.modifyMember(memberSet);

        return "redirect:myPageForm.do?mode=1";
    }
}
