package model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Verification", schema = "dbo", catalog = "iHitch")
public class Verification {
	
	private Integer verifyId;
	private Integer mid;
	private Boolean emailVerified;
	private Boolean licenseVerified;
	private String code;
	
	@Override
	public String toString() {
		return "Verification [verifyId=" + verifyId + ", mid=" + mid + ", emailVerified=" + emailVerified
				+ ", licenseVerified=" + licenseVerified + ", code=" + code + "]";
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "verifyId", unique = true, nullable = false)
	public Integer getVerifyId() {
		return verifyId;
	}
	public void setVerifyId(Integer verifyId) {
		this.verifyId = verifyId;
	}
	@Column(name="mid",unique=true ,nullable=true)
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	@Column(name="emailVerified" ,insertable=false)
	public Boolean getEmailVerified() {
		return emailVerified;
	}
	public void setEmailVerified(Boolean emailVerified) {
		this.emailVerified = emailVerified;
	}
	@Column(name="licenseVerified")
	public Boolean getLicenseVerified() {
		return licenseVerified;
	}
	public void setLicenseVerified(Boolean licenseVerified) {
		this.licenseVerified = licenseVerified;
	}
	@Column(name="code",length=40)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

}
