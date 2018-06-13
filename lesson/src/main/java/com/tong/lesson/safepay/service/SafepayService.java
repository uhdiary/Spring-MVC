package com.tong.lesson.safepay.service;

import java.util.List;
import java.util.Map;

import com.tong.lesson.safepay.vo.PagingVO;
import com.tong.lesson.safepay.vo.SafepayRefundVO;
import com.tong.lesson.safepay.vo.SafepayVO;

public interface SafepayService {
	List<Map<String, Object>> selectMySafepay(PagingVO pagevobysww) throws Exception;
	
	String getMySafepayTotal(String SPASKUSERID, String KIND) throws Exception;

	String getMySafepayTotal(PagingVO pagevobysww) throws Exception;

	List<Map<String, Object>> selectSafepay(PagingVO pagevobysww) throws Exception;
	
	List<Map<String, Object>> selectSafepayforthetap(PagingVO pagevobysww) throws Exception;

	int insertSafepay(SafepayVO vo);

	Map<String, Object> getSelectedSafepay(String sPASKNO);

	int updateSafepaystatus(Map<String, Object> map);

	int refundinsert(SafepayRefundVO vo);

	int updateHavingynrefund(Map<String, Object> map);

	Map<String, Object> getSelectedRefund(String askno);

	int refunddelete(String parameter);

	int approvestatuschange(Map<String, Object> map);

	String getteachercheck(Map<String, Object> map);

	String getManagerSafepayTabTotal(PagingVO pagevobysww);

	void setafterdeposit(String refundnoarray, String afterresultynarray, String afterprocesskindarray);

	void setafterdepositsafepay(String safepaynoarray, String afterresultynarray, String afterprocesskindarray);

}
