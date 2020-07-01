package object;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import db.Db;

public class Address {
	
	private static final String LOAD_ADRESS ="SELECT * FROM address";
	
	public Address(){
		
	}
	
	
	public JSONArray loadAdressArray(){
		JSONArray addressArr = new JSONArray();
		JSONObject address = new JSONObject();
		java.sql.Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(LOAD_ADRESS);
			result = stmt.executeQuery();
			while(result.next()){
				
				address = new JSONObject();
				address.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				address.put(result.getMetaData().getColumnLabel(2), result.getString(2));
				address.put(result.getMetaData().getColumnLabel(3), result.getString(3));
				
				addressArr.put(address);
			}
			
			return addressArr;
			
		}catch (Exception e) {
			// TODO: handle exception
			try {
				address.put("ex", e.getStackTrace());
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
		
		
		
		
		return addressArr;
	}
}
