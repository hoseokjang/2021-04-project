package ssg.dao;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import ssg.dto.ProductDto;
public class ProductDao {
	Connection conn;
	public ProductDao() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		String db = "jdbc:mysql://192.168.0.137/ssg";
		conn = DriverManager.getConnection(db,"admin","1234");
	}
	public ArrayList<ProductDto> prod_list(HttpServletRequest request, int index) throws Exception
	{
		String prod_category = request.getParameter("prod_category");
		String sql = "select * from product where prod_category=? limit ?, 20";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, prod_category);
		pstmt.setInt(2, index);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<ProductDto> list = new ArrayList<ProductDto>();
		while(rs.next())
		{
			ProductDto pdto = new ProductDto();
			pdto.setProd_category(rs.getString("prod_category"));
			pdto.setProd_dcategory(rs.getString("prod_dcategory"));
			pdto.setProd_opt1(rs.getString("prod_opt1"));
			pdto.setProd_id(rs.getString("prod_id"));
			pdto.setProd_name(rs.getString("prod_name"));
			pdto.setProd_num(rs.getInt("prod_num"));
			pdto.setProd_opt2(rs.getString("prod_opt2"));
			pdto.setProd_price(rs.getInt("prod_price"));
			pdto.setProd_opt3(rs.getString("prod_opt3"));
			pdto.setProd_rate(rs.getFloat("prod_rate"));
			pdto.setProd_readnum(rs.getInt("prod_readnum"));
			pdto.setProd_opt4(rs.getString("prod_opt4"));
			pdto.setProd_writeday(rs.getString("prod_writeday"));
			
			list.add(pdto);
		}
		return list;
	}
	public ResultSet prod_cate_num(HttpServletRequest request) throws Exception
	{
		String prod_category = request.getParameter("prod_category");
		String sql = "select count(*) as cnt from product where prod_category = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, prod_category);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		return rs;
	}
	public ArrayList<ProductDto> prod_dlist(HttpServletRequest request, int index) throws Exception
	{
		String prod_dcategory = request.getParameter("prod_dcategory");
		String sql = "select * from product where prod_dcategory=? limit ?, 20";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, prod_dcategory);
		pstmt.setInt(2, index);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<ProductDto> list = new ArrayList<ProductDto>();
		while(rs.next())
		{
			ProductDto pdto = new ProductDto();
			pdto.setProd_category(rs.getString("prod_category"));
			pdto.setProd_dcategory(rs.getString("prod_dcategory"));
			pdto.setProd_opt1(rs.getString("prod_opt1"));
			pdto.setProd_id(rs.getString("prod_id"));
			pdto.setProd_name(rs.getString("prod_name"));
			pdto.setProd_num(rs.getInt("prod_num"));
			pdto.setProd_opt2(rs.getString("prod_opt2"));
			pdto.setProd_price(rs.getInt("prod_price"));
			pdto.setProd_opt3(rs.getString("prod_opt3"));
			pdto.setProd_rate(rs.getFloat("prod_rate"));
			pdto.setProd_readnum(rs.getInt("prod_readnum"));
			pdto.setProd_opt4(rs.getString("prod_opt4"));
			pdto.setProd_writeday(rs.getString("prod_writeday"));
			
			list.add(pdto);
		}
		return list;
	}
	public ResultSet prod_dcate_num(HttpServletRequest request) throws Exception
	{
		String prod_dcategory = request.getParameter("prod_dcategory");
		String sql = "select count(*) as cnt from product where prod_dcategory = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, prod_dcategory);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		return rs;
	}
	public ProductDto prod_content(HttpServletRequest request) throws Exception
	{
		String prod_id = request.getParameter("prod_id");
		String sql = "select * from product where prod_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, prod_id);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		ProductDto pdto = new ProductDto();
		pdto.setProd_category(rs.getString("prod_category"));
		pdto.setProd_dcategory(rs.getString("prod_dcategory"));
		pdto.setProd_opt1(rs.getString("prod_opt1"));
		pdto.setProd_id(rs.getString("prod_id"));
		pdto.setProd_name(rs.getString("prod_name"));
		pdto.setProd_num(rs.getInt("prod_num"));
		pdto.setProd_opt2(rs.getString("prod_opt2"));
		pdto.setProd_price(rs.getInt("prod_price"));
		pdto.setProd_opt3(rs.getString("prod_opt3"));
		pdto.setProd_rate(rs.getFloat("prod_rate"));
		pdto.setProd_readnum(rs.getInt("prod_readnum"));
		pdto.setProd_opt4(rs.getString("prod_opt4"));
		pdto.setProd_writeday(rs.getString("prod_writeday"));
		
		return pdto;
	}

}
