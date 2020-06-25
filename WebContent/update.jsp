<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<% String id = (String)session.getAttribute("idKey"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원 수정</title>
<link href="css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<%

	request.setCharacterEncoding("UTF-8");

	String param=request.getParameter("empNo");

// 	out.print(param);

	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;

	try{
		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:orcl",
				"scott", "tiger");

		String sql="select * from emp where empNo=?";

    
		pstmt = conn.prepareStatement(sql);

       	pstmt.setString(1, param);

		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			
		int empNo = rs.getInt("empNo");
		String eName = rs.getString("eName");
		String job = rs.getString("job");
		int mgr = rs.getInt("mgr");
		Date hireDate = rs.getDate("hireDate");
		int sal = rs.getInt("sal");
		int comm = rs.getInt("comm");
		int deptNo = rs.getInt("deptNo");
		
		
%>


	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="view.jsp">사원 관리</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0"
			action="search.jsp" method="post">
			<div class="input-group">
				<select class="custom-select" name="selectBox">
					<option value="empNo">사원번호</option>
					<option value="eName">사원이름</option>
					<option value="job">직무</option>
				</select>
				<input class="form-control" type="search" name="keyword" placeholder="Search for..."
					aria-label="Search" aria-describedby="basic-addon2" />
				<div class="input-group-append">
					<button class="btn btn-primary">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>
		
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="mypage.jsp?id=<%=id %>">MyPage</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="logout.jsp">Logout</a>
				</div></li>
		</ul>
	</nav>
	
	
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
						<div class="sb-sidenav-menu-heading">Main</div>
						<a class="nav-link" href="view.jsp"><div
								class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div>사원 목록</a>
						<div class="sb-sidenav-menu-heading">Interface</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages"><div
								class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> Pages
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div></a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-toggle="collapse"
									data-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth">사원관리
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-parent="#sidenavAccordionPages">
						<%
						if("admin".equals(id)) {
						%>	
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="register.jsp">사원 등록</a>
									</nav>
						<%} %>
								</div>
							</nav>
						</div>


					</div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        <b><%=id%></b>님 환영합니다.
                    </div>
                </nav>
            </div>

		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid">
				<h1 class="mt-4">사원 정보 수정</h1>
				<div class="card mb-4">
					<div class="card-body">
					<button class="btn btn-outline-info" onclick="location.href='view.jsp'">사원목록 페이지</button>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table mr-1"></i>사원 정보
					</div>
					<div class="card-body">
						<div class="table-responsive">
						
<form name='frm1' method='post' action='updateok.jsp'>

<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	<tbody>
		<tr>
			<td>사원번호</td>
			<td><input class="form-control col-md-6" type="text" name="empNo" value="<%=empNo%>" readonly="readonly"/></td>
		</tr>
	<tr>

		<td>사원이름</td>

		<td><input class="form-control col-md-6" type="text" name="eName" value="<%=eName %>"/></td>

	</tr>

	<tr>

		<td>직무</td>

		<td><input class="form-control col-md-6" type="text" name="job" value="<%=job %>"/></td>

	</tr>
	
	<tr>

		<td>매니저코드</td>

		<td><input class="form-control col-md-6" type="text" name="mgr" value="<%=mgr %>"/></td>

	</tr>

	<tr>

		<td>고용일</td>

		<td><%=hireDate %></td>

	</tr>
	
	<tr>

		<td>급여</td>

		<td><input class="form-control col-md-6" type="number" name="sal" value="<%=sal %>"/></td>

	</tr>
	
	<tr>
		<td>comm</td>
		<td><input class="form-control col-md-6" type="text" name="comm" value="<%=comm %>"/></td>
	</tr>
	
	<tr>
		<td>부서번호</td>
		<td><input class="form-control col-md-6" type="number" name="deptNo" value="<%=deptNo %>"/></td>
	</tr>

	<tr>
		<td colspan="2" align="center">
		<input class="btn btn-outline-success" type="button" name="btn1" value="저장" onclick="javascript:frm1.submit();"/>
		<input class="btn btn-outline-secondary" type="button" name="btn2" value="목록" onclick="javascript:location.href='view.jsp';"/>
		</td>
	</tr>
</tbody>
</table>

</form>		

<%
		}

	}catch(SQLException se){

		System.out.println(se.getMessage());

	}finally{

		try{

			if(rs!=null)  rs.close();

			if(pstmt!=null)  pstmt.close();

			if(conn!=null)  conn.close();

		}catch(SQLException se){

			System.out.println(se.getMessage());

		}

	}



%>

</body>

<script src="js/scripts.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script type="text/javascript">

	function update(){

		document.frm1.submit();

	}

	function list(){

		location.href="view.jsp";

	}

</script>
</html>