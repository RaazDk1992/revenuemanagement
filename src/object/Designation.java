package object;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import db.Db;

public class Designation {
	
	private static final String ADD_DESIGNATION = "INSERT INTO designation(designation_np) values(?)";
	private static final String TOGGLE_DESGINATION = "UPDATE designation SET isactive=? WHERE rec_id=?";
	private static final String UPDATE_DESIGNATION = "UPDATE designation SET designation_np=? WHERE rec_id=?";
	private static final String LOAD_ALL_DESIGNATIONS = "SELECT * FROM designation";
	private static final String LOAD_ACTIVE_DESIGNATIONS = "SELECT * FROM designation WHERE isactive=?";
	
	public Designation(){
		
	}
	
	
	public JSONObject addDesignation(String DesignationName){
		JSONObject status = new JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = new Db().connect();
		    stmt = conn.prepareStatement(ADD_DESIGNATION);
			stmt.setString(1, DesignationName);
			
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
	
	public JSONObject toggleDesignation(Boolean _status, int rec_id){
		JSONObject status = new JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = new Db().connect();
		    stmt = conn.prepareStatement(TOGGLE_DESGINATION);
			stmt.setBoolean(1, _status);
			stmt.setInt(2, rec_id);
			
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
	
	public JSONObject updateDesignation(String DesignationName, int rec_id){
		JSONObject status = new JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = new Db().connect();
		    stmt = conn.prepareStatement(UPDATE_DESIGNATION);
			stmt.setString(1, DesignationName);
			stmt.setInt(1, rec_id);
			
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
	
	public JSONArray loadDesignations(){
		JSONArray titleArray = new JSONArray();
		JSONObject title = new JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(LOAD_ALL_DESIGNATIONS);
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
	
	public JSONArray loadActiveDesignations(){
		JSONArray titleArray = new JSONArray();
		JSONObject title = new JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(LOAD_ACTIVE_DESIGNATIONS);
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
