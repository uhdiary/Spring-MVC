package com.tong.lesson.safepay.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tong.lesson.safepay.dao.SafepayDAO;
import com.tong.lesson.safepay.vo.PagingVO;
import com.tong.lesson.safepay.vo.SafepayRefundVO;
import com.tong.lesson.safepay.vo.SafepayVO;

@Service("safepayService")
public class SafepayServiceImpl implements SafepayService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private SafepayDAO safepayDAO;
	
	
	@Override
	public String getMySafepayTotal(String SPASKUSERID, String KIND ) throws Exception {
		return safepayDAO.getSafepayTotal(SPASKUSERID, KIND);
	}
	
	@Override
	public String getMySafepayTotal(PagingVO pagevobysww) throws Exception {
		return safepayDAO.getSafepayTotal(pagevobysww);
	}
	
	@Override  // 일반 유저 안전결재 조회
	public List<Map<String, Object>> selectMySafepay(PagingVO pagevobysww) throws Exception {
		return safepayDAO.selectsafepayList(pagevobysww);
	}

	@Override  // 관리자용 안전결재 조회
	public List<Map<String, Object>> selectSafepay(PagingVO pagevobysww) throws Exception  {
		return safepayDAO.selectsafepayListforadmin(pagevobysww);
	}

	@Override
	public int insertSafepay(SafepayVO vo) {		
		return safepayDAO.insertSafepay(vo);
	}

	@Override
	public Map<String, Object> getSelectedSafepay(String sPASKNO) {
		return safepayDAO.getselectedSafepay(sPASKNO);
	}
	
	@Override
	public Map<String, Object> getSelectedRefund(String askno) { 
		return safepayDAO.getselectedRefund(askno);
	}

	@Override
	public int updateSafepaystatus(Map<String, Object> map) {
		return safepayDAO.changeStatusSafepay(map);
	}

	@Override
	public int refundinsert(SafepayRefundVO vo) {
		return safepayDAO.insertRefund(vo);
	}

	@Override
	public int updateHavingynrefund(Map<String, Object> map) {
		return safepayDAO.updateHavingynrefund(map);
	}

	@Override
	public int refunddelete(String refundno) {

		return safepayDAO.refunddelete(refundno);
	}

	@Override
	public int approvestatuschange(Map<String, Object> map) {
		return safepayDAO.approvestatuschange(map);
	}

	@Override
	public String getteachercheck(Map<String, Object> map) {
		return safepayDAO.getteachercheck(map);
	}

	@Override
	public String getManagerSafepayTabTotal(PagingVO pagevobysww) {
		return safepayDAO.getManagerSafepayTabTotal(pagevobysww );
	}

	@Override
	public List<Map<String, Object>> selectSafepayforthetap(PagingVO pagevobysww) throws Exception {
		return safepayDAO.getManagerSafepayTab(pagevobysww);
	}

	@Override
	public void setafterdeposit(String refundnoarray, String afterresultynarray,String afterprocesskindarray) {
		safepayDAO.setafterdeposit(refundnoarray,afterresultynarray,afterprocesskindarray);
		
	}

	@Override
	public void setafterdepositsafepay(String safepaynoarray, String afterresultynarray, String afterprocesskindarray) {
		safepayDAO.setafterdeposit2(safepaynoarray,afterresultynarray,afterprocesskindarray);	
	}

}
