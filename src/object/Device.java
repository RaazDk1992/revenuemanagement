package object;

import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.Connection;
import java.sql.PreparedStatement;

import db.Db;

public class Device {

	
	
			private static final String ADD_DEVICE="INSERT INTO remote_device(address,active)values(?,?)";
			private static final String EDIT_DEVICE = "UPDATE remote_device SET address=? WHERE rec_id=?";
			private static final String TOGGLE_DEVICE= "UPDATE remote_device SET active = !active WHERE rec_id=?";
			private static final String LOAD_DEVICE= "SELECT * FROM remote_device";
			public Device(){
				
			}
			
			public JSONObject addRemoteDevice(String address){
				JSONObject response = null;
				Connection conn;
				PreparedStatement statement;
				try{
					conn = new Db().connect();
					statement = conn.prepareStatement(ADD_DEVICE);
					statement.setString(1, address);
					statement.setBoolean(2, false);					
				}catch (Exception e) {
					// TODO: handle exception
				}
				return response;
			}
			
			public JSONObject editRemoteDevice(String address){
				JSONObject response = null;
				
				return response;
			}
			
			public JSONObject toggleRemoteDevice(String address){
				JSONObject response = null;
				
				return response;
			}
			public JSONArray loadDevices(){
				JSONArray response=null;
				
				return response;
			}
			
		
			
}
