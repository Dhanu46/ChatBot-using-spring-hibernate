package com.flight;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;

import com.google.gson.Gson;

public class FlightDao {
	
	private Connection conn = null;
	private PreparedStatement ps = null; 
	private ResultSet rs = null;
	
	public int addcustomer(Customer customer) throws SQLException {
		
		String sql = "insert into Customer(NAME,AGE,SEX,MOBNUM,CITY,USERNAME,PASSWORD) values ('"+customer.getName()+"','"+customer.getAge()+"','"+customer.getSex()+"','"+customer.getMobnum()+"','"+customer.getCity()+"','"+customer.getUname()+"','"+customer.getPwd()+"')";
		int i = 0 ;
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return i;
	}
	
	public Customer verifyUser(String uname,String pwd) throws SQLException {
		System.out.println(uname+pwd);
		String sql = "Select ID,NAME from Customer where USERNAME='"+uname+"' and PASSWORD='"+pwd+"'";
		Customer cust = new Customer();
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				cust.setId(rs.getInt("ID"));
				cust.setName(rs.getString("NAME"));
				System.out.println(cust.getId()+"***"+cust.getName());
			}
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
	try {
		rs.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	DBConnector.closeStatement(ps);
	DBConnector.closeConnection(conn);
	}
		return cust;
	}

	public Customer getCustomerById(String id) {
		Customer cust = new Customer();
		String sql = "select * from Customer where ID ='"+id+"'";
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				cust.setId(rs.getInt("ID"));
				cust.setName(rs.getString("NAME"));
				cust.setMobnum(rs.getLong("MOBNUM"));
				cust.setAge(rs.getInt("AGE"));
				cust.setCity(rs.getString("CITY"));
				cust.setSex(rs.getString("SEX"));
			}
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
	try {
		rs.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	DBConnector.closeStatement(ps);
	DBConnector.closeConnection(conn);
	}
		return cust;
	}
	public int addflight(Flight fl) {
		// TODO Auto-generated method stub
		String sql = "insert into Flight(NAME,NUMBER,SOURCE,DESTINATION,ARRIVAL_DATE,DEPARTURE_DATE,SEATS,STATUS) values ('"+fl.getName()+"','"+fl.getNum()+"','"+fl.getSrc()+"','"+fl.getDest()+"','"+fl.getArr()+"','"+fl.getDept()+"','"+fl.getSeats()+"','"+"ACTIVE"+"')";
		int i = 0 ;
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return i;
	}
	
	public ArrayList<Flight> getAllFlights(){
		String sql = "select * from Flight";
		ArrayList<Flight> flist = new ArrayList<Flight>();
		try {
		conn = DBConnector.getConnection();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			Flight fl = new Flight();
			fl.setId(rs.getString("ID"));
			fl.setNum(rs.getString("NUMBER"));
			fl.setName(rs.getString("NAME"));
			fl.setSrc(rs.getString("SOURCE"));
			fl.setDest(rs.getString("DESTINATION"));
			fl.setArr(rs.getString("ARRIVAL_DATE"));
			fl.setDept(rs.getString("DEPARTURE_DATE"));
			fl.setSeats(rs.getInt("SEATS"));
			fl.setStatus(rs.getString("STATUS"));
			fl.setDelay(rs.getInt("DELAY"));
			flist.add(fl);
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return flist;
	}
	
	public Flight getFlightById(String id){
		String sql = "select * from Flight where ID ='"+id+"'";
		Flight fl = new Flight();
		try {
		conn = DBConnector.getConnection();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			fl.setId(rs.getString("ID"));
			fl.setNum(rs.getString("NUMBER"));
			fl.setName(rs.getString("NAME"));
			fl.setSrc(rs.getString("SOURCE"));
			fl.setDest(rs.getString("DESTINATION"));
			fl.setArr(rs.getString("ARRIVAL_DATE"));
			fl.setDept(rs.getString("DEPARTURE_DATE"));
			fl.setSeats(rs.getInt("SEATS"));
			fl.setStatus(rs.getString("STATUS"));
			fl.setDelay(rs.getInt("DELAY"));
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return fl;
	}
	
	public int updateFlight(String delay,String status,String id) throws SQLException {
		
		String sql = "update flight set DELAY='"+delay+"',STATUS='"+status+"' where ID='"+id+"'";
		int i = 0 ;
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		System.out.println(i+"**********");
		return i;
	}

	public ArrayList<String> getmails(String parameter) {
		// TODO Auto-generated method stub
		return null;
	}

	public int cancelFlight(String id) {
		// TODO Auto-generated method stub
		String sql = "update flight set STATUS='CANCELLED' where ID='"+id+"'";
		int i = 0 ;
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		System.out.println(i+"**********");
		return i;
	}
	
	public int book(String fid,String cid,String feature) throws SQLException {
		
		String sql = "insert into Book(CUST_ID,FLIGHT_ID,EXTRAS) values ('"+cid+"','"+fid+"','"+feature+"')";
		int i = 0 ;
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return i;
	}
	
	public ArrayList<Book> getBookingsByID(String cid)  throws SQLException {
		String sql = "select * from book where cust_id='"+cid+"'";
		ArrayList<Book> bl = new ArrayList<Book>();
		try {
		conn = DBConnector.getConnection();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			Book book = new Book();
			book.setId(rs.getInt("ID"));
			book.setCustid(rs.getInt("CUST_ID"));
			book.setFlightid(rs.getInt("FLIGHT_ID"));
			book.setExtras(rs.getString("EXTRAS"));
			bl.add(book);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return bl;	
	}
	
	public ArrayList<Customer> getAllCustomers(){
		String sql = "select * from Customer";
		ArrayList<Customer> bl = new ArrayList<Customer>();
		try {
		conn = DBConnector.getConnection();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			Customer c = new Customer();
			c.setId(rs.getInt("ID"));
			c.setAge(rs.getInt("AGE"));
			c.setMobnum(rs.getLong("MOBNUM"));
			c.setName(rs.getString("NAME"));
			c.setSex(rs.getString("SEX"));
			c.setCity(rs.getString("CITY"));
			bl.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return bl;	
	}
	
	public ArrayList<Book> getBookings()  throws SQLException {
		String sql = "select * from book";
		ArrayList<Book> bl = new ArrayList<Book>();
		try {
		conn = DBConnector.getConnection();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			Book book = new Book();
			book.setId(rs.getInt("ID"));
			book.setCustid(rs.getInt("CUST_ID"));
			book.setFlightid(rs.getInt("FLIGHT_ID"));
			bl.add(book);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return bl;	
	}

	public int deleteFlight(String parameter) {
		// TODO Auto-generated method stub
		String sql = "delete from flight where id='"+parameter+"'";
		int i = 0 ;
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return i;
	}

	public int cancelbook(String parameter) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String sql = "delete from Book where id='"+parameter+"'";
		int i = 0 ;
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return i;
	}
}
