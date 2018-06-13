package com.tong.lesson.suda.service;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import com.tong.lesson.suda.vo.Suda;
import com.tong.lesson.suda.vo.SudaComment;
public interface SudaService {	
	List<Map<String, Object>> selectBoardList_st(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectBoardList_tea(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectBoardList_all(Map<String, Object> map) throws Exception;
	Suda selectBoardDetail(int tno) throws Exception;
	List<Map<String, Object>> searchtitle(Map<String, Object> map);
	void update(HttpServletRequest request);
	void delete(int table_no);
	List<Map<String,Object>> comment(int tno);
	void deletecomment(HttpServletRequest request);
	List nolist(int table_sort);
	int comment_count(int table_no);
	List nolist(int table_sort, String keyword);
	void insert(HttpServletRequest request);
	void entercomment(HttpServletRequest request);
}
