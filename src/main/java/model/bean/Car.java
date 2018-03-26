package model.bean;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "Car", schema = "dbo", catalog = "iHitch", uniqueConstraints = @UniqueConstraint(columnNames = "carNo"))
public class Car {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "carId", unique = true, nullable = false)
	private Integer carId;

	@Column(name = "carNo", unique = true, nullable = false, length = 20)
	private String carNo;

	@Column(name = "carBrand", length = 50)
	private String carBrand;

	@Column(name = "carType", length = 100)
	private String carType;

	@Column(name = "color", length = 20)
	private String color;

	@Column(name = "carDocPhoto")
	private Blob carDocPhoto;

	@Column(name="carDocVerified")
	private Boolean carDocVerified;
	
	@Column(name = "pcFriendly")
	private Boolean pcFriendly;

	@Column(name = "mid", unique = true, nullable = false)
	private Integer mid;	
	



	@Override
	public String toString() {
		return "Car [carId=" + carId + ", carNo=" + carNo + ", carBrand=" + carBrand + ", carType=" + carType
				+ ", color=" + color + ", carDocPhoto=" + carDocPhoto +", carDocVerified="+carDocVerified+ ", pcFriendly=" + pcFriendly + ", mid=" + mid
				+ "]";
	}

	public Integer getCarId() {
		return carId;
	}

	public void setCarId(Integer carId) {
		this.carId = carId;
	}

	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}

	public String getCarBrand() {
		return carBrand;
	}

	public void setCarBrand(String carBrand) {
		this.carBrand = carBrand;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Blob getCarDocPhoto() {
		return carDocPhoto;
	}

	public void setCarDocPhoto(Blob carDocPhoto) {
		this.carDocPhoto = carDocPhoto;
	}
	
	public Boolean getCarDocVerified() {
		return carDocVerified;
	}

	public void setCarDocVerified(Boolean carDocVerified) {
		this.carDocVerified = carDocVerified;
	}
	
	
	public Boolean getPcFriendly() {
		return pcFriendly;
	}

	public void setPcFriendly(Boolean pcFriendly) {
		this.pcFriendly = pcFriendly;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}
	
	

}
