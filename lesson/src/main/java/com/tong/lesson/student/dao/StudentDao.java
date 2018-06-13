package com.tong.lesson.student.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.net.SyslogAppender;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tong.lesson.member.vo.MemberVO;
import com.tong.lesson.student.vo.StudentVO;

@Repository("sutdnetdao")
public class StudentDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String, Object>> studentList(HashMap<String, Object> map) {
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> list = (List<Map<String, Object>>) sqlSession.selectList("studentList", map);
		//System.out.println(list);	
		return list;
	}

	public int listCount() {
		int listCount = (Integer) sqlSession.selectOne("listCount");
		//System.out.println("총갯수 : "+listCount);
		return listCount;
	}

	public StudentVO studentDetail(int sbno) {	
		StudentVO studentDetail = (StudentVO) sqlSession.selectOne("studentDetail", sbno);
		return studentDetail;
	}

	public MemberVO studentInfo(String userid) {
		MemberVO studentInfo = (MemberVO) sqlSession.selectOne("studentInfo", userid);
		return studentInfo;
	}

	public int studentInsert(StudentVO vo) {
		return sqlSession.insert("studentInsert", vo);
	}

	
	public int studentDelete(int sbno) {
		return sqlSession.delete("studentDelete", sbno);
	}
	
	public int studentDeleteUserid(String userid) {
		return sqlSession.delete("studentDelelteUserid", userid);
	}

	public int studentUpdate(StudentVO vo) {
		return sqlSession.update("studentUpdate", vo);

	}

	public List<Map<String, Object>> studentSearchList(HashMap<String, Object> map) {
		
		List<Map<String, Object>> list = (List<Map<String, Object>>) sqlSession.selectList("studentSearch", map);
		//System.out.println(list);
		return list;
	}

	public List<Map<String, Object>> studentSimpleSearch(HashMap<String, Object> map) {
		List<Map<String, Object>> list = (List<Map<String, Object>>) sqlSession.selectList("studentSimpleSearch", map);
		//System.out.println(list);
		return list;
	}

	public List<Map<String, Object>> studentDetailSearchList(HashMap<String, Object> map) {
		List<Map<String, Object>> list = (List<Map<String, Object>>) sqlSession.selectList("studentDetailSearch", map);
		//System.out.println(list);
		return list;
	}

	public int listSimpleCount(StudentVO vo) {
		int listCount = (Integer) sqlSession.selectOne("studentListSimpleCount");
		//System.out.println("총갯수 : "+listCount);
		return listCount;
	}

	public int listDetailCount(StudentVO vo) {
		int listCount = (Integer) sqlSession.selectOne("studentListDetailCount");
		//System.out.println("총갯수 : "+listCount);
		return listCount;
	}

	public StudentVO studentOne(String userid) {
		StudentVO sOne = (StudentVO) sqlSession.selectOne("studentSelect", userid);
		//System.out.println(sOne);
		return sOne;
	}

	

}
