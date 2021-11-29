package edu.jmi.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import edu.jmi.shop.bean.*;

public class CommentsDAO extends BaseDAO {

	public List<Comments> selectBypage(String s,int pageIndex,final int recCountInPage,int recordCount,int pageCount,int start,int end) {
		List<Comments> list = new ArrayList<Comments>();			 
		try {
			Connection c = this.getConnection();		   
			if (s!=null){
					pageIndex=Integer.parseInt(s);
					}
				
				
				String sqlCount="select count(*) as reccount from comments";
				PreparedStatement pstCount=c.prepareStatement(sqlCount);
				ResultSet rsCount=pstCount.executeQuery();
				rsCount.next();
				recordCount=rsCount.getInt("reccount");
				
				pageCount=recordCount/recCountInPage+(recordCount%recCountInPage==0?0:1);
				start=(pageIndex-1)*recCountInPage+1;
				end=pageIndex*recCountInPage;
				end=end>recordCount?recordCount:end;
				
				String sql = "select comments.*,product.name as product_name from comments"
						+ " left join product on comments.product_id =product.id"
						+ " limit "+(start-1)+" , "+ recCountInPage;

				PreparedStatement pst = c.prepareStatement(sql);
				ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Comments comments=new Comments();
				comments.setAudit(rs.getInt("audit"));
				comments.setContent(rs.getString("content"));
				comments.setCreateTime(rs.getDate("create_time"));
				comments.setId(rs.getInt("id"));
				comments.setProductName(rs.getString("product_name"));
				comments.setStars(rs.getInt("stars"));
				comments.setUserId(rs.getInt("user_id"));
				comments.setStart(start);
				comments.setEnd(end);
				comments.setPageCount(pageCount);
				comments.setPageIndex(pageIndex);
				comments.setRecordCount(recordCount);
				list.add(comments);
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
				String sql="delete from comments where id=?";
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

		public boolean Update1(String id)
		{
		try{
			
				Connection c=this.getConnection();
				String sql = "update comments set audit= 1"+ " where id=?";
				PreparedStatement pst=c.prepareStatement(sql);
				pst.setString(1, id);
				pst.execute();
				return true;
			}catch(SQLException e)
				{
					e.printStackTrace();
					return false;	
				}
		}	
		public boolean Update2(String id)
		{
		try{
			
				Connection c=this.getConnection();
				String sql = "update comments set audit= 0 "+ " where id=?";
				PreparedStatement pst=c.prepareStatement(sql);
				pst.setString(1, id);
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

	public List<Comments> selectbyName(String name) {
		List<Comments> list=new ArrayList<Comments>();
		try {
				Connection c = this.getConnection();		   				
				String sql = " select comments.*,product.*  from comments,product where name = ? "
						+" and comments.product_id =product.id ";
				PreparedStatement pst = c.prepareStatement(sql);
				pst.setString(1,name);
				ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Comments comments= new Comments();
				comments.setAudit(rs.getInt("audit"));
				comments.setContent(rs.getString("content"));
				comments.setCreateTime(rs.getDate("create_time"));
				comments.setId(rs.getInt("id"));
				comments.setProductId(rs.getInt("product_id"));
				comments.setStars(rs.getInt("stars"));
				comments.setUserId(rs.getInt("user_id"));
				comments.setProductName(rs.getString("name"));
				list.add(comments);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return list;
		}

	}
	
	public static void main(String args[]) {
		CommentsDAO productDao=new CommentsDAO();
		List<Product> list = productDao.selectByCategoryId(1, 8);
		for(Product product:list) {
			System.out.println(product.getName());
		}
	}

}
