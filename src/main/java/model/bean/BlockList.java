package model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "BlockList", schema = "dbo", catalog = "iHitch")
public class BlockList {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "blockId", unique = true, nullable = false)
	private Integer blockId;

	@Column(name = "fromMid", nullable = false)
	private Integer fromMid;

	@Column(name = "toMid", nullable = false)
	private Integer toMid;

	@Override
	public String toString() {
		return "BlockList [blockId=" + blockId + ", fromMid=" + fromMid + ", toMid=" + toMid + "]";
	}
	
	public Integer getBlockId() {
		return blockId;
	}

	public void setBlockId(Integer blockId) {
		this.blockId = blockId;
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
	
	
}
