package model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "BlackList", schema = "dbo", catalog = "iHitch")
public class BlackList {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "blackId", unique = true, nullable = false)
	private Integer blackId;

	@Column(name = "fromMid", nullable = false)
	private Integer fromMid;

	@Column(name = "toMid", nullable = false)
	private Integer toMid;

	@Column(name = "rideId", nullable = false)
	private Integer rideId;

	@Column(name = "reportType", nullable = false)
	private Integer reportType;

	@Column(name = "content", columnDefinition = "VARCHAR(MAX)")
	private String content;

	@Column(name = "isDealed")
	private Boolean isDealed;

	@Override
	public String toString() {
		return "BlackList [blackId=" + blackId + ", fromMid=" + fromMid + ", toMid=" + toMid + ", rideId=" + rideId
				+ ", reportType=" + reportType + ", content=" + content + ", isDealed=" + isDealed + "]";
	}

	public Integer getBlackId() {
		return blackId;
	}

	public void setBlackId(Integer blackId) {
		this.blackId = blackId;
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

	public Integer getRideId() {
		return rideId;
	}

	public void setRideId(Integer rideId) {
		this.rideId = rideId;
	}

	public Integer getReportType() {
		return reportType;
	}

	public void setReportType(Integer reportType) {
		this.reportType = reportType;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Boolean getIsDealed() {
		return isDealed;
	}

	public void setIsDealed(Boolean isDealed) {
		this.isDealed = isDealed;
	}

}
