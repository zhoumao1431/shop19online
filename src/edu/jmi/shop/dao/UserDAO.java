package edu.jmi.shop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import edu.jmi.shop.bean.Product;
import edu.jmi.shop.bean.User;

public class UserDAO extends BaseDAO {
	
	public boolean insert(User user) {
		try {
			Connection c = this.getConnection();
			String sql = "insert into user(user_name,pwd,register_time,role) values(?,?,?,?)" ;
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1, user.getUserName());
			pst.setString(2, user.getPwd());
			pst.setDate(3, user.getRegisterTime());
			pst.setString(4, user.getRole());
			pst.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	
	public User  Select(String username)
	{
		User u=null;
	try{
		
			Connection c=this.getConnection();
			String sql = "select * from user where user_name=?";
			PreparedStatement pst=c.prepareStatement(sql);
			pst.setString(1,username);
			pst.execute();
			ResultSet rs = pst.executeQuery();	
			while(rs.next()){
				 u=new User();
				u.setPwd(rs.getString("pwd"));
				u.setId(rs.getInt("id"));

			}
			return u;
		}catch(SQLException e)
			{
				e.printStackTrace();
				return u;	
			}
	}	


}
