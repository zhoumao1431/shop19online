package edu.jmi.shop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.jmi.shop.bean.Product;
import edu.jmi.shop.bean.ProductCategory;

public class ProductCategoryDAO extends BaseDAO {
	
	public List<ProductCategory> selectBypage(String s,int pageIndex,final int recCountInPage,int recordCount,int pageCount,int start,int end) {
		List<ProductCategory> list = new ArrayList<ProductCategory>();			 
		try {
			Connection c = this.getConnection();		   
			if (s!=null){
					pageIndex=Integer.parseInt(s);
					}
				
				
				String sqlCount="select count(*) as reccount from product_category";
				PreparedStatement pstCount=c.prepareStatement(sqlCount);
				ResultSet rsCount=pstCount.executeQuery();
				rsCount.next();
				recordCount=rsCount.getInt("reccount");
				
				pageCount=recordCount/recCountInPage+(recordCount%recCountInPage==0?0:1);
				start=(pageIndex-1)*recCountInPage+1;
				end=pageIndex*recCountInPage;
				end=end>recordCount?recordCount:end;
				
				String sql = "select * from product_category "							
						+ "order by product_category.id desc limit "+(start-1)+" , "+ recCountInPage;

				PreparedStatement pst = c.prepareStatement(sql);
				ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				ProductCategory productCategory = new ProductCategory();
				productCategory.setId(rs.getInt("id"));
				productCategory.setName(rs.getString("name"));
				productCategory.setDescription(rs.getString("description"));
				productCategory.setUpdateTime(rs.getDate("update_time"));
				productCategory.setUpdateUserId(rs.getInt("update_user_id"));
				productCategory.setStart(start);
				productCategory.setEnd(end);
				productCategory.setPageCount(pageCount);
				productCategory.setPageIndex(pageIndex);
				productCategory.setRecordCount(recordCount);
				list.add(productCategory);
			}
			return list;

		} catch (SQLException e) {
			e.printStackTrace();
			return list;
		}
		
	}
	
	
	public List<ProductCategory> selectAll() {
		List<ProductCategory> list=new ArrayList<ProductCategory>();
		try {
			Connection c = this.getConnection();
			String sql = " SELECT * FROM product_category order by update_time desc" ;
			PreparedStatement pst = c.prepareStatement(sql);	
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				ProductCategory productCategory=new ProductCategory();
				productCategory.setId(rs.getInt("id"));
				productCategory.setName(rs.getString("name"));
				productCategory.setDescription(rs.getString("description"));
				productCategory.setUpdateTime(rs.getDate("update_time"));
				productCategory.setUpdateUserId(rs.getInt("update_user_id"));			
				list.add(productCategory);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return list;
		}

	}
	
	public List<ProductCategory> selectById(String id) {
		List<ProductCategory> list=new ArrayList<ProductCategory>();
		try {
			Connection c = this.getConnection();
			String sql = " SELECT * FROM product_category where id =? " ;
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1,id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				ProductCategory productCategory=new ProductCategory();
				productCategory.setId(rs.getInt("id"));
				productCategory.setName(rs.getString("name"));
				productCategory.setDescription(rs.getString("description"));
				productCategory.setUpdateTime(rs.getDate("update_time"));
				productCategory.setUpdateUserId(rs.getInt("update_user_id"));			
				list.add(productCategory);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return list;
		}

	}
	
	public List<ProductCategory> selectbyName(String name) {
		List<ProductCategory> list=new ArrayList<ProductCategory>();
		try {
			Connection c = this.getConnection();
			String sql = " select * from product_category where name=?";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setString(1,name);
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				ProductCategory productCategory=new ProductCategory();
				productCategory.setId(rs.getInt("id"));
				productCategory.setName(rs.getString("name"));
				productCategory.setDescription(rs.getString("description"));
				productCategory.setUpdateTime(rs.getDate("update_time"));
				productCategory.setUpdateUserId(rs.getInt("update_user_id"));			
				list.add(productCategory);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return list;
		}

	}
	

	
	public List<ProductCategory> queryTop10(int start, int end) {
		List<ProductCategory> list = new ArrayList<ProductCategory>();
		Connection c=null;
		try {
			
			 c = this.getConnection();
			String sql = "select * from product_category order by update_time desc limit ?,? ";
			PreparedStatement pst = c.prepareStatement(sql);
			pst.setInt(1,start);
			pst.setInt(2,end);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				ProductCategory p = new ProductCategory();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescription(rs.getString("description"));
				p.setUpdateTime(rs.getDate("update_time"));
				p.setUpdateUserId(rs.getInt("update_user_id"));
				list.add(p);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally{
			this.closeConnection(c);
		}
		return list;
	}
	
	public boolean insert(ProductCategory productCategory,Object a)
	{
	try{
			Connection c=this.getConnection();
			String sql = "insert into product_category(name,description,update_time,update_user_id)" +
				     "values(?,?,?,?)";
			PreparedStatement pst=c.prepareStatement(sql);
			pst.setString(1,productCategory.getName());
			pst.setString(2, productCategory.getDescription());
			pst.setDate(3, new Date(System.currentTimeMillis()));
			pst.setObject(4,a);
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
			String sql="delete from product_category where id=?";
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
			String sql="delete from product_category where name=?";
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

	public boolean Update(ProductCategory productCategory,String id)
	{
	try{
		
			Connection c=this.getConnection();
			String sql = "update product_category set name=?,description=?,update_time=?  " +
				     "where id=?";
			PreparedStatement pst=c.prepareStatement(sql);
			pst.setString(1,productCategory.getName());
			pst.setString(2,productCategory.getDescription());
			pst.setDate(3, new Date(System.currentTimeMillis()));	
			pst.setString(4, id);
			pst.execute();
			return true;
		}catch(SQLException e)
			{
				e.printStackTrace();
				return false;	
			}
	}	

	public static void main(String args[]) {
		ProductCategoryDAO productDao=new ProductCategoryDAO();
		List<ProductCategory> list = productDao.selectAll();
		for(ProductCategory productCategory:list) {
			System.out.println(productCategory.getName());
		}
	}
}
