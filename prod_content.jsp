<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#third_pord div{align:center;}
#table{text-align:center;}
#prod_info{text-align:left;}
#main_price{display:block;text-align:right;}
#buy a
{
	display:table-cell;
	color:white;
	text-weight:bold;
	text-decoration:none;
	padding-left:15px;padding-right:15px;padding-top:5px;padding-bottom:5px;
	width:200px;height:40px;
	text-align:center;
	vertical-align:middle;
}
#buy #pocket{background:black;}
#buy #buy_now{background:red;}
#third_pord ul li{list-style:none;float:left;}
#tab{text-align:center;width:1000px;margin-left:auto;margin-right:auto;}
#tab li{display:inline-block;text-align:center;margin-top:50px;}
#tab a
{
	color:black;
	border:1px solid black;
	text-weight:bold;
	text-decoration:none;
	padding-left:100px;padding-right:100px;padding-top:15px;padding-bottom:15px;
	width:600px;height:100px;
	text-align:center;
	vertical-align:middle;
}
#detail td
{
	height:60px;padding-left:10px;
}
#truck td{border-bottom:1px solid grey;}
#truck_desc li{padding:3px;list-style:circle;float:none;}
#prod_change td{border-bottom:1px solid grey;padding-top:10px;padding-bottom:10px;}
#prod_change_info{font-weight:bold;}
</style>
<c:import url="ssgtop.jsp"/>
<div id="third_prod" width="1500" align="center">
<table width="1200" align="center" id="prod_info">
	<tr>
		<td rowspan="8" style="padding-right:50px;vertical-align:top;"> <img src="1.jpg" width="600" height="500"> </td>
		<td width="500" style="padding-bottom:10px;">
			<span style="background:#FFE400;padding:5px;font-weight:bold">이마트몰</span> #No Brand
		</td>
	</tr>
	<tr height="50">
		<td style="border-top:1px solid grey;border-collapse:collapse;padding-bottom:10px;">
		<h2>노브랜드 삼겹살</h2>
		원산지 : 상세설명참조</td>
	</tr>
	<tr>
		<td style="border-top:1px solid grey;border-collapse:collapse;height:70px;padding-bottom:10px;">
		<h2>10,000원</h2>
		(최소 수량 : 1개  | 최대 수량 : 10개) <!-- 최대 수량 10개로 변경 -->
		</td>
	</tr>
	<tr>
		<td style="border-top:1px solid grey;border-collapse:collapse;padding-top:10px;padding-bottom:10px;">
			고객리뷰&nbsp;&nbsp;&nbsp; <span style="font-weight:bold;font-size:25px;">5.0</span>
		</td>
	</tr>
	<tr>
		<td style="border-top:1px solid grey;border-collapse:collapse;padding-top:8px;padding-bottom:8px;"> <img src="2.jpg"> </td>
	</tr>
	<tr> <!-- -/+ 동작 (개수/가격/총 금액 변경) -->
		<td style="height:100px;padding:10px;border-top:1px solid grey;background:#E6E6E6;border-collapse:collapse;">
			노브랜드 삼겹살 <p>
			- 1 + <span id="main_price">10,000원&nbsp;&nbsp;&nbsp;</span>
		</td>
	</tr>
	<tr>
		<td style="text-align:right;font-weight:bold;font-size:30px;"> 합계 <span style="color:red;">10,000</span>원 </td>
	</tr>
	<tr align="center">
		<td>
			<ul id="buy">
				<li style="margin-bottom:20px;"><a href="" id="pocket">장바구니</a></li>
				<li><a href="" id="buy_now">바로구매</a></li>
			</ul>
		</td>
	</tr>
</table>

<div style="border-top:1px solid grey;padding-bottom:50px;">
	<ul id="tab">
		<li> <a href="">상품 상세 정보</a> </li>
		<li> <a href="">배송/반품/교환 안내</a> </li>
		<li> <a href="">상품 필수 정보</a> </li>
	</ul>
</div>
<!-- 상품정보 Dao로 받아서 변경 -->
<div align="left" style="width:1000px;border-top:2px solid grey;border-bottom:2px solid grey;margin-top:60px;padding-top:20px;"><h3>상품 상세 정보</h3></div>
<div align="left" style="width:1000px;border-bottom:2px solid grey;padding-top:20px;padding-bottom:20px;">상품번호 : 0000</div>
<div style="padding-top:20px;"><img src="delievery.png" width="1000"></div>
<div style="font-weight:bold;font-size:23px;padding-top:30px;">
	<div style="padding-top:20px;">※ 본 상품 이미지는 대표 상품 이미지입니다.</div><p>
	<div>■ 상품명 : 한우 장조림용</div><p>
	<div>■ 판매단위 : 100g</div><p>
	<div>■ 원산지 : 국내산</div><p>
	<div style="padding-top:30px;padding-bottom:100px;"> <img src="1.jpg" width="600" height="600"></div>
</div>
<div align="left" style="width:1000px;padding-top:50px;padding-bottom:10px;font-weight:bold;font-size:20px;"><h3>상품 필수 정보</h3></div>
<table width="1000" id="detail" border="1" style="border:2px solid grey;border-collapse:collapse;" id="table">
	<tr>
		<td width="300"> 필수사항1 </td>
		<td width="700"> 생산자 </td>
	</tr>
	<tr>
		<td> 필수사항2 </td>
		<td> 유통기한 </td>
	</tr>
	<tr>
		<td> 필수사항3 </td>
		<td> 원산지 </td>
	</tr>
	<tr>
		<td> 필수사항4 </td>
		<td> 보관방법 </td>
	</tr>
	<tr>
		<td> 품목 또는 명칭 </td>
		<td> 상세 설명 참조 </td>
	</tr>
	<tr>
		<td> 식품등의표시.광고에관한법률에 따른 소비자안전을 위한 주의사항 </td>
		<td> 부정,불량식품 신고는 국번없이 1399</td>
	</tr>
	<tr>
		<td> 수입식품안전관리특별법에 따른 수입신고 필함 여부 </td>
		<td> 해당사항 없음 </td>
	</tr>
</table>

<div align="left" style="width:1000px;border-bottom:2px solid grey;padding-top:70px;padding-bottom:20px;font-weight:bold;font-size:25px;">고객리뷰</div>
<div><img src="review.jpg" width="1000" style="padding-bottom:40px;"></div>
<table border=1 width="1000" height="130" style="border:1px solid grey;border-collapse:collapse;" id="table">
	<tr align="center">
		<td><div style="font-size:20px;"> 구매고객 총 평점 : <span style="font-weight:bold;font-size:50px;">4.8</span> / 5.0 </div></td>
	</tr>
</table>
<div style="padding-top:20px;font-size:12px;">※ 리뷰 등록, 수정, 삭제 및 상세 내용은 [MY SSG > 활동관리 > 리뷰 관리]에서 확인하실 수 있습니다.</div>

<div align="left" style="width:1000px;padding-top:70px;padding-bottom:20px;font-weight:bold;font-size:25px;border-bottom:2px solid grey;">배송안내</div>

<table id="truck" width="1000" style="font-size:16px;">
	<tr>
		<td width="150"> <img src="truck.png"> </td>
		<td width="600"> 쓱배송 이마트 <p>
			  원하는 시간에 원하는 장소로 배송 됩니다. 
		</td>
		<td width="250"> 4만원 이상 무료배송 <p>
			 4만원 미만 배송비 3000원
		</td>
	</tr>
	<tr>
		<td> <img src="truck.png"> </td>
		<td> 쓱배송 이마트 <p>
			  원하는 시간에 원하는 장소로 배송 됩니다. 
		</td>
		<td> 4만원 이상 무료배송 <p>
			 4만원 미만 배송비 3000원
		</td>
	</tr>
	<tr>
		<td> <img src="truck.png"> </td>
		<td> 쓱배송 이마트 <p>
			  원하는 시간에 원하는 장소로 배송 됩니다. 
		</td>
		<td> 4만원 이상 무료배송 <p>
			 4만원 미만 배송비 3000원
		</td>
	</tr>
	<tr>
		<td> <img src="truck.png"> </td>
		<td> 쓱배송 이마트 <p>
			  원하는 시간에 원하는 장소로 배송 됩니다. 
		</td>
		<td> 4만원 이상 무료배송 <p>
			 4만원 미만 배송비 3000원
		</td>
	</tr>
	<tr>
		<td> <img src="truck.png"> </td>
		<td> 쓱배송 이마트 <p>
			  원하는 시간에 원하는 장소로 배송 됩니다. <p>
		</td>
		<td> 4만원 이상 무료배송 <p>
			 4만원 미만 배송비 3000원 <p>
		</td>
	</tr>
	<tr>
		<td> <img src="truck.png"> </td>
		<td> 쓱배송 이마트 <p>
			  원하는 시간에 원하는 장소로 배송 됩니다. <p>
		</td>
		<td> 4만원 이상 무료배송 <p>
			 4만원 미만 배송비 3000원 <p>
		</td>
	</tr>
</table>
<div id="truck_desc" style="width:1000px;text-align:left;padding-top:10px;font-size:13px;height:150px;">
<ul>
	<li>무료배송 및 배송비 할인은 동일한 배송딱지가 붙은 상품들의 합계금액을 기준으로 적용됩니다.(업체배송/일부 별도 배송 제외)</li>
	<li>택배 배송기일은 휴일 포함여부 및 상품 재고상황, 택배사 사정에 의해 지연될 수 있습니다.</li>
	<li>상품별/권역별로 가능한 배송유형이 다릅니다. 상품상세 상단에 표기된 배송정보에서 확인해주세요.</li>
	<li>[명절배송] 수취거부나 장기간 부재로 배송이 불가능한 상품은 주문 고객 주소로 반송 됩니다.</li>
	<li>[명절배송] 신선세트(정육,청과,선어등)의 경우 수취인 부재 또는 배송지 정보 오류로 인해 반송될 경우 교환/환불이 제한됩니다.</li>
	<li>[명절배송] 냉장/냉동 상품은 희망발송일 지정이 불가하며, 특정일로부터 순차발송 됩니다. 자세한 내용은 주문서에서 확인해 주시기 바랍니다.</li>
	<li>[다중배송] 장바구니에서 여러 주소지로 한번에 주문 결제가 가능합니다.(일부상품 제외)</li>
</ul>
</div>
<div align="left" style="width:1000px;padding-top:90px;padding-bottom:20px;font-weight:bold;font-size:25px;border-bottom:2px solid grey;">교환 및 반품 안내</div>
<table width="1000" id="prod_change" style="margin-bottom:20px;font-size:13px;">
	<tr>
		<td width="200"> <span id="prod_change_info">교환/반품 회수(배송)비용</span> </td>
		<td> 상품의 불량/하자 또는 표시광고 및 계약 내용과 다른 경우 해당 상품의 회수(배송)비용은 무료이나, 고객님의 단순변심 및 사이즈/색상 불만에 관련된 교환/반품의 경우 택배비는 고객님 부담입니다. </td>
	</tr>
	<tr>
		<td> <span id="prod_change_info">교환/반품 불가 안내</span> </td>
		<td> <div><span id="prod_change_info">전자상거래 등에서 소비자보호에 관한 법률에 따라 다음의 경우 청약철회가 제한될 수 있습니다.</span> </div><p>
		
			 <div>고객님이 상품 포장을 개봉하여 사용 또는 설치 완료되어 상품의 가치가 훼손된 경우</div><p>
			
			 <div>(단, 내용 확인을 위한 포장 개봉의 경우는 예외)</div><p>
			
			 <div>고객님의 단순변심으로 인한 교환/반품 신청이 상품 수령한 날로부터 7일이 경과한 경우</div><p>
			
			 <div>신선식품(냉장/냉동 포함)을 단순변심/주문착오로 교환/반품 신청하는 경우</div><p>
			
			 <div>고객님의 사용 또는 일부 소비에 의해 상품의 가치가 훼손된 경우</div><p>
			
			 <div>시간 경과에 따라 상품 등의 가치가 현저히 감소하여 재판매가 불가능한 경우</div><p>
			
			 <div>복제가 가능한 재화 등의 포장을 훼손한 경우(DVD, CD, 도서 등 복제 가능한 상품)</div><p>
			
			 <div>고객님이 이상 여부를 확인한 후 설치가 완료된 상품의 경우(가전, 가구, 헬스기구 등)</div><p>
			
			 <div>고객님의 요청에 따라 개별적으로 주문제작되는 상품으로 재판매가 불가능한 경우(이니셜 표시상품, 사이즈 맞춤상품 등)</div><p>
			
			 <div>구매한 상품의 구성품이 누락된 경우(화장품 세트, 의류부착 악세서리, 가전제품 부속품, 사은품 등)</div><p>
			
			 <div>기타, 상품의 교환, 환불 및 상품 결함 등의 보상은 소비자분쟁해결기준(공정거래위원회 고시)에 의함</div><p>
		</td>
	</tr>
	<tr>
		<td> <span id="prod_change_info">교환/반품 회수(배송)비용</span> </td>
		<td> 상품의 불량/하자 또는 표시광고 및 계약 내용과 다른 경우 해당 상품의 회수(배송)비용은 무료이나, 고객님의 단순변심 및 사이즈/색상 불만에 관련된 교환/반품의 경우 택배비는 고객님 부담입니다. </td>
	</tr>
</table>
<div align="left" style="font-size:13px;width:1000px;padding-bottom:30px;">
	자세한 내용은 고객센터로 문의 부탁드립니다. (A/S 문의는 제조사로 먼저 문의 시 빠르게 처리 가능합니다.)<p>
	전자상거래 등에서의 소비자 보호에 관한 법률에 의한 반품규정이 판매자가 상품상세 페이지 등에서 개별적으로 고지 또는 지정한 반품조건보다 우선합니다.
</div>
</div>
<c:import url="ssgbottom.jsp"/>