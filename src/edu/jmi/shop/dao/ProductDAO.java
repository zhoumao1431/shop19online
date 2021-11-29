package edu.jmi.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import edu.jmi.shop.bean.*;

public class ProductDAO extends BaseDAO {

	public List<Product> selectBypage(String s,int pageIndex,final int recCountInPage,int recordCount,int pageCount,int start,int end) {
		List<Product> list = new ArrayList<Product>();			 
		try {
			Connection c = this.getConnection();		   
			if (s!=null){
					pageIndex=Integer.parseInt(s);
					}
				
				
				String sqlCount="select count(*) as reccount from product";
				PreparedStatement pstCount=c.prepareStatement(sqlCount);
				ResultSet rsCount=pstCount.executeQuery();
				rsCount.next();
				recordCount=rsCount.getInt("reccount");
				
				pageCount=recordCount/recCountInPage+(recordCount%recCountInPage==0?0:1);
				start=(pageIndex-1)*recCountInPage+1;
				end=pageIndex*recCountInPage;
				end=end>recordCount?recordCount:end;
				
				String sql = "select product.*,product_category.name as category_name,user.user_name from product"
						+ " left join product_category on product.category_id =product_category.id   "
						+ "left join user ON  product.update_user_id = user.id   "
						+ "order by product.id desc limit "+(start-1)+" , "+ recCountInPage;

				PreparedStatement pst = c.prepareStatement(sql);
				ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setCategoryId(rs.getInt("category_id"));		
				product.setGeneralExplain(rs.getString("general_explain"));
				product.setExplain(rs.getString("explain"));
				product.setPrice(rs.getInt("price"));
				product.setShopPrice(rs.getInt("shop_price"));
				product.setQuantity(rs.getInt("quantity"));
				product.setHot(rs.getInt("hot"));
				product.setProductStatus(rs.getInt("product_status"));
				product.setDefaultImg(rs.getString("default_img"));
				product.setUpdateTime(rs.getDate("update_time"));
				product.setUpdateUserId(rs.getInt("update_user_id"));
				product.setUpdateUserName(rs.getString("user_name"));
				product.setStart(start);
				product.setEnd(end);
				product.setPageCount(pageCount);
				product.setPageIndex(pageIndex);
				product.setRecordCount(recordCount);
				list.add(product);
			}
			return list;

		} catch (SQLException e) {
			e.printStackTrace();
			return list;
		}
		
	}
	

	public List<Product> selectByCategoryId(int categoryId, int pageSize) {
		List<Product> list = new ArrayList<Product>();
		try {
			Connection c = this.getConnection();
			String sql = "select  * from product "+
                     " where category_id=? order by product.id desc limit 1,?";
				
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setInt(1, categoryId);
			pst.setInt(2, pageSize);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setCategoryId(rs.getInt("category_id"));
				
				product.setGeneralExplain(rs.getString("general_explain"));
				product.setExplain(rs.getString("explain"));
				product.setPrice(rs.getInt("price"));
				product.setShopPrice(rs.getInt("shop_price"));
				product.setQuantity(rs.getInt("quantity"));
				product.setHot(rs.getInt("hot"));
				product.setProductStatus(rs.getInt("product_status"));
				product.setDefaultImg(rs.getString("default_img"));
				product.setUpdateTime(rs.getDate("update_time"));
				product.setUpdateUserId(rs.getInt("update_user_id"));
				
				list.add(product);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return list;
		}
		
	}
		public boolean insert(Product p,Object a)
		{
		try{
				Connection c=this.getConnection();
				String sql = "insert into product(name,category_id,price,shop_price,quantity,product_status,hot,general_explain,update_time,update_user_id)" +
					     "values(?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement pst=c.prepareStatement(sql);
				pst.setString(1,p.getName());
				pst.setInt(2,p.getCategoryId());
				pst.setInt(3,p.getPrice());
				pst.setInt(4,p.getShopPrice());
				pst.setInt(5,p.getQuantity());
				pst.setInt(6,p.getProductStatus());
				pst.setInt(7,p.getHot());
				pst.setString(8,p.getGeneralExplain());
				pst.setDate(9,p.getUpdateTime());
				pst.setObject(10,a);
				pst.execute();
				return true;
			}catch(SQLException e)
				{
					e.printStackTrace();
					return false;	
				}
		}	

		
		public boolean delete(String id)
		{
			try{
				Connection c=this.getConnection();
				String sql="delete from product where id=?";
				PreparedStatement pst = c.prepareStatement(sql);
				pst.setString(1,id);
				pst.execute();
				return true;
			}catch(SQLException e)
				{
					e.printStackTrace();
					return false;	
				}
		}	
		
		public boolean deletebyName(String name)
		{
			try{
				Connection c=this.getConnection();
				String sql="delete from product where name=?";
				PreparedStatement pst = c.prepareStatement(sql);
				pst.setString(1,name);
				pst.execute();
				return true;
			}catch(SQLException e)
				{
					e.printStackTrace();
					return false;	
				}
		}	

		public boolean Update(Product product,String id)
		{
		try{
			
				Connection c=this.getConnection();
				String sql = "update product set name=?,category_id=?,price=?,shop_price=?,quantity=?,product_status=?,hot=?,general_explain=?,update_time=?  " +
					     "where id=?";
				PreparedStatement pst=c.prepareStatement(sql);
				pst.setString(1,product.getName());
				pst.setInt(2,product.getCategoryId());
				pst.setInt(3,product.getPrice());
				pst.setInt(4,product.getShopPrice());
				pst.setInt(5,product.getQuantity());
				pst.setInt(6,product.getProductStatus());
				pst.setInt(7,product.getHot());
				pst.setString(8,product.getGeneralExplain());
				pst.setDate(9, new Date(System.currentTimeMillis()));	
				pst.setString(10, id);
				pst.execute();
				return true;
			}catch(SQLException e)
				{
					e.printStackTrace();
					return false;	
				}
		}	
		
	public  List<Product> selectById(String id) {
			List<Product> list = new ArrayList<Product>();
		try{
			Connection c=this.getConnection();
			String sql="select * from product where id=?";
			PreparedStatement pst=c.prepareStatement(sql);
			pst.setString(1,id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
			Product product = new Product();
			product.setName(rs.getString("name"));
			product.setCategoryId(rs.getInt("category_id"));	
			product.setGeneralExplain(rs.getString("general_explain"));
			product.setPrice(rs.getInt("price"));
			product.setShopPrice(rs.getInt("shop_price"));
			product.setQuantity(rs.getInt("quantity"));
			product.setHot(rs.getInt("hot"));
			product.setProductStatus(rs.getInt("product_status"));
			list.add(product);
			}
		return list;
		}catch(SQLException e){
			e.printStackTrace();
			return list;
			}
		}

	public List<Product> selectbyName(String name) {
		List<Product> list=new ArrayList<Product>();
		try {
			Connection c = this.getConnection();
			String sql = " select * from product where name=? ";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1,name);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setCategoryId(rs.getInt("category_id"));		
				product.setGeneralExplain(rs.getString("general_explain"));
				product.setExplain(rs.getString("explain"));
				product.setPrice(rs.getInt("price"));
				product.setShopPrice(rs.getInt("shop_price"));
				product.setQuantity(rs.getInt("quantity"));
				product.setHot(rs.getInt("hot"));
				product.setProductStatus(rs.getInt("product_status"));
				product.setDefaultImg(rs.getString("default_img"));
				product.setUpdateTime(rs.getDate("update_time"));
				product.setUpdateUserId(rs.getInt("update_user_id"));
				list.add(product);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return list;
		}

	}
	
	public static void main(String args[]) {
		ProductDAO productDao=new ProductDAO();
		List<Product> list = productDao.selectByCategoryId(1, 8);
		for(Product product:list) {
			System.out.println(product.getName());
		}
	}

}
