package com.tong.lesson.suda.dao;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tong.lesson.suda.vo.Suda;
import com.tong.lesson.suda.vo.SudaComment;

@Repository("sudaDAO")
public class SudaDAO {
	public SudaDAO(){}
	@Autowired
	private SqlSessionTemplate sqlSession;
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList_tea(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("suda.tealist", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList_st(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("suda.stlist", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList_all(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("suda.alllist", map);
	}
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params){
		return sqlSession.selectList(queryId,params);
	}
	public Suda selectBoardDetail(int tno) {
		sqlSession.update("suda.updatecnt", tno);
		return (Suda) sqlSession.selectOne("suda.selectBoardDetail", tno);
	}
	public void insertBoard(Map<String, Object> map) {
		sqlSession.insert("suda.insertBoard", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchtitle(Map<String, Object> map) {
		return (List<Map<String, Object>>)sqlSession
				.selectList("suda.searchtitle", map);
	}
	public void update(HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("title", request.getParameter("title"));
		map.put("story", request.getParameter("story"));
		map.put("table_no", Integer.parseInt(request.getParameter("table_no")));
		sqlSession.update("suda.update", map);
	}
	public void delete(int table_no) {
		sqlSession.delete("suda.delete", table_no);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> comment(int tno) {
		return (List<Map<String,Object>>)sqlSession.selectList("suda.comment", tno);
	}
	public void deletecomment(HttpServletRequest request) {
		int comment_no = Integer.parseInt(request.getParameter("comment_no"));
		sqlSession.delete("suda.deletecomment", comment_no);
	}
	@SuppressWarnings("rawtypes")
	public List nolist(int table_sort) {
		return sqlSession.selectList("suda.nolist", table_sort);
	}
	public int comment_count(int table_no) {
		return (Integer)sqlSession.selectOne("suda.comment_count", table_no);
	}
	public List comment_count(int table_sort, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("table_sort", table_sort);
		map.put("keyword", keyword);
		return sqlSession.selectList("suda.nolistsearch", map);
	}
	public void insertsuda(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		int table_sort = Integer.parseInt(request.getParameter("table_sort"));
		String userid = request.getParameter("userid");
		String title = request.getParameter("title");
		String story = request.getParameter("story");
		map.put("table_sort", table_sort);
		map.put("title", title);
		map.put("story", story);
		map.put("userid", userid);
		sqlSession.insert("suda.insertBoard", map);
	}
	public void entercomment(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		int table_no = Integer.parseInt(request.getParameter("table_no"));
		String userid = request.getParameter("userid");
		String comment = request.getParameter("comment");
		map.put("table_no", table_no);
		map.put("comment", comment);
		map.put("userid", userid);
		sqlSession.insert("suda.entercomment", map);
	}
}
