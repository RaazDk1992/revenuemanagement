package object;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import db.Db;

public class RevenueTitle {
	
	
	private static final String ADD_REVENUE_TITLE = "INSERT INTO revenue_titles(fiscalyear_ref,org_ref,	main_title_ref,	service_name,service_charge,isactive ) VALUES (?,?,?,?,?,?)";
	private static final String UPDATE_REVENUE_TITLE = "UPDATE  revenue_titles SET main_title_ref =?,	service_name =?,service_charge =? WHERE rec_id=? ";
	private static final String ENABLE_DISABLE_TITLE = "UPDATE  revenue_titles SET isactive = ? WHERE rec_id = ?";
	private static final String LOAD_REVENUE_TITLE = "SELECT revenue_titles.rec_id,fiscal_year.year,organization.organization_name,tbl_main_title.main_title, revenue_titles.service_name,revenue_titles.service_charge, revenue_titles.isactive from revenue_titles,fiscal_year,tbl_main_title,organization WHERE revenue_titles.fiscalyear_ref = fiscal_year.rec_id and revenue_titles.org_ref = organization.rec_id and revenue_titles.main_title_ref = tbl_main_title.rec_id";
	private static final String LOAD_ACTIVE_REVENUE_TITLE = "SELECT rec_id,service_name,service_charge FROM revenue_titles WHERE isactive=?";

	
	public RevenueTitle(){
		
	}
	
	public JSONObject addMainTitle(int fiscalyear_ref, int org_ref, int main_title_ref,int rate ,String RevenueMainTitle){
		JSONObject status = new JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = new Db().connect();
		    stmt = conn.prepareStatement(ADD_REVENUE_TITLE);
			stmt.setInt(1, fiscalyear_ref);
			stmt.setInt(2, org_ref);
			stmt.setInt(3, main_title_ref);
			stmt.setString(4, RevenueMainTitle);
			stmt.setInt(5, rate);
			stmt.setBoolean(6, true);
			int row = stmt.executeUpdate();
			if(row >0){
				status.put("status", "success");
			} else {
				
				status.put("status", "fail");
			}
		} catch (SQLException | JSONException e) {
			// TODO Auto-generated catch block
			try {
				status.put("status", e.getStackTrace());
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
		
		return status;
	}
	
	public JSONObject updateTitle(int main_title_ref, String RevenueMainTitle, int service_charge, int id){
		JSONObject status = new JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = new Db().connect();
		    stmt = conn.prepareStatement(UPDATE_REVENUE_TITLE);
			stmt.setInt(1, main_title_ref);
			stmt.setString(2, RevenueMainTitle);
			stmt.setInt(3, service_charge);
			stmt.setInt(4, id);
			
				int row = stmt.executeUpdate();
			if(row >0){
				status.put("status", "success");
			} else {
				
				status.put("status", "fail");
			}
		} catch (SQLException | JSONException e) {
			// TODO Auto-generated catch block
			try {
				status.put("status", e.getStackTrace());
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
		
		return status;
	}
	
	
	public JSONObject EDMainTitle(Boolean status, int id){
		JSONObject obj = new  JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(ENABLE_DISABLE_TITLE);
			stmt.setBoolean(1, status);
			stmt.setInt(2, id);
			int  i = stmt.executeUpdate();
			if(i>0){
				obj.put("status", "success");
			} else{
				obj.put("status", "fail");
			}
		}catch (Exception e) {
			// TODO: handle exception
			try {
				obj.put("status", e.getCause());
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
		
		return obj;
	}
	
	public JSONArray loadRevenueTitle(){
		JSONArray titleArray = new JSONArray();
		JSONObject title = new JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(LOAD_REVENUE_TITLE);
			result = stmt.executeQuery();
			while(result.next()){
				
				title = new JSONObject();
				title.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				title.put(result.getMetaData().getColumnLabel(2), result.getString(2));
				title.put(result.getMetaData().getColumnLabel(3), result.getString(3));
				title.put(result.getMetaData().getColumnLabel(4), result.getString(4));
				title.put(result.getMetaData().getColumnLabel(5), result.getString(5));
				title.put(result.getMetaData().getColumnLabel(6), result.getString(6));
				title.put(result.getMetaData().getColumnLabel(7), result.getString(7));
				
				titleArray.put(title);
			}
			
			return titleArray;
			
		}catch (Exception e) {
			// TODO: handle exception
			try {
				title.put("ex", e.getStackTrace());
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally{
			
			try {
				result.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
		
		return titleArray;
	}
	public JSONArray loadActiveRevenueTitle(){
		JSONArray titleArray = new JSONArray();
		JSONObject title = new JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(LOAD_ACTIVE_REVENUE_TITLE);
			stmt.setBoolean(1, true);
			result = stmt.executeQuery();
			while(result.next()){
				
				title = new JSONObject();
				title.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				title.put(result.getMetaData().getColumnLabel(2), result.getString(2));
				title.put(result.getMetaData().getColumnLabel(3), result.getString(3));
				
				titleArray.put(title);
			}
			
			return titleArray;
			
		}catch (Exception e) {
			// TODO: handle exception
			try {
				title.put("ex", e.getStackTrace());
				e.printStackTrace();
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally{
			
			try {
				result.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
		
		return titleArray;
	}
	

}
