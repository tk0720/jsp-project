<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<% String id = (String)session.getAttribute("idKey"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 관리</title>
<link href="css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">

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
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="register.jsp">사원 등록</a>
									</nav>
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
				<h1 class="mt-4">파일 관리</h1>
				<div class="card mb-4">
					<div class="card-header">
						업로드/다운로드
					</div>
					<div class="card-body">           

<form action="uploadproc.jsp" method="post" enctype="multipart/form-data">
<!-- 	이름 :  -->
<!-- 	<div class="col-md-6"> -->
<!-- 		<div class="form-group"> -->
<!-- 			<input class="form-control" type="text" name="name"><br> -->
<!-- 		</div> -->
<!-- 	</div> -->
	
	<div class="col-md-6">
		<div class="form-group">
	파일 : <input class="form-control" type="file" name="file"><br>
	<input class="btn btn-outline-success" type="submit" name="업로드"><br>	
		</div>
	</div>
</form>
<%
	String saveDir = application.getRealPath("/upload");
	File dir = new File(saveDir);
	
	String fName[] = dir.list();
	
	for(String fileName : fName )
	{
		out.write("<a href=\"" + request.getContextPath() + "/download.jsp?filename=" + java.net.URLEncoder.encode(fileName, "UTF-8") + "\">" + fileName + "</a><br>");
	}
%>
	                                </div>
                            </div>
                       </div>
                </main>
            </div>
	</div>
</body>
<script src="js/scripts.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</html>