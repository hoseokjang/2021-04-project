<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
	a{
		color:black;
		text-decoration:none;
	}
	a:hover{ /* a태그에 마우스가 올라오면 동작*/
		text-decoration:underline;
	}
	</style>

</head>
<body> <!-- 모든 필드를 보여주면 복잡(content때문), 각 레코드 들의 기본적인 내용 -->
	<%
		// DB연결
		String url = "jdbc:mysql://localhost:3306/first";
		Connection conn = DriverManager.getConnection(url,"root","1234");
		// page의 index값 생성 => but, .jsp 문서에선 page는 예약어이기 때문에 다른 이름 사용
		int pager;
		if (request.getParameter("pager")==null)
			pager = 1;	
		else
			pager = Integer.parseInt(request.getParameter("pager")); // getParameter는 문자		
		// request한 값을 정수로 변환할 때 null 값이 오면 error 발생
		int index = (pager-1) * 10;
		// 쿼리 생성 // limit 시작 인덱스, 가져올 레코드 개수
		String sql = "select * from board order by id desc limit "+index+",10";
		// 심부름꾼 생성
		Statement stmt = conn.createStatement();
		// 심부름꾼 저장
		ResultSet rs = stmt.executeQuery(sql);
	%>
	<table width="500" align="center" border="1" style="border-collapse:collapse;">
		<tr style="text-align:center;font-weight:bold;color:#1993A8;">
			<td> 작성자 </td>
			<td> 제목 </td>
			<td> 조회수 </td>
			<td> 작성일자 </td>
		</tr>
		<% while(rs.next())
			{ %>
		<tr>
			<td> <%=rs.getString("name")%> </td>
			<td> <a href="readnum.jsp?id=<%=rs.getString("id")%>"> <%=rs.getString("title")%></a> </td>
			<td align="right"> <%=rs.getString("readnum")%> </td>
			<td style="text-align:center;"> <%=rs.getString("writeday")%> </td>
		</tr>
		<% } %>
		<tr>
			<td colspan="4" align="right"> <a href="write.jsp"> 글 작성</a></td>
		</tr>
		<%
			// 사용자가 링크를 통해 원하는 페이지로 이동할 수 있게 출력
			// pstart : 링크의 시작, pend : 링크의 끝
			int pstart=pager/10;
			if (pager%10==0)
				pstart--;
			pstart = Integer.parseInt(pstart+"1"); // "01" => 1,11,21...
			int pend= pstart+9;
		%>
		<tr>
			<td colspan="4" align="center">
			<%
				if (pstart != 1) // 페이지 출력되는 첫번째 그룹이 아닐때
				{
			%>
					<a href="list.jsp?pager=<%=pstart-1%>"> ◀◀  </a>
			<%
				}
			%>
			<%
				// 마지막 페이지 구하기
				// 전체 레코드 개수 구하기
				String sql2= "select count(*) as cnt from board";
				Statement stmt2 = conn.createStatement();	
				ResultSet rs2 = stmt2.executeQuery(sql2);
				rs2.next();
				int cnt = rs2.getInt("cnt");
				int page_cnt = cnt/10;
				if (cnt%10 != 0)
					page_cnt++;
				
				// 마지막 그룹에서는 pend가 258페이지까지 출력이면 260까지 가기때문에
				// pend가 page_cnt를 넘으면 page_cnt에서 끊어 주도록 하는 조건문
				if (pend > page_cnt)
					pend = page_cnt;				
				
				if (pager !=1)
				{
			%>
					<a href="list.jsp?pager=<%=(pager-1) %>"> ◀ </a>
			<%		
				}
			%>
			<%
				String str=null; // 변수는 조건문 밖에서 생성해줘야 됨
				for (int i = pstart; i<=pend; i++)
				{
					if (pager == i)
						str="style='color:red;font-weight:bold'";
					else
						str ="";
			%>		
					<a href="list.jsp?pager=<%=i %>" <%=str %>> <%=i %> </a>
			<%		
					if (i == page_cnt)
						break;
				}
			%>
			<%
				if(pager != page_cnt)
				{
			%>
					<a href="list.jsp?pager=<%=(pager+1) %>"> ▶ </a>
			<%
				}
/*				if (pager/10 != page_cnt/10)
				{
					if (pager%10 == 0)
					{
						if (pager %10 != page_cnt % 10)
						{ */
			%>
						<!--	<a href="list.jsp?pager=<%=pend+1%>"> ▶▶ </a> -->
			<%
/*						}
					}
					else 
					{*/
			%>
					<!-- 	<a href="list.jsp?pager=<%=pend+1%>"> ▶▶ </a> -->
			<%
/*					}
				} */
			%>
			<%
				if (pend != page_cnt)
				{
			%>
					<a href="list.jsp?pager=<%=pend+1 %>"> ▶▶ </a>
			<%
				}
				
			%>

			</td>
		</tr>
	</table>
</body>
</html>
<%
	// close
	stmt2.close();
	stmt.close();
	conn.close();
%>