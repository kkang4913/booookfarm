package com.myweb.boookfarm;

import com.myweb.boookfarm.ncloud.Sens;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
public class LoginController {

    @GetMapping(value = "/login")
    public String login() {
        return "login";
    }

    @GetMapping(value = "/join")
    public String join() {
        return "join";
    }

    /**
     *  인증번호 발송 요청 받는 메서드
     * @param param 수신 받을 핸드폰 번호를 담은 JSON 객체 (key : pNum)
     * @return 인증번호 5자리를 담은 JSON 객체 반환
     */
    @PostMapping(value = "/sens")
    @ResponseBody
    public String sens(@RequestBody Map<String, String> param) {
        Sens sens = new Sens();
        String cNum = sens.callSendSMS(param.get("pNum"));  // 인증번호 발송과 함께 난수 인증번호 저장

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("cNum", cNum);   // 클라이언트로 보낼 인증번호 JSON 객체 생성
        return jsonObject.toJSONString();
    }

    @GetMapping(value = "/find")
    public String find() { return "find"; }

}
