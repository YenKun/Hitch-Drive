package model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Ride", schema = "dbo", catalog = "iHitch")
public class Ride {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "rideId", unique = true, nullable = false)
	private Integer rideId;

	@Column(name = "rideDate", nullable = false)
	private java.util.Date rideDate;

	@Column(name = "rideTime", nullable = false)
	private java.sql.Time rideTime;

	@Column(name = "start", nullable = false, length = 20)
	private String start;

	@Column(name = "dest", nullable = false, length = 20)
	private String dest;

	@Column(name = "pickUpZone", nullable = false, length = 20)
	private String pickUpZone;

	@Column(name = "dropOffZone", nullable = false, length = 20)
	private String dropOffZone;

	@Column(name = "duration", nullable = false)
	private java.sql.Time duration;

	@Column(name = "price", nullable = false)
	private Integer price;

	@Column(name = "capacity", nullable = false)
	private Integer capacity;

	@Column(name = "driverId", nullable = false)
	private Integer driverId;

	@Column(name = "carId", nullable = false)
	private Integer carId;

	@Column(name = "note", columnDefinition = "VARCHAR(MAX)")
	private String note;

	@Column(name = "history")
	private Boolean history;

	@Column(name = "lugPref")
	private Integer lugPref;

	@Override
	public String toString() {
		return "Ride [rideId=" + rideId + ", rideDate=" + rideDate + ", rideTime=" + rideTime + ", start=" + start
				+ ", dest=" + dest + ", pickUpZone=" + pickUpZone + ", dropOffZone=" + dropOffZone + ", duration="
				+ duration + ", price=" + price + ", capacity=" + capacity + ", driverId=" + driverId + ", carId="
				+ carId + ", note=" + note + ", history=" + history + ", lugPref=" + lugPref + "]";
	}

	public Integer getRideId() {
		return rideId;
	}

	public void setRideId(Integer rideId) {
		this.rideId = rideId;
	}

	public java.util.Date getRideDate() {
		return rideDate;
	}

	public void setRideDate(java.util.Date rideDate) {
		this.rideDate = rideDate;
	}

	public java.sql.Time getRideTime() {
		return rideTime;
	}

	public void setRideTime(java.sql.Time rideTime) {
		this.rideTime = rideTime;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getDest() {
		return dest;
	}

	public void setDest(String dest) {
		this.dest = dest;
	}

	public String getPickUpZone() {
		return pickUpZone;
	}

	public void setPickUpZone(String pickUpZone) {
		this.pickUpZone = pickUpZone;
	}

	public String getDropOffZone() {
		return dropOffZone;
	}

	public void setDropOffZone(String dropOffZone) {
		this.dropOffZone = dropOffZone;
	}

	public java.sql.Time getDuration() {
		return duration;
	}

	public void setDuration(java.sql.Time duration) {
		this.duration = duration;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getCapacity() {
		return capacity;
	}

	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}

	public Integer getDriverId() {
		return driverId;
	}

	public void setDriverId(Integer driverId) {
		this.driverId = driverId;
	}

	public Integer getCarId() {
		return carId;
	}

	public void setCarId(Integer carId) {
		this.carId = carId;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Boolean getHistory() {
		return history;
	}

	public void setHistory(Boolean history) {
		this.history = history;
	}

	public Integer getLugPref() {
		return lugPref;
	}

	public void setLugPref(Integer lugPref) {
		this.lugPref = lugPref;
	}
	
	

}
