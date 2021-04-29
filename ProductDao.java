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
		String db = "jdbc:mysql://localhost:3306/ssg";
		conn = DriverManager.getConnection(db,"admin","1234");
	}
	public ArrayList<ProductDto> prod_list(HttpServletRequest request) throws Exception
	{
		String category = request.getParameter("category");
		int page;
		if (request.getParameter("page") != null)
			page = 1;
		else
			page = Integer.parseInt(request.getParameter("page"));
		int index = (page-1) * 10;
		String sql = "select * from product where category=? limit "+ index + ", 20";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, category);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<ProductDto> list = new ArrayList<ProductDto>();
		while(rs.next())
		{
			ProductDto pdto = new ProductDto();
			pdto.setProd_category(rs.getString("prod_category"));
			pdto.setProd_dcategory(rs.getString("prod_dcategory"));
			pdto.setProd_expire(rs.getString("prod_expire"));
			pdto.setProd_id(rs.getString("prod_id"));
			pdto.setProd_name(rs.getString("prod_name"));
			pdto.setProd_num(rs.getInt("prod_num"));
			pdto.setProd_origin(rs.getString("prod_num"));
			pdto.setProd_price(rs.getInt("prod_price"));
			pdto.setProd_producer(rs.getString("prod_producer"));
			pdto.setProd_rate(rs.getFloat("prod_rate"));
			pdto.setProd_readnum(rs.getInt("prod_readnum"));
			pdto.setProd_storage(rs.getString("prod_readnum"));
			pdto.setProd_writeday(rs.getString("prod_writeday"));
			
			list.add(pdto);
		}
		return list;
	}
}
