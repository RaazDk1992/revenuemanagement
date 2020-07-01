package object;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import db.Db;

public class Organization {
	
	
	private static final String ADD_ORGANIZATION ="INSERT INTO organization(organization_name, isactive) VALUES (?,?)";
	private static final String LOAD_ORGANIZATIONS ="SELECT * FROM organization";

	private static final String LOAD_ACTIVE_ORGANIZATIONS ="SELECT * FROM organization WHERE isactive=?";

	private static final String UPDATE_FISCAL_YEAR ="UPDATE  fiscal_year SET year = ?, isactive = ? WHERE rec_id=? ";
	
	private static final String ENABLE_DISABLE_ORGANIZATIONS = "UPDATE  organization SET isactive = ? WHERE rec_id = ?";

	
	
	public JSONArray loadOrganizations(){
		JSONArray fiscalyears = new JSONArray();
		JSONObject year = new JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		
		
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(LOAD_ORGANIZATIONS);
			result = stmt.executeQuery();
			while(result.next()){
				
				year = new JSONObject();
				year.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				year.put(result.getMetaData().getColumnLabel(2), result.getString(2));
				year.put(result.getMetaData().getColumnLabel(3), result.getString(3));
				
				fiscalyears.put(year);
			}
			
			return fiscalyears;
			
		}catch (Exception e) {
			// TODO: handle exception
			try {
				year.put("ex", e.getStackTrace());
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
		
		
		
		
		return fiscalyears;
	}

	
	
	
	
	
	
	
	public JSONArray loadActiveOrganizations(){
		JSONArray fiscalyears = new JSONArray();
		JSONObject year = new JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(LOAD_ACTIVE_ORGANIZATIONS);
			stmt.setBoolean(1, true);
			result = stmt.executeQuery();
			while(result.next()){
				
				year = new JSONObject();
				year.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				year.put(result.getMetaData().getColumnLabel(2), result.getString(2));
				year.put(result.getMetaData().getColumnLabel(3), result.getString(3));
				
				fiscalyears.put(year);
			}
			
			return fiscalyears;
			
		}catch (Exception e) {
			// TODO: handle exception
			try {
				year.put("ex", e.getStackTrace());
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
		
		
		
		
		return fiscalyears;
	}
	
	
	public JSONObject EDorganization(Boolean status, int id){
		JSONObject obj = new  JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(ENABLE_DISABLE_ORGANIZATIONS);
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
	
	public JSONObject addOrganization( String OrganizationName){
		JSONObject obj = new JSONObject();
		Connection conn;
		PreparedStatement stmt;
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(ADD_ORGANIZATION);
			stmt.setString(1, OrganizationName);
			stmt.setBoolean(2, false);
			int result = stmt.executeUpdate();
			if(result >0){
				obj.put("status", "success");
			} else {
				obj.put("status", "fail");
			}
		}catch (Exception e) {
			// TODO: handle exception
			try {
				obj.put("status", e.getStackTrace());
				e.printStackTrace();
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}
		return obj;
	}


}
