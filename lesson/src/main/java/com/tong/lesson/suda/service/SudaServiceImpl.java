package com.tong.lesson.suda.service;

import java.util.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import com.tong.lesson.suda.dao.SudaDAO;
import com.tong.lesson.suda.vo.Suda;
import com.tong.lesson.suda.vo.SudaComment;
@Service("sudaService")
public class SudaServiceImpl implements SudaService{
	
	@Resource(name="sudaDAO")
	private SudaDAO sudaDAO;
	@Override
	public Suda selectBoardDetail(int tno)
			throws Exception {
		Suda suda = sudaDAO.selectBoardDetail(tno);
		return suda;
	}
	@Override
	public List<Map<String, Object>> selectBoardList_st(Map<String, Object> map) throws Exception {
		return sudaDAO.selectBoardList_st(map);
	}
	@Override
	public List<Map<String, Object>> selectBoardList_all(Map<String, Object> map) throws Exception {
		return sudaDAO.selectBoardList_all(map);
	}
	@Override
	public List<Map<String, Object>> selectBoardList_tea(Map<String, Object> map) throws Exception {
		return sudaDAO.selectBoardList_tea(map);
	}
	@Override
	public List<Map<String, Object>> searchtitle(Map<String, Object> map) {
		return sudaDAO.searchtitle(map);
	}
	@Override
	public void update(HttpServletRequest request) {
		sudaDAO.update(request);
	}
	@Override
	public void delete(int table_no) {
		sudaDAO.delete(table_no);
	}
	@Override
	public List<Map<String,Object>> comment(int tno) {
		return sudaDAO.comment(tno);
	}
	@Override
	public void deletecomment(HttpServletRequest request) {
		sudaDAO.deletecomment(request);
	}
	@Override
	public List nolist(int table_sort) {
		return sudaDAO.nolist(table_sort);
	}
	@Override
	public int comment_count(int table_no) {
		return sudaDAO.comment_count(table_no);
	}
	@Override
	public List nolist(int table_sort, String keyword) {
		return sudaDAO.comment_count(table_sort, keyword);
	}
	@Override
	public void insert(HttpServletRequest request) {
		sudaDAO.insertsuda(request);
	}
	@Override
	public void entercomment(HttpServletRequest request) {
		sudaDAO.entercomment(request);
	}
}
