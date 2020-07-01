package object;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import db.Db;

public class Rasid {
	
	private static final String NEW_RASID = "INSERT INTO RASID_RANGE(org_ref,start_val,ceil_val,current_val,isactive) VALUES(?,?,?,?,?)";
	private static final String LOAD_RASID_LIST = "SELECT organization.organization_name,rasid_range.start_val,rasid_range.ceil_val,rasid_range.current_val,rasid_range.isactive FROM organization,rasid_range WHERE organization.rec_id = rasid_range.org_ref ";
	private static final String ED_RASID = "UPDATE rasid_range SET isactive = ? WHERE rec_id=?";
	
	
	public Rasid(){
		
	}
	
	public JSONObject addRasid(int org_ref, int start_val, int ceil_val, int current_val){
		JSONObject status = new JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = new Db().connect();
		    stmt = conn.prepareStatement(NEW_RASID);
			stmt.setInt(1, org_ref);
			stmt.setInt(2, start_val);
			stmt.setInt(3, ceil_val);
			stmt.setInt(4, current_val);
			stmt.setBoolean(5, true);
			
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

	
	public JSONArray loadRasids(){
		JSONArray titleArray = new JSONArray();
		JSONObject title = new JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(LOAD_RASID_LIST);
			result = stmt.executeQuery();
			while(result.next()){
				
				title = new JSONObject();
				title.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				title.put(result.getMetaData().getColumnLabel(2), result.getString(2));
				title.put(result.getMetaData().getColumnLabel(3), result.getString(3));
				title.put(result.getMetaData().getColumnLabel(4), result.getString(4));
				title.put(result.getMetaData().getColumnLabel(5), result.getString(5));
				
				
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
	
	public JSONObject EDRasid(Boolean status, int  rec_id){
		JSONObject obj = new JSONObject();
		Connection conn  = null;
		PreparedStatement stmt = null;
		ResultSet result = null;
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(ED_RASID);
			stmt.setBoolean(1, status);
			stmt.setInt(2, rec_id);
			int i = stmt.executeUpdate();
			if(i>0){
				obj.put("status", "success");
			} else {
				obj.put("status","fail");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			
		}
		return obj;
	}

}
