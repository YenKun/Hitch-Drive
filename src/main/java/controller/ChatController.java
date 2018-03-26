package controller;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import model.bean.BlockList;
import model.bean.Chat;
import model.bean.Member;
import model.service.ChatServiceTest;

@RestController
@RequestMapping("/Chats")
public class ChatController {

	@Autowired
	private ChatServiceTest chatService;

	@RequestMapping(path = { "Contacts" }, method = RequestMethod.GET, produces = { "application/json" })
	public HashMap<String, List> getChatContacts(HttpSession session) {
		Member user = (Member) session.getAttribute("memberInfo");
		if (user != null) {
			HashMap<String, List> response = new HashMap<>();
			HashMap<String, List> chatContacts = chatService.getChatContacts(user.getMid());
			
			List<Chat> chats = chatContacts.get("Chats");
			List<Member> members = chatContacts.get("Members");
			List<BlockList> blockLists = chatContacts.get("BlockLists");

			ArrayList<HashMap> contactsInfos = new ArrayList<HashMap>();

			for (Chat chat : chats) {
				chat.setPhoto(null);
			}
			for (Member member : members) {
				HashMap<String, String> contactsInfo = new HashMap<>();
				contactsInfo.put("Mid", member.getMid().toString());
				contactsInfo.put("firstName", member.getFirstName());
				contactsInfo.put("lastName", member.getLastName());
				for (BlockList blockList : blockLists) {
					if (blockList.getToMid().equals(member.getMid())) {
						contactsInfo.put("isBlocked", "true");
						blockLists.remove(blockList);
						break;
					}
				}
				contactsInfos.add(contactsInfo);
			}
			response.put("Messages", chats);
			response.put("ContactInfos", contactsInfos);
			return response;
		}
		return null;
	}

	// 取得與某對象的所有Chat歷史紀錄
	@RequestMapping(path = { "/History" }, method = RequestMethod.GET, produces = { "application/json" })
	public List<Chat> getChatHistory(Chat bean, HttpSession session) {

		if (bean != null) {
			if (bean.getToMid() != null) {
				// Session
				Member user = (Member) session.getAttribute("memberInfo");
				bean.setFromMid(user.getMid());
				//
				List<Chat> chats = chatService.getChatHistory(bean.getFromMid(), bean.getToMid());
				// 取消圖片發送，一律改用getChatPhoto取得
				List<Chat> msg = new ArrayList<>();;
				for (Chat chat : chats) {
					if (chat.getIsRead() == false && chat.getFromMid() != user.getMid()) {
						chat.setIsRead(true);
						chatService.updateIsRead(chat);
					}
					chat.setPhoto(null);
					msg.add(chat);
				}
				return msg;
			}
		}
		return null;
	}

	@RequestMapping(path = { "/NewMsg" }, method = RequestMethod.GET, produces = { "application/json" })
	public List<Chat> getChatNewMsg(Chat bean, HttpSession session) {
		if (bean != null) {
			if (bean.getToMid() != null) {
				// Session
				Member user = (Member) session.getAttribute("memberInfo");
				if (user != null) {
					bean.setFromMid(user.getMid());
					//
					List<Chat> chats = chatService.getChatNewMsg(bean.getFromMid(), bean.getToMid());
					List<Chat> newMsg = new ArrayList<>();
					// 取消圖片發送，一律改用getChatPhoto取得
					for (Chat chat : chats) {
						if (chat.getIsRead() == false && chat.getFromMid() != user.getMid()) {
							chat.setIsRead(true);
							chatService.updateIsRead(chat);
							chat.setPhoto(null);
							newMsg.add(chat);
						}
					}
					return newMsg;
				}
			}
		}
		return null;
	}

	// 傳送Chat文字內容
	@RequestMapping(path = { "/Texts" }, method = RequestMethod.POST, consumes = { "application/json" })
	public HashMap<String, String> sendChatText(@RequestBody Chat bean, HttpSession session) {
		HashMap<String, String> msg = new HashMap<>();
		if (bean != null) {
			if (bean.getContent() != null && bean.getContent().trim().length() != 0) {
				// Session
				Member user = (Member) session.getAttribute("memberInfo");
				bean.setFromMid(user.getMid());
				//
				// 安全上其實需檢察對象ToMid是否存在 && ToMid是否有封鎖User
				if (chatService.saveChat(bean)) {
					msg.put("msg", "Send Successed");
					return msg;
				}
			}
		}
		msg.put("msg", "Send Failed");
		return msg;
	}

	// 傳送Chat貼圖
	@RequestMapping(path = { "/Photos" }, method = RequestMethod.POST)
	public HashMap<String, String> sendChatPhoto(@RequestBody MultipartFile file, @RequestParam("toMid") Integer toMid,
			HttpSession session) {
		HashMap<String, String> msg = new HashMap<>();
		// Session
		Member user = (Member) session.getAttribute("memberInfo");
		//
		if (toMid == null || toMid % 2 != 0) {
			msg.put("msg", "Send Failed");
			return msg;
		}
		try {
			Blob photo = new SerialBlob(file.getBytes());
			Chat bean = new Chat();
			bean.setFromMid(user.getMid());
			bean.setToMid(toMid);
			bean.setPhoto(photo);
			chatService.saveChat(bean);
			msg.put("msg", "Send Successed");
			return msg;
		} catch (Exception e) {
			e.printStackTrace();
		}
		msg.put("msg", "Send Failed");
		return msg;
	}

	// 取得對話內容Photo(img Tag用)
	@RequestMapping(path = { "/Photos" }, method = RequestMethod.GET, produces = { "image/*" })
	@ResponseBody
	public byte[] getChatPhoto(@RequestParam("chatId") Integer chatId, HttpSession session) {
		if (chatId != null) {
			Chat bean = chatService.getChatPhoto(chatId);
			// 安全上需檢查 該User是否 可以存取該則訊息
			// Session
			Member user = (Member) session.getAttribute("memberInfo");
			if (bean != null && (bean.getFromMid().equals(user.getMid()) || bean.getToMid().equals(user.getMid()))) {
				//
				Blob photo = bean.getPhoto();
				if (photo != null) {
					try {
						return IOUtils.toByteArray(photo.getBinaryStream());
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		return null;
	}

	// 封鎖Chat對象
	@RequestMapping(path = { "Block" }, method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public HashMap<String, String> blockMember(@RequestBody BlockList bean, HttpSession session) {
		HashMap<String, String> result = new HashMap<>();
		if (bean != null) {
			// Session
			Member user = (Member) session.getAttribute("memberInfo");
			bean.setFromMid(user.getMid());
			//
			if (chatService.blockMember(bean)) {
				result.put("msg", "Block Success");
				return result;
			}
		}
		result.put("msg", "Block Fail");
		return result;
	}

	// 解鎖Chat對象
	@RequestMapping(path = { "UnBlock" }, method = RequestMethod.DELETE, produces = "application/json")
	public HashMap<String, String> unBlockMember(@RequestBody BlockList bean, HttpSession session) {
		HashMap<String, String> result = new HashMap<>();
		if (bean != null) {
			// Session
			Member user = (Member) session.getAttribute("memberInfo");
			bean.setFromMid(user.getMid());
			//
			if (chatService.unBlockMember(bean)) {
				result.put("msg", "UnBlock Success");
				return result;
			}
		}
		result.put("msg", "UnBlock Fail");
		return result;
	}

}
