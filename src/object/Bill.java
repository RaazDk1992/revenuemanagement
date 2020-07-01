package object;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import db.Db;

public class Bill {
	
	
	private static final String ADD_NEW_BILL = " INSERT INTO bill_main(bill_no,fy_ref,customer_name,address_ref,office_ref,total_amount,added_by,date_np) VALUES(?,?,?,?,?,?,?,?) ";
	private static final String ADD_BILL_DETAILS = "INSERT INTO bill_details(bill_ref,rev_ref) 	VALUES(?,?)";
	
	private static final String ADD_NEW_BILL_TMP = " INSERT INTO bill_main_tmp(customer_name,address_ref,total_amount,added_by) VALUES(?,?,?,?) ";
	private static final String ADD_BILL_DETAILS_TMP = "INSERT INTO bill_details_tmp(bill_ref,rev_ref) 	VALUES(?,?)";
	
	
	private static final String UPDATE_CURRENT_BILL = "UPDATE rasid_range SET current_val=? WHERE org_ref=?";
	
	private static final String UPDATE_BILL = "UPDATE bill_main SET customer_name=?, address_ref=? WHERE bill_no=?";
	private static final String FETCH_BILL_LIST = "SELECT bill_main.rec_id, bill_main.customer_name, bill_main.total_amount, address._address, revenue_titles.service_name,revenue_titles.service_charge, fiscal_year.year,users.user_name FROM bill_main,address,bill_details, revenue_titles, fiscal_year, users WHERE bill_main.rec_id = bill_details.bill_ref and bill_main.address_ref = address.rec_id and revenue_titles.rec_id = bill_details.rev_ref and revenue_titles.fiscalyear_ref = fiscal_year.rec_id and users.rec_id = bill_main.added_by ";
	
	private static final String GET_CURRENT_BILL = "SELECT rasid_range.current_val FROM rasid_range WHERE rasid_range.org_ref=?";
	
	private static final String SEARCH_BY_RASID_REF = "SELECT bill_main.bill_no,bill_main.customer_name,bill_main.address_ref,bill_main.total_amount,users.full_name,revenue_titles.service_name,revenue_titles.service_charge,designation.designation_np FROM bill_main,bill_details,revenue_titles,users,designation WHERE bill_main.added_by = users.rec_id and bill_main.rec_id = bill_details.bill_ref and users.designation_ref = designation.rec_id AND bill_details.rev_ref = revenue_titles.rec_id AND bill_main.bill_no=?";
	
	private static final String LOAD_BY_ORG_REF = "SELECT bill_main.bill_no, bill_main.customer_name, bill_main.total_amount, address._address, revenue_titles.service_name,revenue_titles.service_charge, fiscal_year.year,users.user_name, DATE(bill_main.time_stamp) as date FROM bill_main,address,bill_details, revenue_titles, fiscal_year, users, organization WHERE bill_main.rec_id = bill_details.bill_ref and bill_main.address_ref = address.rec_id and revenue_titles.rec_id = bill_details.rev_ref and revenue_titles.fiscalyear_ref = fiscal_year.rec_id and users.rec_id = bill_main.added_by and users.org_ref = organization.rec_id and organization.rec_id=?";

	
	
	public Bill(){
		
	}
	
	public JSONObject newBill(String client_name,int rasid_ref,int fy_ref, int address_ref, String[] rev_ref, int total_amount, int user_ref, int office_ref, String date_np){
		
		Connection conn =null;
		PreparedStatement stmt =null;
		JSONObject response = new JSONObject();
		try{
			 conn = new Db().connect();
			stmt = conn.prepareStatement(ADD_NEW_BILL,com.mysql.jdbc.Statement.RETURN_GENERATED_KEYS);
			//customer_name,address_ref,office_ref,total_amount,added_by
			stmt.setInt(1, rasid_ref);
			stmt.setInt(2, fy_ref);
			stmt.setString(3, client_name);
			stmt.setInt(4, address_ref);
			stmt.setInt(5, office_ref);
			stmt.setInt(6, total_amount);
			stmt.setInt(7, user_ref);
			stmt.setDate(8, Date.valueOf(date_np));
			stmt.executeUpdate();
			ResultSet Keys = stmt.getGeneratedKeys();
			
			if(Keys.next()){
				int last_id= Keys.getInt(1);
				return addBillDetails(last_id, rev_ref, office_ref, rasid_ref);
			} else{
				
			}
			
			
		}catch (Exception e) {
			// TODO: handle exception
			try {
				response.put("status", e.getCause());
				e.printStackTrace();
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return response;
	}
	


	
	public JSONObject addBillDetails(int bill_ref, String[] rev_ref, int office_ref, int rasid_ref){
		JSONObject status = new JSONObject();
		Connection conn = null;
		boolean state = true;
		PreparedStatement stmt =null;
		
		try {

				conn = new Db().connect();
				for(String ref : rev_ref){
					int i = 0;
					stmt = conn.prepareStatement(ADD_BILL_DETAILS);
					stmt.setInt(1, bill_ref);
					stmt.setInt(2, Integer.parseInt(ref));
					i = stmt.executeUpdate();
					if(i >0){
						continue;
					} else {
						state = false;
						break;
					}
				}
				
				if(state && updateRasidNo(rasid_ref, office_ref)){
					status.put("status", "success");
					status.put("new_bill",rasid_ref+1);
				} else {
					status.put("status", "fail");
				}
				return status;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			try {
				status.put("status", e.getCause());
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		
		
		return status;
	}
	
	public JSONObject addBillDetailstmp(int bill_ref, String[] rev_ref){
		JSONObject status = new JSONObject();
		Connection conn = null;
		boolean state = true;
		PreparedStatement stmt =null;
		
		try {

				conn = new Db().connect();
				for(String ref : rev_ref){
					int i = 0;
					stmt = conn.prepareStatement(ADD_BILL_DETAILS_TMP);
					stmt.setInt(1, bill_ref);
					stmt.setInt(2, Integer.parseInt(ref));
					i = stmt.executeUpdate();
					if(i >0){
						continue;
					} else {
						state = false;
						break;
					}
				}
				
				if(state){
					status.put("status", "success");
				} else {
					status.put("status", "fail");
				}
				return status;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			try {
				status.put("status", e.getCause());
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		
		
		return status;
	}
	
	public JSONObject updateBillDetails(String rec_id, String client_name){
		
			JSONObject response = new JSONObject();
		
			return response;
		
		
	}
	
	public JSONObject rollBackTransaction(int bill_ref){
		JSONObject obj = new JSONObject();
		
		return obj;
	}
	
	public boolean updateRasidNo(int current_val, int org_ref){
		boolean updated = false;
		Connection conn =null;
		System.err.println("------------"+current_val);
		PreparedStatement stmt =null;
		try {
			conn = new Db().connect();
			stmt = conn.prepareStatement(UPDATE_CURRENT_BILL);
			stmt.setInt(1, current_val+1);
			stmt.setInt(2, org_ref);
			int c  = stmt.executeUpdate();
			if(c>0){
				updated = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return updated;
	}
	
	public JSONArray listBillDetails() throws SQLException, JSONException{
		JSONArray array = new JSONArray();
		JSONObject bill = null;
		Connection conn = null;
		ResultSet result = null;
		PreparedStatement stmt = null;
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(FETCH_BILL_LIST);
			
			result = stmt.executeQuery();
			while (result.next()) {
				bill = new JSONObject();
				bill.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				bill.put(result.getMetaData().getColumnLabel(2), result.getString(2));
				bill.put(result.getMetaData().getColumnLabel(3), result.getString(3));
				bill.put(result.getMetaData().getColumnLabel(4), result.getString(4));
				bill.put(result.getMetaData().getColumnLabel(5), result.getString(5));
				bill.put(result.getMetaData().getColumnLabel(6), result.getString(6));
				bill.put(result.getMetaData().getColumnLabel(7), result.getString(7));
				bill.put(result.getMetaData().getColumnLabel(8), result.getString(8));
				array.put(bill);
				
			}
		}catch (Exception e) {
			// TODO: handle exception
			try {
				bill.put("exception", e.getStackTrace());
				array.put(bill);
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			result.close();
			stmt.close();
			conn.close();
			
		}
				
				
				return array;
	}
	
	
	
	public JSONObject getCurrentBillNo(int org_ref) throws SQLException, JSONException{
		JSONArray array = new JSONArray();
		JSONObject bill = null;
		Connection conn = null;
		ResultSet result = null;
		PreparedStatement stmt = null;
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(GET_CURRENT_BILL);
			stmt.setInt(1, org_ref);
			
			result = stmt.executeQuery();
			if (result.next()) {
				bill = new JSONObject();
				bill.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				
				
				
			}
		}catch (Exception e) {
			// TODO: handle exception
			try {
				bill.put("exception", e.getStackTrace());
			
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			result.close();
			stmt.close();
			conn.close();
			
		}
				
				
				return bill;
	}
	
	
	public JSONArray searchByRasid(int rasid_ref) throws SQLException, JSONException{
		JSONArray array = new JSONArray();
		JSONObject bill = null;
		Connection conn = null;
		ResultSet result = null;
		PreparedStatement stmt = null;
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(SEARCH_BY_RASID_REF);
			stmt.setInt(1, rasid_ref);
			
			result = stmt.executeQuery();
			while (result.next()) {
				bill = new JSONObject();
				bill.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				bill.put(result.getMetaData().getColumnLabel(2), result.getString(2));
				bill.put(result.getMetaData().getColumnLabel(3), result.getString(3));
				bill.put(result.getMetaData().getColumnLabel(4), result.getString(4));
				bill.put(result.getMetaData().getColumnLabel(5), result.getString(5));
				bill.put(result.getMetaData().getColumnLabel(6), result.getString(6));
				bill.put(result.getMetaData().getColumnLabel(7), result.getString(7));
				bill.put(result.getMetaData().getColumnLabel(8), result.getString(8));
				array.put(bill);
				
			}
		}catch (Exception e) {
			// TODO: handle exception
			try {
				bill.put("exception", e.getStackTrace());
				array.put(bill);
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			result.close();
			stmt.close();
			conn.close();
			
		}
				
				
				return array;
	}
	
	
	public JSONArray searchByOrg(int orgRef) {
		JSONArray array = new JSONArray();
		JSONObject bill = null;
		Connection conn = null;
		ResultSet result = null;
		PreparedStatement stmt = null;
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(LOAD_BY_ORG_REF);
			stmt.setInt(1, orgRef);
			
			result = stmt.executeQuery();
			while (result.next()) {
				bill = new JSONObject();
				bill.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				bill.put(result.getMetaData().getColumnLabel(2), result.getString(2));
				bill.put(result.getMetaData().getColumnLabel(3), result.getString(3));
				bill.put(result.getMetaData().getColumnLabel(4), result.getString(4));
				bill.put(result.getMetaData().getColumnLabel(5), result.getString(5));
				bill.put(result.getMetaData().getColumnLabel(6), result.getString(6));
				bill.put(result.getMetaData().getColumnLabel(7), result.getString(7));
				bill.put(result.getMetaData().getColumnLabel(8), result.getString(8));
				bill.put(result.getMetaData().getColumnLabel(9), result.getString(9));

				array.put(bill);
				
			}
		}catch (Exception e) {
			// TODO: handle exception
			try {
				bill.put("exception", e.getStackTrace());
				array.put(bill);
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				result.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
				
				
				return array;
	}
	
	
	
	
	

}
