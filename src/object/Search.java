package object;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import db.Db;

public class Search {

	private static final String SEARCH_BY_DATE = "SELECT bill_main.rec_id, bill_main.customer_name, bill_main.total_amount, address._address, revenue_titles.service_name,revenue_titles.service_charge, fiscal_year.year,users.user_name, bill_main.time_stamp FROM bill_main,address,bill_details, revenue_titles, fiscal_year, users WHERE bill_main.rec_id = bill_details.bill_ref and bill_main.address_ref = address.rec_id and revenue_titles.rec_id = bill_details.rev_ref and revenue_titles.fiscalyear_ref = fiscal_year.rec_id and users.rec_id = bill_main.added_by and bill_main.time_stamp BETWEEN ? AND ? ";
	private static final String SEARCH_BY_USER = "SELECT bill_main.rec_id, bill_main.customer_name, bill_main.total_amount, address._address, revenue_titles.service_name,revenue_titles.service_charge, fiscal_year.year,users.user_name, bill_main.time_stamp FROM bill_main,address,bill_details, revenue_titles, fiscal_year, users WHERE bill_main.rec_id = bill_details.bill_ref and bill_main.address_ref = address.rec_id and revenue_titles.rec_id = bill_details.rev_ref and revenue_titles.fiscalyear_ref = fiscal_year.rec_id and users.rec_id = bill_main.added_by  and users.rec_id=?";
	private static final String SEARCH_BY_USER_AND_DATE = "SELECT bill_main.rec_id, bill_main.customer_name, bill_main.total_amount, address._address, revenue_titles.service_name,revenue_titles.service_charge, fiscal_year.year,users.user_name, bill_main.time_stamp FROM bill_main,address,bill_details, revenue_titles, fiscal_year, users WHERE bill_main.rec_id = bill_details.bill_ref and bill_main.address_ref = address.rec_id and revenue_titles.rec_id = bill_details.rev_ref and revenue_titles.fiscalyear_ref = fiscal_year.rec_id and users.rec_id = bill_main.added_by  and bill_main.time_stamp BETWEEN ? AND ? AND users.rec_id=?";
	
	public Search(){
		
	}
	
	public JSONArray searchByDate(String fromDate, String toDate){
		JSONArray array = new JSONArray();
		JSONObject rec = null;
		Connection conn = null;
		ResultSet result = null;
		PreparedStatement stmt = null;
	
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(SEARCH_BY_DATE);
			stmt.setDate(1, Date.valueOf(fromDate));
			stmt.setDate(2, Date.valueOf(toDate));
			
			result = stmt.executeQuery();
			while (result.next()) {
				rec = new JSONObject();
				rec.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				rec.put(result.getMetaData().getColumnLabel(2), result.getString(2));
				rec.put(result.getMetaData().getColumnLabel(3), result.getString(3));
				rec.put(result.getMetaData().getColumnLabel(4), result.getString(4));
				rec.put(result.getMetaData().getColumnLabel(5), result.getString(5));
				rec.put(result.getMetaData().getColumnLabel(6), result.getString(6));
				rec.put(result.getMetaData().getColumnLabel(7), result.getString(7));
				rec.put(result.getMetaData().getColumnLabel(8), result.getString(8));
				rec.put(result.getMetaData().getColumnLabel(9), result.getString(9));
				array.put(rec);
				
			}
		}catch (Exception e) {
			// TODO: handle exception
			try {
				rec.put("exception", e.getStackTrace());
				array.put(rec);
				
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try{
				result.close();
				stmt.close();
				conn.close();
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
				
				
				return array;
	}
	public JSONArray searchByUser(String username){
		
		JSONArray array = new JSONArray();
		JSONObject bill = null;
		Connection conn = null;
		ResultSet result = null;
		PreparedStatement stmt = null;
		System.err.println(username);
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(SEARCH_BY_USER);
			stmt.setString(1, username);
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
			try{
				result.close();
				stmt.close();
				conn.close();
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
				
				
				return array;
		
	}
	
	public JSONArray searchByDateAndUser(String startDate, String lastDate, String username){
		JSONArray array = new JSONArray();
		JSONObject bill = null;
		Connection conn = null;
		ResultSet result = null;
		PreparedStatement stmt = null;
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(SEARCH_BY_USER_AND_DATE);
			stmt.setDate(1, Date.valueOf(startDate));
			stmt.setDate(2, Date.valueOf(lastDate));
			stmt.setString(3, username);
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
			try{
				result.close();
				stmt.close();
				conn.close();
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
				
				
				return array;
	}
}
