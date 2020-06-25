<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원가입</h3></div>
                                    <div class="card-body">
										<form method="post" action="joinInsert.jsp">
												<div class="form-row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="small mb-1" for="id">아이디</label>
															<input type="text" id="id" name="id"  class="form-control" required="required" />
															<div class="col-md-12" id="idCheck"></div>
															<button type="button" class="btn btn-info" id="checkBtn">중복체크</button><br/>
														</div>
													</div>
												</div>
										
												<div class="form-row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="small mb-1" for="password">비밀번호</label>
															<input type="password" class="form-control" name="password" required="required" /><br/>
														</div>
													</div>
												</div>
												
												<div class="form-row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="small mb-1" for="name">이름</label>
															<input type="text" class="form-control" name="name"/><br/>
														</div>
													</div>
												</div>
												
												<div class="form-row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="small mb-1" for="tel">전화번호</label>
															<input type="text" class="form-control" name="tel"/><br/>
														</div>
													</div>
												</div>
												
												<div class="form-row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="small mb-1" for="email">이메일</label>
															<input type="email" class="form-control" name="email"/><br/>
														</div>
													</div>
												</div>
										
												<div class="form-group mt-4 mb-0">
													<button type="submit" class="btn btn-primary" id="submitBtn">가입</button>
													<button type="reset" class="btn btn-danger" onclick="location.href = 'login.jsp'">취소</button>
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

<script>
$(function() {

	     
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#checkBtn").click(function() {
		// id = "id_reg" / name = "userId"
		var id = $('#id').val();
		$.ajax({
			url : 'userCheck.jsp?id='+ id,
			type : 'get',
			data : id,
			datatype : 'json',
			success : function(obj) {
// 				var data = JSON.parse(obj);
				var data = JSON.stringify(obj);
				console.log(data);
				console.log("1 = 중복o / 0 = 중복x : "+ obj.result);		
				
				if ( obj.result == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#idCheck").text("사용중인 아이디입니다.");
						$("#idCheck").css("color", "red");
						$("#submitBtn").attr("disabled", true);
				} else if(obj.result == 0) {
						$("#idCheck").text("사용 가능합니다.");
						$("#idCheck").css("color", "green");
						$("#submitBtn").attr("disabled", false);
						
				} else {
						
// 						if(idJ.test(user_id)){
							// 0 : 아이디 길이 / 문자열 검사
// 							$("#id_check").text("");
// 							$("#reg_submit").attr("disabled", false);
				
// 						} else if(user_id == ""){
						if(id == ""){
							
							$('#idCheck').text('아이디를 입력해주세요 :)');
							$('#idCheck').css('color', 'red');
							$("#submitBtn").attr("disabled", true);				
						}
// 						} else {
							
// 							$('#idCheck').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
// 							$('#idCheck').css('color', 'red');
// 							$("#submitBtn").attr("disabled", true);
// 						}
						
					}
				}, error : function(request,status,error) {
						console.log("실패");
						alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
		});
});
</script>
</html>