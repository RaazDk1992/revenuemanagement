package object;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.mysql.jdbc.Connection;

import db.Db;

public class RevenueMainTitle {
	
	/**
	 * 
	 * 
	 */
	private static final String ADD_REVENUE_MAIN_TITLE = "INSERT INTO tbl_main_title(main_title, isactive) VALUES (?,?)";
	private static final String UPDATE_REVENUE_MAIN_TITLE = "UPDATE  tbl_main_title SET main_title = ?, isactive = ? WHERE rec_id=? ";
	private static final String ENABLE_DISABLE_MAIN_TITLE = "UPDATE  tbl_main_title SET isactive = ? WHERE rec_id = ?";
	private static final String LOAD_REVENUE_MAIN_TITLE = "SELECT * FROM tbl_main_title";
	private static final String LOAD_ACTIVE_REVENUE_MAIN_TITLE = "SELECT * FROM tbl_main_title WHERE isactive=?";

	
	public RevenueMainTitle(){
		
	}
	
	public JSONObject addMainTitle(String RevenueMainTitle){
		JSONObject status = new JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = new Db().connect();
		    stmt = conn.prepareStatement(ADD_REVENUE_MAIN_TITLE);
			stmt.setString(1, RevenueMainTitle);
			stmt.setBoolean(2, true);
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
			stmt = conn.prepareStatement(ENABLE_DISABLE_MAIN_TITLE);
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
			stmt = conn.prepareStatement(LOAD_REVENUE_MAIN_TITLE);
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
			stmt = conn.prepareStatement(LOAD_ACTIVE_REVENUE_MAIN_TITLE);
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
