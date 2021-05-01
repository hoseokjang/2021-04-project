<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	#prod_category
	{
		padding-top:20px;padding-bottom:20px;margin:20px;
		border-bottom:2px solid black;
	}
	#category_prod_number
	{
		opacity:0.8;
	}
	#category_prod_number #prod_number
	{
		color:red;
	}
	#category_left
	{
		display:inline-block;width:200px;
		padding-top:20px;padding-bottom:20px;padding-left:3px;
		border-bottom:1px solid grey;
	}
	#prod_list
	{
		display:inline-block;width:950px;
		
	}
	#prod_img{padding-bottom:10px;}
	#list li{display:inline-block;float:left;list-style:none;padding:20px;}
	#img{width:200px;height:250px;}
	#info{text-align:left;}
</style>
<c:import url="ssgtop.jsp"/>
<%@ page import="java.sql.*" %>
<%@ page import="ssg.dao.ProductDao" %>
<%@ page import="ssg.dto.ProductDto" %>
<%@ page import="java.util.ArrayList" %>
<%
	int ppage;
	if (request.getParameter("ppage")==null)
		ppage = 1;	
	else
		ppage = Integer.parseInt(request.getParameter("ppage"));	
	int index = (ppage-1) * 10;
	int pstart=ppage/10;
	if (ppage%10==0)
		pstart--;
	pstart = Integer.parseInt(pstart+"1");
	int pend= pstart+9;
	
	ProductDao pdao = new ProductDao();
	ArrayList<ProductDto> plist = pdao.prod_list(request,index);
	ResultSet rs = pdao.prod_cate_num(request);
	ResultSet rs2 = pdao.prod_category_get(request);
	// ResultSet rs3 = pdao.prod_dcategory_get(request); // dcategory에서 들어갈 때 sql문 empty set이라 확인해봐야 함
	pageContext.setAttribute("plist", plist);
%>
<!-- 문서 시작 -->
<div id="third_prod_list" align="center" style="width:1500px"> <!-- 전체 문서의 시작 -->
<div align="center" id="prod_category" style="width:1200px;"> <!-- 큰 카테고리 -->
	<h2><%=rs2.getString("prod_category") %></h2>
	<div id="category_prod_number" align="right"><span id="prod_number"><%=rs.getInt("cnt") %></span>개의 상품이 있습니다.</div>
</div> <!-- 큰 카테고리 끝 -->

<div id="category_left" align="left"> <!-- 왼쪽 div 시작 --> <!-- inline-block을 이용해서 한줄에 div가 2개가 나오도록 해보기 -->
	<div align="left"><h4><%=rs2.getString("prod_category") %></h4></div> <!-- 상품의 상세 카테고리 -->
	<div id="dcategory">
		<a>삼겹살</a><p> <!-- a태그 스타일 해야됨 -->
		<a>목살</a><p>
		<a>갈비</a><p>
		<a>기타</a><p>	</div>
	<div id="price_search" align="left" style="border-top:1px solid black;"> <!-- 가격 별로 보여주기 -->
		<div align="left"><h4>가격</h4></div>
		<div id="price_price_search_list">
			<a href="prod_list.jsp?prod_category=<%=rs2.getString("prod_category") %>&min_prod_price=0&max_prod_price=10000">~1만원</a><p>
			<a href="prod_list.jsp?prod_category=<%=rs2.getString("prod_category") %>&min_prod_price=10000&max_prod_price=20000">1만원~2만원</a><p>
			<a href="prod_list.jsp?prod_category=<%=rs2.getString("prod_category") %>&min_prod_price=20000&max_prod_price=50000">2만원~5만원</a><p>
			<a href="prod_list.jsp?prod_category=<%=rs2.getString("prod_category") %>&min_prod_price=50000&max_prod_price=250000">5만원~25만원</a>
		</div>
	</div>
</div> <!-- 왼쪽 div끝 -->

<div id="prod_list"> <!-- 오른쪽 div 시작 -->
	<div align="center" id="prod_orderby"> <!-- 상품 order by 시작 -->
		<a href="prod_list.jsp?prod_category=<%=rs2.getString("prod_category") %>&ord=1">평점 순</a>
		<a href="prod_list.jsp?prod_category=<%=rs2.getString("prod_category") %>&ord=2">낮은 가격 순</a>
		<a href="prod_list.jsp?prod_category=<%=rs2.getString("prod_category") %>&ord=3">높은 가격 순</a>
	</div> <!-- 상품 order by 끝 -->
	<div id="list" style="width:1200px;"> <!-- 상품 목록 시작 -->
		<ul> <!-- while문 한줄에 4개 총 5줄 -->
			<c:forEach var="pdto" items="${plist }">
			<li>
				<div id="prod_img"><a href="prod_readnum.jsp?prod_id=${pdto.prod_id }"><img src="상품사진/${pdto.prod_id }_i1_290.jpg" id="img"></a></div>
				<div id="info">
					<div> 이마트몰</div>
					<div> #No Brand</div>
					<div style="width:200px;height:60px;overflow:hidden;font-size:14px;"> <a href="prod_readnum.jsp?prod_id=${pdto.prod_id }">${pdto.prod_name }</a> </div>
					<div> <fmt:formatNumber value="${pdto.prod_price }"/>원 </div>
					<div> 평점 : ${pdto.prod_rate }</div>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div> <!-- 상품 목록 끝 -->
	<div>&nbsp;</div>
</div> <!-- 오른쪽 div 끝 -->

<div> <!-- 페이징 처리 시작 -->
	<div>
		<a href="">1</a>
		<a href="">2</a>
		<a href="">3</a>
		<a href="">4</a>
		<a href="">5</a>
		<a href="">6</a>
		<a href="">7</a>
		<a href="">8</a>
	</div>
</div> <!-- 페이징 처리 끝 -->
</div> <!-- 전체 문서의 끝 -->
<c:import url="ssgbottom.jsp"/>