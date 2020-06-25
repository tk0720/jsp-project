<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = (String)session.getAttribute("idKey"); %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
});
	     

	function funcLogin() {
		if (loginForm.id.value === "") {
			alert("아이디 입력!!!");
			loginForm.id.focus();
		} else {
			if (loginForm.password.value === "") {
				alert("비번 입력!!!!");
				loginForm.passwd.focus();

			} else {
				loginForm.action = "loginproc.jsp";
				loginForm.method = "post";
				loginForm.submit();
			}
		}
	}

	function funcNew() {
		location.href = "join.jsp";
	}
</script>

</head>
<body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                   
                                    <div class="card-body">
									     <form name="loginForm">
									     	<div class="form-group">
										     	<label class="small mb-1" for="id">ID</label>
										     	<input class="form-control" type="text" name="id" placeholder="ID를 입력하세요." />
										     </div>
										          
										     <div class="form-group">
										     	<label class="small mb-1" for="password">password</label>
										     	<input class="form-control" type="password" name="password" placeholder="비밀번호를 입력하세요." />
										     </div>
										     
										     
										     <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
										     	<input class="btn btn-primary" type="button" value="로그인" id="btnLogin" onclick="funcLogin()" />
										     	<input class="btn btn-info" type="button" value="회원가입" id="btnNewMember" onclick="funcNew()" />
										     </div>
									     </form>
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