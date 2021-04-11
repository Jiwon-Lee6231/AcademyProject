package tuition;

import java.sql.Date;

public class TuitionVO {
	private int id, amount, no;
	private String depositor, memo, status, name;
	private Date yearmonth, depositdate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDepositor() {
		return depositor;
	}
	public void setDepositor(String depositor) {
		this.depositor = depositor;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getYearmonth() {
		return yearmonth;
	}
	public void setYearmonth(Date yearmonth) {
		this.yearmonth = yearmonth;
	}
	public Date getDepositdate() {
		return depositdate;
	}
	public void setDepositdate(Date depositdate) {
		this.depositdate = depositdate;
	}
	
	
}
