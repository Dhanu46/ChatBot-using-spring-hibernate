package com.flight;

public class Book {

	private int id;
	private int custid;
	private int flightid;
	private String extras;
	
	public Book() {}
	
		
	public Book(int custid, int flightid, String extras) {
		super();
		this.custid = custid;
		this.flightid = flightid;
		this.extras = extras;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCustid() {
		return custid;
	}
	public void setCustid(int custid) {
		this.custid = custid;
	}
	public int getFlightid() {
		return flightid;
	}
	public void setFlightid(int flightid) {
		this.flightid = flightid;
	}

	public String getExtras() {
		return extras;
	}

	public void setExtras(String extras) {
		this.extras = extras;
	}
	
}
