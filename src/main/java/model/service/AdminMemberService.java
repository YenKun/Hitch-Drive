package model.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Member;
import model.dao.superInterface.MemberDAO;

@Service
@Transactional
public class AdminMemberService {
	
	@Autowired
	private MemberDAO memberDAO;


	@Transactional(readOnly=true)
	
	//查詢-----------------------------------------------------------
	
	
	public  List<Member> selectAll(){
			return memberDAO.select();
	}					
			
//	Member  select by mid
	public Member selectByMid(int mid){
		return memberDAO.select(mid);		
	}
	
// Member select by Email
	public Member selectByEmail(String email){
		return memberDAO.select(email);
	}
	
	
// Member select by licensed
	
	
	
	//修改(update)-------------------------------------------------------------
	

	
	public Member update(Member bean){
		Member result =memberDAO.select(bean.getMid());
		System.out.println("result:"+result);
		result.setEmail(bean.getEmail());
		result.setFirstName(bean.getFirstName());
		result.setLastName(bean.getLastName());
		result.setEmailVerified(bean.getEmailVerified());
		result.setLicenseVerified(bean.getLicenseVerified());
		result.setMalPoint(bean.getMalPoint());
		result.setRate(bean.getRate());
		result.setCurrentLv(bean.getCurrentLv());
			
	System.out.println("test:"+bean);
	
		System.out.println("已經存到資料庫裡面了");
	return result;
	}
	
	
	
	
	//刪除(delete)------------------------------------------------------------
	public boolean delete(Member bean){
		System.out.println("yoyoyoy "+ bean);
		boolean result = false;
		if(bean!=null){
			result= memberDAO.delete(bean.getMid());
		}
		return result;
	}


	
	
		
	}

