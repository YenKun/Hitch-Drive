package model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.BlockList;
import model.bean.Chat;
import model.dao.superInterface.BlockListDAO;
import model.dao.superInterface.ChatDAO;
import model.dao.superInterface.MemberDAO;

@Transactional
@Service
public class ChatServiceTest {

	@Autowired
	private ChatDAO chatDAO;

	@Autowired
	private BlockListDAO blockListDAO;

	@Autowired
	private MemberDAO memberDAO;

	public HashMap<String, List> getChatContacts(Integer Mid) {
		if (Mid != null) {
			HashMap<String, List> chatContacts = new HashMap<>();
			chatContacts.put("Chats", chatDAO.selectContacts(Mid));
			chatContacts.put("Members", chatDAO.selectContactsInfo(Mid));
			chatContacts.put("BlockLists", blockListDAO.selectByFromMid(Mid));
			return chatContacts;
		}
		return null;
	}

	public List<Chat> getChatHistory(Integer fromMid, Integer toMid) {
		if (memberDAO.select(toMid) != null) {
			List<Chat> chatHistory = chatDAO.selectByFromToMid(fromMid, toMid);
			for (Chat chat : chatHistory) {
				if (chat.getToMid() == fromMid) {
					chat.setIsRead(true);
				}
			}
			return chatHistory;
		}
		return null;
	}
	
	public List<Chat> getChatNewMsg(Integer fromMid, Integer toMid) {
		if (memberDAO.select(toMid) != null) {
			return chatDAO.selectByFromToMid(fromMid, toMid);
		}
		return null;
	}

	public Boolean saveChat(Chat bean) {
		if (bean != null) {
			if (bean.getToMid() != null) {
				if (memberDAO.select(bean.getToMid()) != null) {
					if (chatDAO.insert(bean) != null) {
						return true;
					}
				}
			}
		}
		return false;
	}
	
	public Chat updateIsRead(Chat bean) {
		return chatDAO.update(bean);
	}

	public Chat getChatPhoto(Integer id) {
		return chatDAO.select(id);
	}

	public Boolean blockMember(BlockList bean) {
		if (bean != null) {
			if (!blockListDAO.isBlockExist(bean)) {
				blockListDAO.insert(bean);
				return true;
			}
		}
		return false;
	}

	public Boolean unBlockMember(BlockList bean) {
		if (bean != null) {
			if (blockListDAO.isBlockExist(bean)) {
				return blockListDAO.delete(bean);
			}
		}
		return false;
	}
}
