package edu.jmi.shop.dao;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.jmi.shop.bean.Order;
import edu.jmi.shop.bean.Product;


public class OrderDAO extends BaseDAO{
	public boolean insert(Order order){
		try{
		Connection c=this.getConnection();
		String sql="insert into order_info(user_id,product_id,quantity,total,create_time,payment,contact_id) values(?,?,?,?,?,?,?)";
		PreparedStatement pst=c.prepareStatement(sql);
		pst.setInt(1, order.getUserid());
		pst.setInt(2, order.getProductid());
		pst.setInt(3, order.getQuantity());
		pst.setDouble(4, order.getTotal());
		pst.setDate(5, order.getCreateTime());
		pst.setInt(6, order.getPayment());
		pst.setInt(7, order.getContactId());
		pst.execute();
		return true;
	}catch(SQLException e){
		e.printStackTrace();
		return false;
	}
}
	public static void main(String[] args) {
		OrderDAO orderDAO=new OrderDAO();
		Order order=new Order();
		order.setProductid(933);
		order.setCreateTime(new java.sql.Date(System.currentTimeMillis()));
		order.setId(43);
		order.setPayment(1);
		order.setQuantity(10);
		order.setTotal(395.3);
		order.setUserid(123526);
	}

	}
