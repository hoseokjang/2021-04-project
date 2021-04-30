<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String chk=request.getParameter("chk");
	session.setAttribute("chk", chk);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="ssgmain.css">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function sinsun_over()
	{
		document.getElementById("sinsun_tab").style.display="";
	}
	function sinsun_out()
	{
		document.getElementById("sinsun_tab").style.display="none";
	}
	function gagong_over()
	{
		document.getElementById("gagong_tab").style.display="";
	}
	function gagong_out()
	{
		document.getElementById("gagong_tab").style.display="none";
	}
	 $(function()
		 {
			setInterval(function()
			{
	          $("#sil_ul").animate(
			  {
	              marginTop:"-40px" 
			  },1000,function()
			  {
				 $("#sil_ul").css("marginTop","0px");
				 $(".sil_li").eq(0).insertAfter($(".sil_li").eq(7));
		 	  }); 
			},2000);
		 }); 
	 $(function()
		{
			$(window).scroll(function()
			{
				var top=$(window).scrollTop();
				$("#sideview").css("top",top);
			});
			$("#sideviewtop").click(function()
			{
				$(window).scrollTop(0);
			});
		});
</script>
</head>
<body>
	<div id="first">	
		<div id="logo" onclick="location='../main/ssgindex.jsp'"><img src="" width="60"></div>
		<form method="post" action="">
		<div id="searchbox">
		<input type="text" id="searchbar" placeholder="검색어를 입력하세요">
		<button type="submit" id="searchbutton"><img src="../imgdata/search.png" width="20" height="20"></button>
		</div>
		</form>
		<div id="silsigan">
			<ul id="sil_ul">
				<li onclick="location=''" class="sil_li">1.사과</li>
				<li onclick="location=''" class="sil_li">2.딸기</li>
				<li onclick="location=''" class="sil_li">3.배</li>
				<li onclick="location=''" class="sil_li">4.라면</li>
				<li onclick="location=''" class="sil_li">5.아이스크림</li>
				<li onclick="location=''" class="sil_li">6.초콜릿</li>
				<li onclick="location=''" class="sil_li">7.과자</li>
				<li onclick="location=''" class="sil_li">8.빵</li>
			</ul>
		</div>
		<div id="util_box">
			<ul id="util_menu">
		  	<li onclick="location=''"><img src="../imgdata/basket.png" width="60"></li>
		  	<li onclick="location=''"><img src="../imgdata/delibery.png" width="60"></li>
		  	<c:if test="${chk==null||chk==0}"><!-- 비회원주문이나 정보없는 상태 로그인으로 -->
		  	<li onclick="location=''"><img src="../imgdata/myorder.png" width="60"></li>
		  	</c:if>
		  	<c:if test="${chk==1||chk==2}"><!-- 로그인상태 마이오더로 이동 -->
		  	<li onclick="location=''"><img src="../imgdata/myorder.png" width="60"></li>
		  	</c:if>
			</ul>
		</div>	
		<div id="user_box">
	  		<c:if test="${chk==null}"><!-- 정보없는상태 -->
	  		<ul id="user_menu">
		  	<li onclick="location=''" style="border-right:1px dotted;">로그인 &nbsp;</li>
		  	<li onclick="location=''" style="border-right:1px dotted;">회원가입 &nbsp;</li>
		  	<li onclick="location=''">고객센터</li>	
			</ul>
			</c:if>
			<c:if test="${chk==0}"><!-- 비회원주문상태-->
	  		<ul id="user_menu">
		  	<li onclick="location=''" style="border-right:1px dotted;">님(비회원) &nbsp;</li>
		  	<li onclick="location=''" style="border-right:1px dotted;">회원가입 &nbsp;</li>
		  	<li onclick="location=''" style="border-right:1px dotted;">로그아웃 &nbsp;</li>
		  	<li onclick="location=''">고객센터</li>
		  	</c:if>
			<c:if test="${chk==1}"><!-- 회원로그인상태-->
	  		<ul id="user_menu">
		  	<li onclick="location=''" style="border-right:1px dotted;">님 환영합니다 &nbsp;</li>
		  	<li onclick="location=''" style="border-right:1px dotted;">로그아웃 &nbsp;</li>
		  	<li onclick="location=''">고객센터</li>	
			</ul>
			</c:if>
			<c:if test="${chk==2}"><!-- 관리자모드-->
	  		<ul id="user_menu">
		  	<li onclick="location=''">관리자모드입니다</li>
			</ul>
			</c:if>
		</div>
	</div>
	<div id="second_line">
		<div id="second">
			<div id="main_li"><img src="../imgdata/main_li.png" height="20"></div>
			<div id="tab_list">
				<ul class="tab_list_sub">
					<li class="tab_button" onmouseover="sinsun_over()" onmouseout="sinsun_out()">신선식품 &nbsp;&nbsp;
						<div id="sinsun_tab" style="display:none;">
								<div>
									<a href="prod_list.jsp?prod_category=fruit">과일</a><p>
									<a href="prod_dlist.jsp?prod_dcategory=melon">수박/멜론/참외/토마토</a><br>
									<a href="">포도/자두/복숭아</a><br>
									<a href="">바나나/파인애플</a><br>
									오렌지/자몽/레몬<br>
									사과/배<br>
									딸기/키위/블루베리<br>
									감귤/만감류<br>
									감/곶감<br>
									망고/열대과일<br>
									체리/석류/아보카도<br>
									건과일/분말<br>
									냉동/간편과일<br>
									기타 과일<br>
									과일세트<br>
								</div>
								<div>
									채소<p>
									두부/콩나물/숙주나물<br>
									고구마/감자<br>
									양파/마늘/파/생강<br>
									오이/가지/호박/옥수수<br>
									상추/깻잎/쌈채소<br>
									고추/피망/파프리카<br>
									시금치/부추/나물<br>
									양배추/양상추/브로콜리<br>
									샐러드/어린잎채소<br>
									당근/우엉/연근/마<br>
									버섯<br>
									배추/무/김장채소<br>
									아스파라거스/허브류/기타<br>
									인삼/더덕/약선재료<br>
									간편 채소<br>
									채소세트<br>
									채소세트<br>
									채소세트<br>
									채소세트<br>
									채소세트<br>
									채소세트<br>
									채소세트<br>
								</div>
						</div>
					</li>
					<li class="tab_button" onmouseover="gagong_over()" onmouseout="gagong_out()">가공식품 &nbsp;&nbsp;
						<div id="gagong_tab" style="display:none;">
							<ul>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
								<li>과자</li><li>아이스크림</li><li>초콜릿</li><li>즉석밥</li><li>라면</li><li>빵</li><p>
							</ul>
						</div>
					</li>
					<li class="tab_button" onclick="location=''">베스트  &nbsp;&nbsp;</li>
					<li class="tab_button" onclick="location='../gongji/gonglist.jsp'">공지사항  &nbsp;&nbsp;</li>
					<li class="tab_button" onclick="location=''">이벤트</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="sideview_box">
		<div id="sideview">
			사이드에 항상 떠야할부분 박스를 만들어야한다
			<input type="button" id="sideviewtop" value="top">
		</div>
	</div>