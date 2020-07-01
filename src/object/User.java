package object;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import db.Db;

public class User {
	
	
	private static final String LOAD_USERS = "SELECT users.user_name,users.full_name,organization.organization_name,users.created_on,users.isactive,users.is_super,users.created_by, users.rec_id FROM users,organization WHERE users.org_ref = organization.rec_id";
	private static final String AUTHENTICATE_USER = "SELECT users.user_name,users.isactive,users.is_super,organization.rec_id,organization.rec_id as office_id,organization.organization_name, rasid_range.start_val,rasid_range.ceil_val,rasid_range.current_val,users.rec_id as u_id, designation.designation_np,users.full_name FROM USERS,organization,rasid_range, designation WHERE user_name=? and password =? AND users.isactive=true AND users.org_ref = organization.rec_id and organization.rec_id = rasid_range.org_ref AND designation.rec_id = users.designation_ref";
	private static final String CREATE_USERS = "INSERT INTO USERS(org_ref,user_name,full_name,password,designation_ref,created_by,isactive)VALUES(?,?,?,?,?,?,?)";
	
	private static final String ED_USER = "UPDATE users set isactive=? WHERE user_name=?";
	private static final String ED_USERTYPE = "UPDATE users set is_super = ? WHERE rec_id=? ";
	 HttpServletRequest req;
	public User(HttpServletRequest request){
		this.req = request;
	}
	
	public JSONArray fetchUsers(){
		JSONArray arr = new JSONArray();
		Connection conn = null;
		PreparedStatement stmt =null;
		ResultSet result = null;
		JSONObject user;
		conn = new Db().connect();
		try {
			stmt = conn.prepareStatement(LOAD_USERS);
			result = stmt.executeQuery();
			while(result.next()){
				user = new JSONObject();
				user.put(result.getMetaData().getColumnLabel(1), result.getString(1));
				user.put(result.getMetaData().getColumnLabel(2), result.getString(2));
				user.put(result.getMetaData().getColumnLabel(3), result.getString(3));
				user.put(result.getMetaData().getColumnLabel(4), result.getString(4));
				user.put(result.getMetaData().getColumnLabel(5), result.getString(5));
				user.put(result.getMetaData().getColumnLabel(6), result.getString(6));
				user.put(result.getMetaData().getColumnLabel(7), result.getString(7));
				user.put(result.getMetaData().getColumnLabel(8), result.getString(8));
				arr.put(user);
			}
		} catch (SQLException | JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		
		
		return arr;
	}
	
	public JSONObject EDuser(Boolean status, String  user_name){
		JSONObject obj = new JSONObject();
		Connection conn  = null;
		PreparedStatement stmt = null;
		ResultSet result = null;
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(ED_USER);
			stmt.setBoolean(1, status);
			stmt.setString(2, user_name);
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
	
	
	public JSONObject createUser(int org_ref,String user_name,String full_name,String password,int designation_ref,String created_by){
		JSONObject obj = new JSONObject();
		Connection conn  = null;
		PreparedStatement stmt = null;
		ResultSet result = null;
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(CREATE_USERS);
			stmt.setInt(1, org_ref);
			stmt.setString(2, user_name);
			stmt.setString(3, full_name);
			stmt.setString(4, password);
			stmt.setInt(5, designation_ref);
			stmt.setString(6, created_by);
			stmt.setBoolean(7, false);
			
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
	
	
	
	public JSONObject EDuserType(Boolean status, String  user_name){
		JSONObject obj = new JSONObject();
		Connection conn  = null;
		PreparedStatement stmt = null;
		ResultSet result = null;
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(ED_USERTYPE);
			stmt.setBoolean(1, status);
			stmt.setString(2, user_name);
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
	
	public JSONObject Authenticate(String username, String  password){
		JSONObject obj = new JSONObject();
		
		Connection conn  = null;
		PreparedStatement stmt = null;
		ResultSet result = null;
		try{
			conn = new Db().connect();
			stmt = conn.prepareStatement(AUTHENTICATE_USER);
			stmt.setString(1, username);
			stmt.setString(2, password);
			result = stmt.executeQuery();
			if(result.next()){
				obj.put("status", "success");
				HttpSession session = req.getSession();
				session.setAttribute("uname", result.getString(1));
				session.setAttribute("is_super", result.getString(3));
				session.setAttribute("office_id", result.getInt(4));
				session.setAttribute("start", result.getString(7));
				session.setAttribute("ceil", result.getString(8));
				session.setAttribute("current_rasid", result.getString(9));
				session.setAttribute("u_id", result.getInt(10));
				session.setAttribute("designation", result.getString(11));
				session.setAttribute("full_name", result.getString(12));
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
