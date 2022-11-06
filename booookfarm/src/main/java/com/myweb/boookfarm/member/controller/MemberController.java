package com.myweb.boookfarm.member.controller;

import com.myweb.boookfarm.member.model.MemberDTO;
import com.myweb.boookfarm.member.service.MemberService;
import com.myweb.boookfarm.ncloud.Sens;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
public class MemberController {

    @Autowired
    private MemberService memServ;

    @GetMapping(value = "/login")
    public String login() {
        return "login";
    }

    @GetMapping(value = "/join")
    public String join() {
        return "join";
    }

    @PostMapping(value = "/join")
    public String joinMem(@RequestParam String name
                        , @RequestParam String id
                        , @RequestParam String pw
                        , @RequestParam String phone
                        , @RequestParam String email
                        , @RequestParam (required = false) String gender
                        , @RequestParam String postalCode
                        , @RequestParam String address
                        , @RequestParam String detailAddress) {
        MemberDTO newMem = new MemberDTO();
        newMem.setMemName(name);
        newMem.setMemId(id);
        newMem.setMemPw(pw);
        newMem.setPhone(phone);
        newMem.setEmail(email);
        newMem.setPostCode(postalCode);
        newMem.setAddr(address);
        newMem.setDetailAddr(detailAddress);
        newMem.setMileage("0");
        newMem.setSocialType("com");
        newMem.setMemPos("com");
        boolean result = memServ.addMemData(newMem);
        if (result) {
            return "standard/standard";
        }

        return "join";
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
