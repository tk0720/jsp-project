<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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

	String sql = "INSERT INTO member(id, password, name, tel, email, mdate) VALUES(?, ?, ?, ?, ?, SYSDATE)";

	int n=0;

	try{

		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:orcl",
				"scott", "tiger");

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, tel);
		pstmt.setString(5, email);

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

	// 결과 응답하기	

%>

<script type="text/javascript">

	if(<%=n%> > 0){
		alert("정상적으로 회원가입되었습니다.");
		location.href="login.jsp";//

	}else{
		alert("회원가입에 실패했습니다.");
		history.go(-1);//이전페이지로 가기
	}

</script>

</body>

</html>