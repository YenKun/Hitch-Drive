package model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PassDetail", schema = "dbo", catalog = "iHitch")
public class PassDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "detailId", unique = true, nullable = false)
	private Integer detailId;

	@Column(name = "mid", nullable = false)
	private Integer mid;

	@Column(name = "rideId", nullable = false)
	private Integer rideId;

	@Column(name = "seatsBooked", nullable = false)
	private Integer seatsBooked;

	@Column(name = "bookTime")
	private java.util.Date bookTime;

	@Column(name = "confirmed")
	private Boolean confirmed;

	@Override
	public String toString() {
		return "PassDetail [detailId=" + detailId + ", mid=" + mid + ", rideId=" + rideId + ", seatsBooked="
				+ seatsBooked + ", bookTime=" + bookTime + ", confirmed=" + confirmed + "]";
	}

	public Integer getDetailId() {
		return detailId;
	}

	public void setDetailId(Integer detailId) {
		this.detailId = detailId;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public Integer getRideId() {
		return rideId;
	}

	public void setRideId(Integer rideId) {
		this.rideId = rideId;
	}

	public Integer getSeatsBooked() {
		return seatsBooked;
	}

	public void setSeatsBooked(Integer seatsBooked) {
		this.seatsBooked = seatsBooked;
	}

	public java.util.Date getBookTime() {
		return bookTime;
	}

	public void setBookTime(java.util.Date bookTime) {
		this.bookTime = bookTime;
	}

	public Boolean getConfirmed() {
		return confirmed;
	}

	public void setConfirmed(Boolean confirmed) {
		this.confirmed = confirmed;
	}

}
