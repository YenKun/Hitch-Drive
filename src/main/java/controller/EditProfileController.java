package controller;

import java.io.InputStream;
import java.sql.Blob;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import model.bean.Member;
import model.service.MemberService;

@Controller
@RequestMapping(path={"/edit"})
public class EditProfileController {
@Autowired
private MemberService ms;

@ResponseBody
@RequestMapping(path= {"/changePswd.controller"},method={RequestMethod.PUT},produces= {"application/json"})
public Map<String, String> changePswd(@RequestBody HashMap<String, String> map1,HttpSession session) {
	Member memberInfo = (Member) session.getAttribute("memberInfo");
	String oldPswd  =  map1.get("oldPswd");
	String newPswd1 =  map1.get("newPswd1");
	String newPswd2 =  map1.get("newPswd2");
	Map<String, String>map  = new HashMap<String, String>();
	if(memberInfo !=null) {
		 if( (oldPswd ==null || oldPswd.trim().length()==0)
		   ||(newPswd1==null || newPswd1.trim().length()==0)
		   ||(newPswd2==null || newPswd2.trim().length()==0))
			{map.put("er001", "密碼空白");}
	else if(!oldPswd.equals(memberInfo.getPwd())) 
			{map.put("er005", "舊密碼輸入錯誤");}
	else if(!newPswd1.equals(newPswd2))
			{map.put("er002", "新密碼輸入不同");}
	else if(oldPswd.equals(newPswd1)) 
			{map.put("er003", "新密碼與舊密碼相同");}
	else if(map.isEmpty())
	{			Member member=ms.chgPswd(memberInfo, newPswd1);
				map.put("msg001", "Change Password success");
				session.setAttribute("memberInfo", member);
				return map;}
	return map;
	}else {
	return null;}

}
@ResponseBody
@RequestMapping(path={"/editProfile.controller"}, method={RequestMethod.PUT},consumes= {"application/json"},produces= {"application/json"})
public Map<String, String> editProfile(@RequestBody Member memberChg,HttpSession session) {
	Member memberInfo = (Member) session.getAttribute("memberInfo");
	Map <String,String>map = new HashMap<String,String>();
	if(memberInfo!=null) {
		if(memberChg!=null) {
			if(memberChg.getFirstName()==null ||memberChg.getFirstName().trim().length()==0) {
				map.put("er012", "FisrtName not null");
			}
			else if(memberChg.getLastName()==null || memberChg.getLastName().trim().length()==0) {
				map.put("er013", "LastName not null");
			}
			else if(memberChg.getBirthYear()==null)
			{	
				map.put("er014","birthYear not null");}
			else if(memberChg.getPhone()==null || memberChg.getPhone().trim().length()==0) {
				map.put("er015", "phone not null");
			}
			else if(memberChg.getCountry()==null || memberChg.getCountry().trim().length()==0) {
				map.put("er016", "country not null");
			}
			else if(memberChg.getGender()==null ) {
				map.put("er017","gender not null" );
			}
			else if(map.isEmpty()){
			Member member =ms.editProfile(memberInfo,memberChg);
			session.setAttribute("memberInfo", member);
			map.put("msg005", "edit success");
			return map;}
			}else {
			map.put("er010", "profile not null");
			return map;
		}
		return map;
	}else {
		return null;}

}
@ResponseBody
@RequestMapping(path={"/showProfile.controller"}, method={RequestMethod.GET},produces = { "application/json" })
public Member showProfile(HttpSession session) {
	Member memberInfo = (Member) session.getAttribute("memberInfo");
	if(memberInfo!=null) {
		Member member = new Member();
		member.setLastName(memberInfo.getLastName());
		member.setFirstName(memberInfo.getFirstName());
		member.setBirthYear(memberInfo.getBirthYear());
		member.setPhone(memberInfo.getPhone());
		member.setCountry(memberInfo.getCountry());
		member.setBio(memberInfo.getBio());
		member.setGender(memberInfo.getGender());
		return member ;
	}else {
		return null;
	}

}

@ResponseBody
@RequestMapping(path={"/getProfile.controller"}, method={RequestMethod.GET},produces = { "application/json" })
public Member showMemberProfile(Integer mid,HttpSession session) {
	Member memberInfo = (Member) session.getAttribute("memberInfo");
	Member member = ms.getMemberInfo(memberInfo.getMid());
	member.setEmail(null);
	member.setLicensePhoto(null);
	member.setPhoto(null);
	member.setCurrentLv(null);
	member.setPwd(null);
	return member;
}

@ResponseBody
@RequestMapping(path={"/getPerferences.controller"}, method={RequestMethod.GET},produces = { "application/json" })
public Member getPerferences(HttpSession session) {
	Member memberInfo = (Member) session.getAttribute("memberInfo");
	memberInfo.setEmail(null);
	memberInfo.setLicensePhoto(null);
	memberInfo.setPhoto(null);
	memberInfo.setPwd(null);
	memberInfo.setAccount(null);
	return memberInfo;
}


@ResponseBody
@RequestMapping(path= {"/showPhoto.controller"},method={RequestMethod.GET})
public byte[] showPhoto(HttpSession session)  {
	Member memberInfo = (Member) session.getAttribute("memberInfo");
	if(memberInfo!=null) {
	Blob blob =null;
	InputStream is = null;
	try {
		blob = ms.getPhoto(memberInfo.getMid());
		is = blob.getBinaryStream();
		return IOUtils.toByteArray(is);
	} catch (Exception e) {
		return null;
	}
	}
	else {
		return null;}
}
@ResponseBody
@RequestMapping(path= {"/editPref.controller"},method={RequestMethod.POST},produces= {"application/json"})
public Map<String, Object> editPref(Member member,HttpSession session) {
	Member memberInfo = (Member) session.getAttribute("memberInfo");
	Map<String, Object>map =new HashMap<String, Object>();
	if(memberInfo!=null) {
		Member member1 = ms.getMemberInfo(memberInfo.getMid());
		if(member !=null) {		
			Integer currentLv = member1.getCurrentLv();
			switch (currentLv)
			{
			case 1:
				map.put("er050", "Please complete Email verification ");
				break;
			case 3:
				if(member.getPrefDrMusic()!=null || member.getPrefDrPet()!=null||member.getPrefDrSmoke()!=null||member.getPrefDrTalk()!=null)
				{
				memberInfo =ms.editDrRefrence(memberInfo, member);
				map.put("msg003", "Dreiver refrence edit success");}
				else {
					map.put("er011", "Dreiver refrence edit fail");
				}
			case 2:
				if(member.getPrefPaMusic()!=null || member.getPrefPaPet()!=null||member.getPrefPaSmoke()!=null||member.getPrefPaTalk()!=null)
				{
					memberInfo =ms.editPaRefrence(memberInfo,member);
					map.put("msg002", "Passenger refrence edit success");
				}else{
					map.put("er012", "Passenger refrence edit fail");
				}
				break;
			}
			session.setAttribute("memberInfo", memberInfo);
			return map;}
		else {
			map.put("er006", "refrence not null");
			return map;
		}
	}else {
		return null;
	}

	
}
@ResponseBody
@RequestMapping(path= {"/editPhoto.controller"},method={RequestMethod.POST},produces = { "application/json" })
public Map<String, String> editPhoto(@RequestParam("file")MultipartFile file,HttpSession session) {
	Map<String, String> map = new HashMap<String, String>();
	Member memberInfo = (Member) session.getAttribute("memberInfo");
	if(memberInfo!=null) {
		if(!file.isEmpty()) {
			if(file.getSize()<=2097152) {
				String fileType = file.getContentType();
				String type =fileType.split("/")[1];
				if(type.equals("jpeg")||type.equals("gif")||type.equals("png")) {
					Blob blob = null;
					try {
						byte[] img = file.getBytes();
						blob = new SerialBlob(img);
						Member member =ms.editPhoto(memberInfo, blob);
						session.setAttribute("memberInfo", member);
						map.put("msg004", "uploadSucess");
					} catch (Exception e) {
						map.put("er007", "upload file fail");
					}
					
				}else {
					map.put("er008", "Type:jpeg、png、gif");
				}
			}else {
				map.put("er020"," exceeds maximum allowed upload size of 2048 KB" );
			}
			
		}else {
			map.put("er009", "file is empty");
		}
		return map;
	}else {
		return null;
	}
}
@ResponseBody
@RequestMapping(path={"/uploadlicense.controller"},method= {RequestMethod.POST},produces= {"application/json"})
public Map<String, String> updateLisencePhoto(@RequestParam("licensePhoto")MultipartFile file,HttpSession session)  {
	Map<String, String> map = new HashMap<>();
	Member memberInfo = (Member) session.getAttribute("memberInfo");
	if(memberInfo !=null) {
		if(!file.isEmpty()) {
			String fileType = file.getContentType();
			String type =fileType.split("/")[1];
			if(type.equals("jpeg")||type.equals("gif")||type.equals("png")) {
				Blob blob = null;
				try {
					byte[] img = file.getBytes();
					blob = new SerialBlob(img);
					Member member =ms.editLicense(memberInfo, blob);
					session.setAttribute("memberInfo", member);
					map.put("msg004", "uploadSucess");
				} catch (Exception e) {
					map.put("er007", "upload file fail");
				}
			}else {
				map.put("er008", "Type:jpeg、png、gif");
			}
		}else {
			map.put("er009", "file is empty");
		}
		return map;
	}else {
		return null;
	}
}
}
