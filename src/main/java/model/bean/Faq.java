package model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Faq", schema = "dbo", catalog = "iHitch")
public class Faq {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "qid", unique = true, nullable = false)
	private Integer qid;

	@Column(name = "rideId", nullable = false)
	private Integer rideId;

	@Column(name = "fromMid", nullable = false)
	private Integer fromMid;

	@Column(name = "qtype", nullable = false)
	private Integer qtype;

	@Column(name = "content", columnDefinition = "VARCHAR(MAX)")
	private String content;

	@Column(name = "response",columnDefinition="VARCHAR(MAX)")
	private String response;
	
	@Column(name="isResponsed")
	private Boolean isResponsed;

	@Override
	public String toString() {
		return "Faq [qid=" + qid + ", rideId=" + rideId + ", fromMid=" + fromMid + ", qtype=" + qtype + ", content="
				+ content + ", response=" + response + ", isResponsed=" + isResponsed + "]";
	}

	public Integer getQid() {
		return qid;
	}

	public void setQid(Integer qid) {
		this.qid = qid;
	}

	public Integer getRideId() {
		return rideId;
	}

	public void setRideId(Integer rideId) {
		this.rideId = rideId;
	}

	public Integer getFromMid() {
		return fromMid;
	}

	public void setFromMid(Integer fromMid) {
		this.fromMid = fromMid;
	}

	public Integer getQtype() {
		return qtype;
	}

	public void setQtype(Integer qtype) {
		this.qtype = qtype;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		this.response = response;
	}

	public Boolean getIsResponsed() {
		return isResponsed;
	}

	public void setIsResponsed(Boolean isResponsed) {
		this.isResponsed = isResponsed;
	}
	
	
}
