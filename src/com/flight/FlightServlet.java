package com.flight;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FlightServlet
 */
public class FlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FlightServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("param");
		FlightDao dao = new FlightDao();
		if(action.equals("login")) {
			String uname = request.getParameter("uname");
			String pwd = request.getParameter("pwd");
			try {
				Customer cust = dao.verifyUser(uname, pwd);
				if(cust!=null) {
					request.setAttribute("cust", cust);
					RequestDispatcher rd = request.getRequestDispatcher("/customerhome.jsp");
					rd.forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(action.equals("register")) {
		Customer cust = new Customer(request.getParameter("cname") ,request.getParameter("sex"),Integer.parseInt(request.getParameter("age")),Long.parseLong(request.getParameter("mobnum")),request.getParameter("city"),request.getParameter("uname"),request.getParameter("pwd"));
		try {
			int i = dao.addcustomer(cust);
			if(i!=0) {
				response.sendRedirect("Login.jsp");
			}else {
				response.sendRedirect("registration.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		else if(action.equals("addflight")) {
			Flight fl;
			try {
				fl = new Flight(request.getParameter("name") ,request.getParameter("num"),request.getParameter("src"),request.getParameter("dest"),request.getParameter("arr"),request.getParameter("dept"),Integer.parseInt(request.getParameter("seats")));
				int i = dao.addflight(fl);
				if(i!=0) {
					ArrayList<Flight> flist = (ArrayList<Flight>) dao.getAllFlights();
					request.setAttribute("flist", flist);
					RequestDispatcher rd = request.getRequestDispatcher("/viewFlight.jsp");
					rd.forward(request, response);
				}else {
					RequestDispatcher rd = request.getRequestDispatcher("/addFlight.jsp");
					rd.forward(request, response);
				}
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(action.equals("viewflight")) {
			
				ArrayList<Flight> flist = (ArrayList<Flight>) dao.getAllFlights();
				request.setAttribute("flist", flist);
				RequestDispatcher rd = request.getRequestDispatcher("/viewFlight.jsp");
				rd.forward(request, response);
				
		}else if(action.equals("deleteflight")) {
			int i = dao.deleteFlight(request.getParameter("fid"));
			ArrayList<Flight> flist = (ArrayList<Flight>) dao.getAllFlights();
			request.setAttribute("flist", flist);
			RequestDispatcher rd = request.getRequestDispatcher("/viewFlight.jsp");
			rd.forward(request, response);
			
		}else if(action.equals("updateflight")) {
				try {
					System.out.println(request.getParameter("delay")+"***"+ request.getParameter("id")+"****"+ request.getParameter("status"));
					int i = dao.updateFlight(request.getParameter("delay"), request.getParameter("status"), request.getParameter("id"));
				/*	if(i!=0) {
						ArrayList<String> mails = dao.getmails(request.getParameter("fid"));
					}*/
					RequestDispatcher rd = request.getRequestDispatcher("/updated.jsp");
					rd.forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}else if(action.equals("cancelflight")) {
			System.out.println(request.getParameter("fid")+"****");
			int i = dao.cancelFlight( request.getParameter("fid"));
			/*	if(i!=0) {
				ArrayList<String> mails = dao.getmails(request.getParameter("fid"));
			}*/
			RequestDispatcher rd = request.getRequestDispatcher("/cancelled.jsp");
			rd.forward(request, response);
		}else if(action.equals("book")) {
		System.out.println(request.getParameter("fid")+"****");
		System.out.println(request.getParameter("feature")+"****");
		try {
			int i = dao.book( request.getParameter("fid"),request.getParameter("cid"),request.getParameter("feature"));
			Customer cust = dao.getCustomerById(request.getParameter("cid"));
			System.out.println(cust.getId());
			request.setAttribute("cust", cust);
			request.setAttribute("msg", "Your Booking is Successful.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("/customerhome.jsp");
		rd.forward(request, response);
		}else if(action.equalsIgnoreCase("adminlogin")) {
			if( request.getParameter("uname").equals("admin") &&  request.getParameter("pwd").equals("admin")) {
				RequestDispatcher rd = request.getRequestDispatcher("/admin_home.jsp");
				rd.forward(request, response);
			}
		}else if(action.equalsIgnoreCase("cancelbook")) {
				int i = dao.cancelbook(request.getParameter("bid"));
				String id = request.getParameter("cid");
				RequestDispatcher rd = request.getRequestDispatcher("/customerbooking.jsp?id="+id+"");
				rd.forward(request, response);
		}
	}

}
