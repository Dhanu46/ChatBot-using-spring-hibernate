package com.flight;

public class Customer {
	
	private int id;
	private String name;
	private String sex;
	private int age;
	private long mobnum;
	private String uname;
	private String pwd;
	private String city;
	
	public Customer() {}
	
	
	public Customer(String name, String sex, int age, long mobnum, String city,String uname, String pwd) {
		super();
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.mobnum = mobnum;
		this.uname = uname;
		this.pwd = pwd;
		this.city = city;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public long getMobnum() {
		return mobnum;
	}
	public void setMobnum(long mobnum) {
		this.mobnum = mobnum;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	


}
