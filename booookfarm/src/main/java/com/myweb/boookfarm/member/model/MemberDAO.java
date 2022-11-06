package com.myweb.boookfarm.member.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession session;
	
	private String mapper = "memberMapper.%s";

	public MemberDTO getMemData(String memId) {
		String mapperId = String.format(mapper, "selectMemData");
		MemberDTO memData = session.selectOne(mapperId, memId);

		return memData;
	}

	/**
	 *  DB에서 id와 일치하는 member_id를 찾는 메서드
	 * @param id DB에서 찾을 id
	 * @return DB에서 찾은 member_id 반환
	 */
    public String getMemId(String id) {
		String mapperId = String.format(mapper, "selectMemId");
		String memId = session.selectOne(mapperId, id);

		return memId;
    }

	/**
	 *  DB에서 phone과 일치하는 phone을 찾는 메서드
	 * @param phone DB에서 찾을 phone
	 * @return DB에서 찾은 phone 반환
	 */
	public String getMemPhone(String phone) {
		String mapperId = String.format(mapper, "selectMemPhone");
		String memPhone = session.selectOne(mapperId, phone);

		return memPhone;
	}

	public int addMemData(MemberDTO newMem) {
		String mapperId = String.format(mapper, "insertMemData");
		int result = session.insert(mapperId, newMem);
		return result;
	}
}
