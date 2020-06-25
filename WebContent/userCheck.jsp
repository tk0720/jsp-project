<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%

	request.setCharacterEncoding("UTF-8");

	String id=request.getParameter("id");

	JSONObject jsonobj = new JSONObject();

	//db에 저장하기
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from member WHERE id= ?";

// 	boolean result = false;

	
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:orcl",
				"scott", "tiger");
		
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, id);

		rs = pstmt.executeQuery();
		
// 		result = rs.next();
		response.setContentType("application/json");
		
		if(rs.next()) {
// 			String json = "{\"num\" :" + num + ",\"msg\" :" + result + "}";
			String json = "{\'result\":" + 1 + "}";
			
			jsonobj.put("result", 1);
// 			jsonobj.put("result", json);
			%>
<%=jsonobj.toJSONString()%>
<%
// 			return jsonobj;
		} else {
			jsonobj.put("result", 0);
			out.print(jsonobj.toJSONString());
		}

	}catch(SQLException se){
		System.out.println(se.getMessage());

	}finally{

		try{

			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
			
			
		}catch(SQLException se){
			System.out.println(se.getMessage());
		}
	}
%>
