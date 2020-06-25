<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
</head>
<body>
<%

	//삭제할 아이디
	Connection conn = null;
	PreparedStatement pstmt = null;

	String loginUserId = request.getParameter("id");

	int n=0;

	try{

		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:orcl",
				"scott", "tiger");

		String sql="delete from member where id=?";

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, loginUserId);

		n = pstmt.executeUpdate();

	}catch(SQLException se){

		System.out.println(se.getMessage());

	}finally{

		if(pstmt!=null) pstmt.close();

		if(conn!=null) conn.close();

	}

// 	response.sendRedirect("view.jsp");

%>
</body>
<script type="text/javascript">

	if(<%=n%> > 0){
		alert("탈퇴가 정상적으로 처리되었습니다.");
		location.href="login.jsp";

	}else{
		alert("탈퇴를 실패했습니다.");
		location.href="view.jsp";
	}

</script>
</html>