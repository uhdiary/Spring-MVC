package com.tong.lesson.note.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tong.lesson.member.vo.MemberVO;
import com.tong.lesson.note.dao.NoteDAO;
import com.tong.lesson.note.vo.NoteListVO;
import com.tong.lesson.note.vo.NoteVO;

@Service("NoteService")
public class NoteServiceImpl implements NoteService {

	@Resource
	private NoteDAO noteDAO;


	@Override
	public int sendNote(NoteVO vo) {
		return noteDAO.sendNote(vo);
		
	}

	@Override
	public int receiveListCount(String userid) {
		return noteDAO.receivelistCount(userid);
	}

	@Override
	public List<NoteVO> receiveList(String userid, int currentPage, int limit) {
		return noteDAO.receiveList(userid, currentPage, limit);
	}

	@Override
	public int receiveSearchListCount(NoteListVO vo) {
		return noteDAO.receiveSearchListCount(vo);
	}

	@Override
	public List<NoteVO> receiveSearchList(NoteListVO vo, int currentPage, int limit) {
		return noteDAO.receiveSearchList(vo, currentPage, limit);
	}

	@Override
	public int sendListCount(String userid) {
		return noteDAO.sendListCount(userid);
	}

	@Override
	public List<NoteVO> sendList(String userid, int currentPage, int limit) {
		return noteDAO.sendList(userid, currentPage, limit);
	}

	@Override
	public List<NoteVO> sendSearchList(NoteListVO vo, int currentPage, int limit) {
		return sendSearchList(vo, currentPage, limit);
	}

	@Override
	public NoteVO noteOne(int no, String receiveid) {
		return noteDAO.noteOne(no, receiveid);
	}

	@Override
	public int noteReceiveDel(int[] check_no) {
		return noteDAO.receiveDel(check_no);
	}

	@Override
	public int noteSendDel(int[] check_no) {
		return noteDAO.sendDel(check_no);
	}

	@Override
	public int sendSearchListCount(NoteListVO vo) {
		return noteDAO.sendSearchListCount(vo);
	}


}


