package model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Alert", schema = "dbo", catalog = "iHitch")
public class Alert {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "alertId", unique = true, nullable = false)
	private Integer alertId;

	@Column(name = "mid", unique = true, nullable = false)
	private Integer mid;

	@Column(name = "start", nullable = false)
	private String start;

	@Column(name = "dest", nullable = false)
	private String dest;

	@Column(name = "alertDate", nullable = false)
	private java.util.Date alertDate;

	@Column(name = "alerted")
	private Boolean alerted;

	@Override
	public String toString() {
		return "Alert [alertId=" + alertId + ", mid=" + mid + ", start=" + start + ", dest=" + dest + ", alertDate="
				+ alertDate + ", alerted=" + alerted + "]";
	}

	public Integer getAlertId() {
		return alertId;
	}

	public void setAlertId(Integer alertId) {
		this.alertId = alertId;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
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

	public java.util.Date getAlertDate() {
		return alertDate;
	}

	public void setAlertDate(java.util.Date alertDate) {
		this.alertDate = alertDate;
	}

	public Boolean getAlerted() {
		return alerted;
	}

	public void setAlerted(Boolean alerted) {
		this.alerted = alerted;
	}
	
}
