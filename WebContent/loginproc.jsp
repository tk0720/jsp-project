<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%

request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String password = request.getParameter("password");

Connection conn;
PreparedStatement pstmt;
ResultSet rs;

boolean b = false;
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521:orcl",
			"scott", "tiger");
    String sql = "select * from member where id=? and password=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, password);
    rs = pstmt.executeQuery();
    b = rs.next();
    
    
} catch (Exception e) {
    // TODO: handle exception
	out.println(e);
}    

if(b){
     session.setAttribute("idKey", id);
//      response.sendRedirect("login.jsp");
     response.sendRedirect("view.jsp");
// out.print("성공"+b);
}else{
     response.sendRedirect("loginfail.html");
// out.print("실패"+b);
}
%>


