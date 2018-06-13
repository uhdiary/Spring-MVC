package com.tong.lesson.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tong.lesson.member.vo.MemberVO;
import com.tong.lesson.safepay.vo.PagingVO;

public interface MemberService {

	MemberVO selectMember(MemberVO vo);
	
	int insertMember(MemberVO vo);

	int membermupdate(MemberVO vo);

	int mdel(MemberVO attribute);

	String idfindin(MemberVO vo);

	String pwdfindin(MemberVO vo);

	int pwding(MemberVO vo);

	String idcheck(MemberVO vo);

	List<Map<String, Object>> managergo(PagingVO page);

	String getmemberTotal(HashMap<String, String> hmap);

	MemberVO managerMember(String userid);

	MemberVO selectMember(String userid);

	MemberVO selectMemberazax(HashMap<String, String> param);


}