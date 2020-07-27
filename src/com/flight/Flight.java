package com.flight;

import java.util.Date;

public class Flight {

		private String id;
		private String name;
		private String num;
		private String src;
		private String dest;
		private String arr;
		private String dept;
		private int seats;
		private int delay;
		private String status;
		
		
		public Flight(String name, String num, String src, String dest, String arr, String dept, int seats) {
			super();
			this.name = name;
			this.num = num;
			this.src = src;
			this.dest = dest;
			this.arr = arr;
			this.dept = dept;
			this.seats = seats;
		}
		
		
		public int getDelay() {
			return delay;
		}


		public void setDelay(int delay) {
			this.delay = delay;
		}


		public Flight() {
			// TODO Auto-generated constructor stub
		}
		
		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String getId() {
			return id;
		}
		public void setId(String string) {
			this.id = string;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getNum() {
			return num;
		}
		public void setNum(String num) {
			this.num = num;
		}
		public String getSrc() {
			return src;
		}
		public void setSrc(String src) {
			this.src = src;
		}
		public String getDest() {
			return dest;
		}
		public void setDest(String dest) {
			this.dest = dest;
		}
		public String getArr() {
			return arr;
		}
		public void setArr(String arr) {
			this.arr = arr;
		}
		public String getDept() {
			return dept;
		}
		public void setDept(String dept) {
			this.dept = dept;
		}
		public int getSeats() {
			return seats;
		}
		public void setSeats(int seats) {
			this.seats = seats;
		}
		
		
}
