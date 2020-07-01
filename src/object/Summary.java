package object;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import db.Db;

public class Summary {

		private static final String OFFICE_WISE_SUMMARY_TOTAL = "select organization.organization_name,IFNULL(SUM(total_amount),0) as amt from organization LEFT JOIN bill_main ON bill_main.office_ref = organization.rec_id AND YEAR(time_stamp) = YEAR(CURRENT_DATE()) GROUP BY organization.organization_name ";
		private static final String OFFICE_WISE_SUMMARY_WEEKLY = "select organization.organization_name,IFNULL(SUM(total_amount),0) as amt from organization LEFT JOIN bill_main ON bill_main.office_ref = organization.rec_id and YEARWEEK(date_np) = YEARWEEK(?) AND MONTH(date_np)= MONTH(?) AND  YEAR(date_np) = YEAR(?) GROUP BY organization.organization_name ";
		private static final String OFFICE_WISE_SUMMARY_MONTHLY = "select organization.organization_name,IFNULL(SUM(total_amount),0) as amt from organization LEFT JOIN bill_main ON bill_main.office_ref = organization.rec_id  AND MONTH(date_np)= MONTH(?) AND  YEAR(date_np) = YEAR(?) GROUP BY organization.organization_name ";
		private static final String OFFICE_WISE_SUMMARY_TODAY = "select organization.organization_name,IFNULL(SUM(total_amount),0) as amt from organization LEFT JOIN bill_main ON bill_main.office_ref = organization.rec_id and DATE(date_np) = DATE(?) GROUP BY organization.organization_name ";

		private static final String TITLEWISE_SUMMARY = "SELECT revenue_titles.service_name, sum(revenue_titles.service_charge) as amt from bill_details,revenue_titles WHERE revenue_titles.rec_id = bill_details.rev_ref GROUP BY(revenue_titles.service_name) ";
	public Summary(){
		
	}
	public JSONArray fetchSummaryByOffice(){
		JSONArray arr = new JSONArray();
		Connection conn = null;
		PreparedStatement stmt =null;
		ResultSet result = null;
		JSONObject rec;
		conn = new Db().connect();
		try {
			stmt = conn.prepareStatement(OFFICE_WISE_SUMMARY_TOTAL);
			result = stmt.executeQuery();
			while(result.next()){
				rec = new JSONObject();
				rec.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				rec.put(result.getMetaData().getColumnLabel(2), result.getString(2));

				arr.put(rec);
			}
		} catch (SQLException | JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		
		
		return arr;
	}
	
	public JSONArray fetchSummaryMonthly(String d){
		JSONArray arr = new JSONArray();
		Connection conn = null;
		PreparedStatement stmt =null;
		ResultSet result = null;
		JSONObject rec;
		conn = new Db().connect();
		try {
			stmt = conn.prepareStatement(OFFICE_WISE_SUMMARY_MONTHLY);
			stmt.setDate(1, Date.valueOf(d));
			stmt.setDate(2, Date.valueOf(d));
			result = stmt.executeQuery();
			while(result.next()){
				rec = new JSONObject();
				rec.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				rec.put(result.getMetaData().getColumnLabel(2), result.getString(2));

				arr.put(rec);
			}
		} catch (SQLException | JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		
		
		return arr;
	}
	
	public JSONArray fetchSummaryToday(String date){
		JSONArray arr = new JSONArray();
		Connection conn = null;
		PreparedStatement stmt =null;
		ResultSet result = null;
		JSONObject rec;
		conn = new Db().connect();
		try {
			stmt = conn.prepareStatement(OFFICE_WISE_SUMMARY_TODAY);
			stmt.setDate(1, Date.valueOf(date));
			result = stmt.executeQuery();
			while(result.next()){
				rec = new JSONObject();
				rec.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				rec.put(result.getMetaData().getColumnLabel(2), result.getString(2));

				arr.put(rec);
			}
		} catch (SQLException | JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		
		
		return arr;
	}
	
	
	
	public JSONArray fetchSummaryWeekly(String date_){
		JSONArray arr = new JSONArray();
		Connection conn = null;
		PreparedStatement stmt =null;
		ResultSet result = null;
		JSONObject rec;
		conn = new Db().connect();
		try {
			stmt = conn.prepareStatement(OFFICE_WISE_SUMMARY_WEEKLY);
			stmt.setDate(1, Date.valueOf(date_));
			stmt.setDate(2, Date.valueOf(date_));
			stmt.setDate(3, Date.valueOf(date_));
			result = stmt.executeQuery();
			while(result.next()){
				rec = new JSONObject();
				rec.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				rec.put(result.getMetaData().getColumnLabel(2), result.getString(2));

				arr.put(rec);
			}
		} catch (SQLException | JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		
		
		return arr;
	}
	
	
	
	
	
	public JSONArray fetchSummaryByTitles(){
		JSONArray arr = new JSONArray();
		Connection conn = null;
		PreparedStatement stmt =null;
		ResultSet result = null;
		JSONObject title;
		conn = new Db().connect();
		try {
			stmt = conn.prepareStatement(TITLEWISE_SUMMARY);
			result = stmt.executeQuery();
			while(result.next()){
				title = new JSONObject();
				title.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				title.put(result.getMetaData().getColumnLabel(2), result.getString(2));

				arr.put(title);
			}
		} catch (SQLException | JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		
		
		return arr;
	}
}
