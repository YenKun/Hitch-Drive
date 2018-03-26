package model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Rate", schema = "dbo", catalog = "iHitch")
public class Rate {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "rateID", unique = true, nullable = false)
	private Integer rateId;

	@Column(name = "fromMid", nullable = false)
	private Integer fromMid;

	@Column(name = "toMid", nullable = false)
	private Integer toMid;

	@Column(name = "star", nullable = false)
	private Integer star;

	@Column(name = "comment", columnDefinition = "VARCHAR(MAX)")
	private String comment;

	@Column(name = "rateDate", insertable = false)
	private java.util.Date rateDate;

	@Column(name = "rated", insertable = false)
	private Boolean rated;

	@Column(name = "rideId", nullable = false)
	private Integer rideId;

	@Override
	public String toString() {
		return "Rate [rateId=" + rateId + ", fromMid=" + fromMid + ", toMid=" + toMid + ", star=" + star + ", comment="
				+ comment + ", rateDate=" + rateDate + ", rated=" + rated + ", rideId=" + rideId + "]";
	}

	public Integer getRateId() {
		return rateId;
	}

	public void setRateId(Integer rateId) {
		this.rateId = rateId;
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

	public Integer getStar() {
		return star;
	}

	public void setStar(Integer star) {
		this.star = star;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public java.util.Date getRateDate() {
		return rateDate;
	}

	public void setRateDate(java.util.Date rateDate) {
		this.rateDate = rateDate;
	}

	public Boolean getRated() {
		return rated;
	}

	public void setRated(Boolean rated) {
		this.rated = rated;
	}

	public Integer getRideId() {
		return rideId;
	}

	public void setRideId(Integer rideId) {
		this.rideId = rideId;
	}

}
