package com.tong.lesson.note.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tong.lesson.note.vo.NoteListVO;
import com.tong.lesson.note.vo.NoteVO;

@Repository("noteDAO")
public class NoteDAO {

	/* private static final String NAMESPACE = "noteMapper."; */

	@Autowired
	private SqlSessionTemplate mybatis;

	// 받은메시지 리스트
	@SuppressWarnings("unchecked")
	public List<NoteVO> receiveList(String userid) {
		return (List<NoteVO>) mybatis.selectList("Note.receivelist", userid);
	}

	// 쪽지 보내기
	public int sendNote(NoteVO vo) {
		return mybatis.insert("Note.sendnote", vo);
	}

	// 받은 쪽지함 검색
	@SuppressWarnings("unchecked")
	public List<NoteListVO> receiveSearchList(NoteListVO vo) {
		System.out.println(vo);
		List<NoteListVO> list = null;
		vo.setSearch("%" + vo.getSearch() + "%");
		if (vo.getSelect().equals("id")) {
			list = (List<NoteListVO>) mybatis.selectList("Note.receivesearchid", vo);
		} else if (vo.getSelect().equals("name")) {
			list = (List<NoteListVO>) mybatis.selectList("Note.receivesearchname", vo);
		} else {
			list = (List<NoteListVO>) mybatis.selectList("Note.receivesearchcont", vo);
		}
		
		return list;
	}

	// 보낸 쪽지함 검색
	@SuppressWarnings("unchecked")
	public List<NoteListVO> sendSearchList(NoteListVO vo) {
		List<NoteListVO> list = null;
		vo.setSearch("%" + vo.getSearch() + "%");
		if (vo.getSelect().equals("id")) {
			list = (List<NoteListVO>) mybatis.selectList("Note.sendsearchid", vo);
		} else if (vo.getSelect().equals("name")) {
			list = (List<NoteListVO>) mybatis.selectList("Note.sendsearchname", vo);
		} else {
			list = (List<NoteListVO>) mybatis.selectList("Note.sendsearchcont", vo);
		}

		return list;
	}

	// 받은 메시지 카운트
	public int receivelistCount(String userid) {
		return (int) mybatis.selectOne("Note.receivelistcount", userid);
	}

	// 받은 메시지 리스트
	@SuppressWarnings("unchecked")
	public List<NoteVO> receiveList(String userid, int currentPage, int limit) {
		int startRow = (currentPage - 1) * limit   +1;
		int endRow = startRow + limit-1 ;
		
		
		//RowBounds rowbound = new RowBounds(startRow, endRow);
		HashMap<String, String> hmap = new HashMap<String,String>();
		hmap.put("userid", userid);
		hmap.put("startRow",String.valueOf(startRow));
		hmap.put("endRow", String.valueOf(endRow+1));
		return (List<NoteVO>)mybatis.selectList("Note.receivelist", hmap);
	}

	// 받은 메시지 검색 카운트
	public int receiveSearchListCount(NoteListVO vo) {
		vo.setSearch("%" + vo.getSearch() + "%");
		return (int) mybatis.selectOne("Note.receivesearchlistcount", vo);
	}

	// 보낸 메시지
	@SuppressWarnings("unchecked")
	public List<NoteListVO> sendList(String userid) {
		return (List<NoteListVO>) mybatis.selectList("Note.sendlist", userid);
	}

	// 보낸 메시지
	@SuppressWarnings("unchecked")
	public List<NoteVO> sendList(String userid, int currentPage, int limit) {
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		//RowBounds rowbound = new RowBounds(startRow, endRow);
		HashMap<String, String> hmap = new HashMap<String,String>();
		hmap.put("userid", userid);
		hmap.put("startRow",String.valueOf(startRow));
		hmap.put("endRow", String.valueOf(endRow+1));
		return (List<NoteVO>) mybatis.selectList("Note.sendlist", hmap);
	}


	// 받은메시지 검색 리스트
	@SuppressWarnings("unchecked")
	public List<NoteVO> receiveSearchList(NoteListVO vo, int currentPage, int limit) {
		List<NoteVO> receivelist = null;
		int startRow = (currentPage - 1) * limit;
		int endRow = startRow + limit - 1;

		RowBounds rowbound = new RowBounds(startRow, endRow);
		vo.setSearch("%" + vo.getSearch() + "%");
		if (vo.getSelect().equals("id")) {
			receivelist = (List<NoteVO>) mybatis.selectList("Note.receivesearchid", vo, rowbound);
		} else if (vo.getSelect().equals("name")) {
			receivelist = (List<NoteVO>) mybatis.selectList("Note.receivesearchname", vo, rowbound);
		} else {
			receivelist = (List<NoteVO>) mybatis.selectList("Note.receivesearchcont", vo, rowbound);
		}
		return receivelist;
	}

	public NoteVO noteOne(int no, String receiveid) {
		// 리시브쪽 디테일 일경우 읽음 y 표시
		if (receiveid != null) {
			int result = (int) mybatis.update("Note.noteread", no);
		}
		return (NoteVO) mybatis.selectOne("Note.noteone", no);
	}

	// 받은 메시지 삭제
	public int receiveDel(int[] check_no) {
		int result = 0;
		for (int i = 0; i < check_no.length; i++) {
			result += (int) mybatis.update("Note.receivedel", check_no[i]);
		}
		return result;
	}

	// 보낸 메시지 삭제
	public int sendDel(int[] check_no) {
		int result = 0;
		for (int i = 0; i < check_no.length; i++) {
			result += (int) mybatis.update("Note.senddel", check_no[i]);
		}
		return result;
	}

	// 보낸 리스트 카운트
	public int sendListCount(String userid) {
		return (int) mybatis.selectOne("Note.sendlistcount", userid);
	}

	// 보낸 리스트 검색 카운트
	public int sendSearchListCount(NoteListVO vo) {
		vo.setSearch("%" + vo.getSearch() + "%");
		return (int) mybatis.selectOne("Note.sendsearchlistcount", vo);
	}
}