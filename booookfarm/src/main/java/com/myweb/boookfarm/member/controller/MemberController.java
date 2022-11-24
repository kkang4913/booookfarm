package com.myweb.boookfarm.member.controller;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.myweb.boookfarm.member.model.MemberDTO;
import com.myweb.boookfarm.member.service.MemberService;
import com.myweb.boookfarm.naver.NaverLoginBO;
import com.myweb.boookfarm.naver.Sens;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class MemberController {

    @Autowired
    private MemberService memServ;

    /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;

    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    /**
     * 로그인 페이지 요청 메서드
     * @return 로그인 페이지 반환
     */
    @GetMapping(value = "/login")
    public String getLoginView(Model model, HttpSession httpSession) {
        /* 네아로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(httpSession);
        /* 객체 바인딩 */
        model.addAttribute("urlNaver", naverAuthUrl);

        return "login";
    }

    /**
     * 로그인 요청 메서드
     * @param param 요청 로그인 정보
     * @param httpSession
     * @return 로그인 성공 여부 반환
     */
    @PostMapping(value = "/login")
    @ResponseBody
    public String login(@RequestBody Map<String, String> param
                      , HttpSession httpSession) {
        if(httpSession.getAttribute("loginData") != null) {
            httpSession.removeAttribute("loginData");
        }
        String loginId = param.get("id");
        String loginPw = param.get("pw");
        JSONObject jsonObject = new JSONObject();

        MemberDTO loginData = memServ.getLoginData(loginId, loginPw);
        if(loginData == null) {
            jsonObject.put("chkLogin", false);
        } else {
            jsonObject.put("chkLogin", true);
            httpSession.setAttribute("loginData", loginData);
        }

        return jsonObject.toJSONString();
    }

    /**
     *  네이버 로그인 성공시 callback호출 메소드
     * @param httpSession
     * @param code
     * @param state
     * @return 네이버 로그인 성공 메서드 호출
     * @throws Exception
     */
    @RequestMapping(value = "/callbackNaver", method = { RequestMethod.GET, RequestMethod.POST })
    public String callbackNaver(HttpSession httpSession
                              , @RequestParam String code
                              , @RequestParam String state)
            throws Exception {
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(httpSession, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);

        JSONParser jsonParser = new JSONParser();
        JSONObject naverLoginData;

        naverLoginData = (JSONObject) jsonParser.parse(apiResult);
        JSONObject response_obj = (JSONObject) naverLoginData.get("response");
        String naverId = (String) response_obj.get("id");
        MemberDTO memData = memServ.getMemData(naverId);

        if(memData == null) {   // 네이버 로그인으로 가입한 정보가 없으면
            httpSession.setAttribute("naverLoginData", naverLoginData);
        } else {    // 네이버 로그인으로 가입한 정보가 있을 때
            httpSession.setAttribute("loginData", memData);
        }

        return "redirect:/naverLoginSuccess";
    }

    // 소셜 로그인 성공 페이지
    @RequestMapping("/naverLoginSuccess")
    public String loginSuccess(HttpSession httpSession) {
        if(httpSession.getAttribute("loginData") == null)
            return "redirect:/join";
        return "redirect:/";
    }

    @GetMapping(value = "/logout")
    public String logout(HttpSession httpSession) {
        MemberDTO loginData = (MemberDTO) httpSession.getAttribute("loginData");
        if(loginData == null) {
        } else {
            httpSession.removeAttribute("loginData");
        }
        return "redirect:/";
    }

    /**
     * 회원가입 페이지 요청 메서드
     * @return 회원가입 페이지 반환
     */
    @GetMapping(value = "/join")
    public String join() {
        return "join";
    }

    @PostMapping(value = "/join")
    @ResponseBody
    public String joinMem(@RequestBody Map<String, String> param) {
        MemberDTO newMem = new MemberDTO();
        newMem.setMemName(param.get("name"));
        newMem.setMemId(param.get("id"));
        newMem.setMemPw(param.get("pw"));
        newMem.setPhone(param.get("phone"));
        newMem.setEmail(param.get("email"));
        newMem.setPostCode(param.get("postCode"));
        newMem.setAddr(param.get("addr"));
        newMem.setDetailAddr(param.get("detailAddr"));
        newMem.setMileage("0");
        newMem.setSocialType(param.get("joinType"));
        newMem.setMemPos("com");
        System.out.println(newMem);
        JSONObject jsonObject = new JSONObject();
        boolean result = memServ.addMemData(newMem);
        jsonObject.put("joinRes", result);

        return jsonObject.toJSONString();
    }

    /**
     *  인증번호 발송 요청 받는 메서드
     * @param param 수신 받을 핸드폰 번호를 담은 JSON 객체 (key : pNum)
     * @return 인증번호 5자리를 담은 JSON 객체 반환
     */
    @PostMapping(value = "/phoneChk")
    @ResponseBody
    public String phoneChk(@RequestBody Map<String, String> param) {
        String phoneNum = param.get("pNum");
        JSONObject jsonObject = new JSONObject();

        boolean dupChk = memServ.chkPhoneDup(phoneNum);
        jsonObject.put("phoneDupChk", dupChk);
        if(dupChk) {
            return jsonObject.toJSONString();
        }
        Sens sens = new Sens();
//        String cNum = sens.callSendSMS(phoneNum);  // 인증번호 발송과 함께 난수 인증번호 저장
        String cNum = "12345";

        jsonObject.put("cNum", cNum);   // 클라이언트로 보낼 인증번호 JSON 객체 생성
        return jsonObject.toJSONString();
    }

    /**
     *  아이디 중복 체크하는 메서드
     * @param param
     * @return
     */
    @PostMapping(value = "/idDupChk")
    @ResponseBody
    public String idDupChk(@RequestBody Map<String, String> param) {
        String memId = param.get("id");
        boolean dupChk = memServ.chkIdDup(memId);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("dupChk", dupChk);
        return jsonObject.toJSONString();
    }

    @GetMapping(value = "/find")
    public String find() { return "find"; }

}
