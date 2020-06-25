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

	String empNo=request.getParameter("empNo");
	String eName=request.getParameter("eName");
	String job=request.getParameter("job");
	String mgr=request.getParameter("mgr");
	String sal=request.getParameter("sal");
	String comm=request.getParameter("comm");
	String deptNo=request.getParameter("deptNo");

	//db에 저장하기
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "UPDATE emp SET eName=?, job=?, mgr=?, sal=?, comm=?, deptNo=? WHERE empNo= ?";

	int n=0;

	try{

		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:orcl",
				"scott", "tiger");
		
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, eName);
		pstmt.setString(2, job);
		pstmt.setString(3, mgr);
		pstmt.setString(4, sal);
		pstmt.setString(5, comm);
		pstmt.setString(6, deptNo);
		pstmt.setString(7, empNo);

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

		location.href="view.jsp";
	}else{

		alert("수정 실패");
		history.go(-1);
	}

</script>

</body>

</html>