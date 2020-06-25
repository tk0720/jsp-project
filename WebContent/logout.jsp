<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그아웃</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
<%
	session.invalidate();
%>
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-5">
						<div class="card shadow-lg border-0 rounded-lg mt-5">
							<div class="card-header">
								<h3 class="text-center font-weight-light my-4">logout</h3>
							</div>
							<div class="card-body">
								<h2>로그아웃 되었습니다.</h2>
								<div
									class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
									<button class="btn btn-primary"
										onclick="location.href='login.jsp'">로그인</button>
									<button class="btn btn-info" onclick="location.href='join.jsp'">회원가입</button>

								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			</main>
		</div>
	</div>

</body>
</html>