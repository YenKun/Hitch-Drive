package model.bean;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Chat", schema = "dbo", catalog = "iHitch")
public class Chat {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "chatId", unique = true, nullable = false)
	private Integer chatId;

	@Column(name = "fromMid", nullable = false)
	private Integer fromMid;

	@Column(name = "toMid", nullable = false)
	private Integer toMid;

	@Column(name = "chatDateTime", nullable = false, insertable = false)
	private java.util.Date chatDateTime;

	@Column(name = "content", columnDefinition = "VARCHAR(MAX)")
	private String content;

	@Column(name = "photo")
	private Blob photo;

	@Column(name = "isRead", insertable = false)
	private Boolean isRead;

	@Override
	public String toString() {
		return "Chat [chatId=" + chatId + ", fromMid=" + fromMid + ", toMid=" + toMid + ", chatDateTime=" + chatDateTime
				+ ", content=" + content + ", photo=" + photo + ", isRead=" + isRead + "]";
	}

	public Integer getChatId() {
		return chatId;
	}

	public void setChatId(Integer chatId) {
		this.chatId = chatId;
	}

	public Integer getFromMid() {
		return fromMid;
	}

	public void setFromMid(Integer fromMid) {
		this.fromMid = fromMid;
	}

	public Integer getToMid() {
		return toMid;
	}

	public void setToMid(Integer toMid) {
		this.toMid = toMid;
	}

	public java.util.Date getChatDateTime() {
		return chatDateTime;
	}

	public void setChatDateTime(java.util.Date chatDateTime) {
		this.chatDateTime = chatDateTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

	public Boolean getIsRead() {
		return isRead;
	}

	public void setIsRead(Boolean isRead) {
		this.isRead = isRead;
	}
}
