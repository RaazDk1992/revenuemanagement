package server;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import db.Db;
import object.Address;
import object.Bill;
import object.Designation;
import object.FiscalYear;
import object.Organization;
import object.Rasid;
import object.RevenueMainTitle;
import object.RevenueTitle;
import object.Search;
import object.Summary;
import object.User;

/**
 * Servlet implementation class InventoryBase
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/InventoryBase" })
public class InventoryBase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InventoryBase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String required = request.getParameter("required");
		if(required.equalsIgnoreCase("maintitle")){
			
			response.getWriter().write(new RevenueMainTitle().loadRevenueTitle().toString());		

			
		}else if(required.equalsIgnoreCase("active_main_title")){
			
			response.getWriter().write(new RevenueMainTitle().loadActiveRevenueTitle().toString());		

			
		} else if(required.equalsIgnoreCase("active_fy")){
			
			response.getWriter().write(new FiscalYear().loadActiveFiscalYear().toString());

		}else if(required.equalsIgnoreCase("revenue_titles")){
			
			response.getWriter().write(new RevenueTitle().loadRevenueTitle().toString());

		} else if(required.equalsIgnoreCase("active_rev_title")){
			
			response.getWriter().write(new RevenueTitle().loadActiveRevenueTitle().toString());
		} else if(required.equalsIgnoreCase("adress_ref")){
			
			response.getWriter().write(new Address().loadAdressArray().toString());
		} else if(required.equalsIgnoreCase("load_fiscal_year")){
			response.getWriter().write(new FiscalYear().loadFiscalYears().toString());
		} else if(required.equalsIgnoreCase("getusers")){
			response.getWriter().write(new User(request).fetchUsers().toString());
		}else if(required.equalsIgnoreCase("titlewise_summary")){
			response.getWriter().write(new Summary().fetchSummaryByTitles().toString());
			
		}else if(required.equalsIgnoreCase("officewise_summary")){
			response.getWriter().write(new Summary().fetchSummaryByOffice().toString());
		} else if(required.equalsIgnoreCase("office_all")){
			response.getWriter().write(new Organization().loadOrganizations().toString());
		} else if(required.equalsIgnoreCase("designation_all")){
			response.getWriter().write(new Designation().loadDesignations().toString());
		} else if(required.equalsIgnoreCase("rasid_allocation")){
			response.getWriter().write(new Rasid().loadRasids().toString());
		} else if(required.equalsIgnoreCase("officewise_summary_today")){
			String date = request.getParameter("date");
			response.getWriter().write(new Summary().fetchSummaryToday(date).toString());
		}else if(required.equalsIgnoreCase("officewise_summary_thisweek")){
			String date = request.getParameter("date");
			response.getWriter().write(new Summary().fetchSummaryWeekly(date).toString());
		}else if(required.equalsIgnoreCase("officewise_summary_thismonth")){
			String date = request.getParameter("date");
			response.getWriter().write(new Summary().fetchSummaryMonthly(date).toString());
			
		} else if(required.equalsIgnoreCase("office_based_list")){
			
			String org_ref = request.getParameter("org");
			if(org_ref != null){
				response.getWriter().write(new Bill().searchByOrg(Integer.parseInt(org_ref)).toString());
			}
			
		}
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String task = request.getParameter("task");
		if(task.equalsIgnoreCase("new_main_title")){
			
			response.getWriter().write(new RevenueMainTitle().addMainTitle(request.getParameter("revenue_main_title")).toString());
		}
		else if(task.equalsIgnoreCase("ed_main_title")){
			boolean  status = Boolean.parseBoolean(request.getParameter("enabled"));
			int id = Integer.parseInt(request.getParameter("rec_id"));
			response.getWriter().write(new RevenueMainTitle().EDMainTitle(status, id).toString());
		}else if(task.equalsIgnoreCase("ed_fy")){
			
			boolean  status = Boolean.parseBoolean(request.getParameter("enabled"));
			int id = Integer.parseInt(request.getParameter("rec_id"));
			response.getWriter().write(new FiscalYear().EDFY(status, id).toString());
		}
		
		else if(task.equalsIgnoreCase("ed_title")) {
			
			boolean  status = Boolean.parseBoolean(request.getParameter("enabled"));
			int id = Integer.parseInt(request.getParameter("rec_id"));
			System.err.println(id+"-"+status);
			response.getWriter().write(new RevenueTitle().EDMainTitle(status, id).toString());
			
		}else if(task.equalsIgnoreCase("ed_rasid")){
			
			boolean  status = Boolean.parseBoolean(request.getParameter("enabled"));
			int id = Integer.parseInt(request.getParameter("rec_id"));
			
			response.getWriter().write(new Rasid().EDRasid(status, id).toString());
		}else if(task.equalsIgnoreCase("ed_organization")){
			
		}else if(task.equalsIgnoreCase("ed_user")){
			
			boolean  status = Boolean.parseBoolean(request.getParameter("enabled"));
			String user_id = request.getParameter("rec_id");
			System.err.println(user_id+"-"+status);
			response.getWriter().write(new User(request).EDuser(status, user_id).toString());
			
			
		}else if(task.equalsIgnoreCase("new_revenue_title")){
			
			
			int  fy_ref = Integer.parseInt(request.getParameter("fiscal_year_"));
			int rev_main_title_ref = Integer.parseInt(request.getParameter("main_title_ref"));
			int rate = Integer.parseInt(request.getParameter("service_fare"));
			String rev_title = request.getParameter("service_name");
			
			response.getWriter().write(new RevenueTitle().addMainTitle(fy_ref,1, rev_main_title_ref, rate, rev_title).toString());
			//int fiscalyear_ref, int org_ref, int main_title_ref,int rate ,String RevenueMainTitle
			
			
			
		} else if(task.equalsIgnoreCase("new_bill")){
			
			int TotalAmount = Integer.parseInt(request.getParameter("total_amount_hidden"));
			String host_type = request.getParameter("host_name_hidden");
			String[] rev_ref_array = request.getParameter("service_ref_hidden").split(",");
			String clientName = request.getParameter("customer_name");
			int  addressRef = Integer.parseInt(request.getParameter("customer_addresss"));
			int fiscalyearRef  = Integer.parseInt(request.getParameter("fiscal_year_ref"));
			int current_rasid = Integer.parseInt(request.getParameter("current_rasid"));
			String date_hidden = request.getParameter("date_hidden");
			HttpSession session  = request.getSession();
			int office_ref = (int)session.getAttribute("office_id"); 
			int user_ref = (int)session.getAttribute("u_id"); 
			
			
			
			
			if(host_type.equalsIgnoreCase("local")){
				
				//String client_name,int rasid_ref,int fy_ref, int address_ref, String[] rev_ref, int total_amount, int user_ref, int office_ref
				response.getWriter().write(new Bill().newBill(clientName,current_rasid,fiscalyearRef, addressRef, rev_ref_array, TotalAmount, user_ref,office_ref,date_hidden).toString());
				
				
			} else if(host_type.equalsIgnoreCase("remote")){
				
			}
			
		
		} else if(task.equalsIgnoreCase("new_fiscal_year")){
			response.getWriter().write(new FiscalYear().addFiscalYear(request.getParameter("fiscal_year_new")).toString());
		} else if(task.equalsIgnoreCase("_search")){
			
			String SearchOffset = request.getParameter("search_string_hidden");
			String fromDate = request.getParameter("date_picker_from_en");
			String toDate = request.getParameter("date_picker_to_en");
			String user = request.getParameter("rec_by_user_name");
			//rec_by_user_name,from-picker,to-picker
			
			
			if(SearchOffset.equalsIgnoreCase("rec_by_user_name,fromDateD,toDateD")){
				
				response.getWriter().write(new Search().searchByDateAndUser(fromDate, toDate, user).toString());
				
			} else if(SearchOffset.equalsIgnoreCase("rec_by_user_name")){
				
				response.getWriter().write(new Search().searchByUser(user).toString());
				
			} else if(SearchOffset.equalsIgnoreCase("fromDateD") || SearchOffset.equalsIgnoreCase("fromDateD,toDateD")
					||SearchOffset.equalsIgnoreCase("toDateD") ){
				
				response.getWriter().write(new Search().searchByDate(fromDate, toDate).toString());
				System.err.println(fromDate+"-"+toDate);

				
			} else {
				
			}
		} else if(task.equalsIgnoreCase("new_designation")){
		
			response.getWriter().write(new Designation().addDesignation(request.getParameter("designation_name")).toString());
		}else if(task.equalsIgnoreCase("new_office")){
			
			response.getWriter().write(new Organization().addOrganization(request.getParameter("office_name")).toString());

			
		} else if(task.equalsIgnoreCase("login")){
			
			
			response.getWriter().write(new User(request).Authenticate(request.getParameter("uname"), request.getParameter("pass")).toString());
			
		} else if(task.equalsIgnoreCase("new_rasid_allocation")){
			
			int office_ref = Integer.parseInt(request.getParameter("office_ref"));
			String rasid_range = request.getParameter("rasid_range");
			String[] temp = rasid_range.split("-");
			int start = Integer.parseInt(temp[0]);
			int ceil = Integer.parseInt(temp[1]);
			
			response.getWriter().write(new Rasid().addRasid(office_ref, start, ceil, start).toString());
			
		} else if(task.equalsIgnoreCase("new_user")){
			
			String UserFullName = request.getParameter("user_full_name");
			int Office_ref = Integer.parseInt(request.getParameter("office_ref"));
			int designation_ref = Integer.parseInt(request.getParameter("user_designation"));
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			HttpSession session  = request.getSession();
			
			String user_ref = (String)session.getAttribute("uname"); 
			
			response.getWriter().write(new User(request).createUser(Office_ref, username, UserFullName, password, designation_ref, user_ref).toString());
		} else if(task.equalsIgnoreCase("rasid_search")){
			
			String customer_name =request.getParameter("customername_search");
			String rasid_no = request.getParameter("rasidno_search");
		} else if(task.equalsIgnoreCase("new_device")){
			
		}
		
	}

}
