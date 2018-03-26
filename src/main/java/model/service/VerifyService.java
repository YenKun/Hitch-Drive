package model.service;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;

import model.bean.Member;
import model.bean.Verification;
import model.dao.superInterface.MemberDAO;
import model.dao.superInterface.VerificationDAO;
@Transactional
@Service
public class VerifyService {
	@Autowired
	MemberDAO mdao ;
	@Autowired
	VerificationDAO vdao;
//	============連線資訊==============
	private final String host =  "smtp.gmail.com";
	private final int port = 587;
	private final String username = "iHitchTest@gmail.com";  
	private final String password = "1921682173";

	public String SendEmail(String email,Integer mid) throws NoSuchAlgorithmException {

		String memberEmail = mdao.select(mid).getEmail();
		//		=====================加密======================
		int codex = (int)(Math.random()*10000);
		String scode = Integer.toString(codex)+memberEmail; 
		String code = DigestUtils.sha1Hex(scode);
		Verification v=vdao.selectByMid(mid);
		if(v==null) {
		Verification ver = new Verification();
		ver.setMid(mid);
		ver.setCode(code);
			vdao.insert(ver);
		}else {
			v.setCode(code);
			vdao.update(v);
		}
//		=====================建立連結=====================
		StringBuffer sb= new StringBuffer();
			sb.append("Click to complete verify:");
		    sb.append("http://localhost:8080/iHitch/verify/getEmailVerify.controller?email=");  
	        sb.append(memberEmail);   
	        sb.append("&verifyCode=");   
	        sb.append(code);  
//	    =====================eamil設定檔=================
	        Properties props = new Properties();  
	        props.put("mail.smtp.host", host);  
	        props.put("mail.smtp.auth", "true");  
	        props.put("mail.smtp.starttls.enable", "true");  
	        props.put("mail.smtp.port", port);  
//		============建立傳送訊息=================	=========	       
	        Session session = Session.getInstance(props,new Authenticator(){  
	              protected PasswordAuthentication getPasswordAuthentication() {  
	                  return new PasswordAuthentication(username, password);  
	              }} );  
	        
	        Message ms = new MimeMessage(session);
	        try {
				ms.setFrom(new InternetAddress(username));
				ms.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
//				============主旨==============
				ms.setSubject("H&D Email verify");
//				============內容==============
				ms.setText(sb.toString());
				
				Transport ts = session.getTransport("smtp");
				ts.connect(host,port,username,password);
//				============傳送==============
				Transport.send(ms);
				return code;
	        }  catch (MessagingException e) {
				
				return null;
			}
	}	
	public Member CheckCode(String email , String code) {
			Member member=mdao.select(email);
			Verification v=vdao.selectByMid(member.getMid());
		if(code.equals(v.getCode())) {	
			if(member.getCurrentLv()<=1) {
				member.setEmailVerified(true);
				member.setCurrentLv(2);
				v.setEmailVerified(true);
				v.setCode(null);
				return member;
			}else {
				return member;
			}
		}else {
			return member;
		}
		
	}
	
	public Member setLicenseVerify(Integer mid) {
		Member member = mdao.select(mid);
		Verification v = vdao.selectByMid(mid);
		if(v!=null ||member!=null) {
			member.setLicenseVerified(true);
			v.setLicenseVerified(true);
			return member;
		}else {
			return member;
		}
	}
	
	public List<Verification> getAllList(){
	return vdao.select();
	}
	
	public List<Verification> getAllNotVerify(){
	return vdao.selectNotVerify();
	}
	
	public Verification getVerifyByMid(Integer mid) {
		return vdao.selectByMid(mid);
	}
	
	public String sendForgetPassword(String email) {
		
		Integer mid = mdao.select(email).getMid();
//		=====================加密======================
		int codex = (int)(Math.random()*10000);
		String scode = Integer.toString(codex)+email; 
		String code = DigestUtils.sha1Hex(scode);
//		=====================建立連結=====================
		StringBuffer sb= new StringBuffer();
			sb.append("點擊以下連結重製密碼:");
		    sb.append("http://localhost:8080/iHitch/verify/getVerify.controller?id=");  
	        sb.append(mid);   
	        sb.append("&verifyCode=");   
	        sb.append(code);  
//	    =====================eamil設定檔=================
	        Properties props = new Properties();  
	        props.put("mail.smtp.host", host);  
	        props.put("mail.smtp.auth", "true");  
	        props.put("mail.smtp.starttls.enable", "true");  
	        props.put("mail.smtp.port", port);  
//		============建立傳送訊息=================	=========	       
	        Session session = Session.getInstance(props,new Authenticator(){  
	              protected PasswordAuthentication getPasswordAuthentication() {  
	                  return new PasswordAuthentication(username, password);  
	              }} );  
	        
	        Message ms = new MimeMessage(session);
	        try {
				ms.setFrom(new InternetAddress(username));
				ms.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
//				============主旨==============
				ms.setSubject("forget password");
//				============內容==============
				ms.setText(sb.toString());
				Transport ts = session.getTransport("smtp");
				ts.connect(host,port,username,password);
//				============傳送==============
				Transport.send(ms);
				return code;
	        }  catch (MessagingException e) {
				
				return null;
			}
		
		
	}
}
