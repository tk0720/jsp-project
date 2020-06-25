<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<% String userId = (String)session.getAttribute("idKey"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String tel=request.getParameter("tel");
	String email=request.getParameter("email");

	//db에 저장하기
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "UPDATE member SET password=?, name=?, tel=?, email=? WHERE id= ?";

	int n=0;

	try{

		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:orcl",
				"scott", "tiger");
		
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, password);
		pstmt.setString(2, name);
		pstmt.setString(3, tel);
		pstmt.setString(4, email);
		pstmt.setString(5, id);

		n = pstmt.executeUpdate();

	}catch(SQLException se){
		System.out.println(se.getMessage());

	}finally{

		try{

			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();

		}catch(SQLException se){
			System.out.println(se.getMessage());
		}
	}
%>

<script type="text/javascript">

	if(<%=n%>>0 ){
		alert("수정되었습니다.");

		location.href="mypage.jsp?id=<%=userId%>";
	}else{

		alert("수정 실패");
		history.go(-1);
	}

</script>

</body>

</html>