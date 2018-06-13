package com.tong.lesson.note.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tong.lesson.member.vo.MemberVO;
import com.tong.lesson.note.vo.NoteListVO;
import com.tong.lesson.note.vo.NoteVO;


public interface NoteService {

	int sendNote(NoteVO vo);

	List<NoteVO> receiveList(String userid, int currentPage, int limit);

	int receiveSearchListCount(NoteListVO vo);

	List<NoteVO> receiveSearchList(NoteListVO vo, int currentPage, int limit);

	int receiveListCount(String userid);

	List<NoteVO> sendList(String userid, int currentPage, int limit);

	List<NoteVO> sendSearchList(NoteListVO vo, int currentPage, int limit);

	int sendListCount(String userid);
	
	int sendSearchListCount(NoteListVO vo);

	NoteVO noteOne(int no, String receiveid);

	int noteReceiveDel(int[] check_no);

	int noteSendDel(int[] check_no);

	

	
	
}
