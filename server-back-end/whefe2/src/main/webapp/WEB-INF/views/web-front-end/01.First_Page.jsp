<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>First Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
</head>
<style>
body {
    background: url('http://www.thegladcafe.co.uk/upload/background11.jpg') fixed;
    background-size: cover;
    padding: 0;
    margin: 0;
    opacity: 0.9;
  }

.panel {
	/* opacity: 0.9; */
}
</style>
<body>


	<div class="container">

		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">로그인</div>

				</div>
				
				<c:if test="${not empty error}">
					<div style="color: #E15F5F; font-size:90%">
						<div class="error">
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;입력하신
							아이디와 비밀번호가 등록된 정보와 일치하지 않습니다.<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;확인
							후 다시 시도하세요.
						</div>
					</div>
				</c:if>

				
				<div style="padding-top: 30px" class="panel-body">

					<div style="display: none" id="login-alert"
						class="alert alert-danger col-sm-12"></div>


					<form class="form-horizontal" action="<c:url value="/login"/>"
						method="post">

						<div style="margin-bottom: 5px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input type="text"
								class="form-control" id="cafe_id" name="cafe_id"
								placeholder="아이디">
						</div>

						<div style="margin-bottom: 10px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input type="password"
								class="form-control" name="cafe_pw" placeholder="비밀번호">
						</div>

						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<div style="margin-top: 10px" class="form-group">
							<!-- Button -->

							<div class="form-group">
								<div class="col-sm-1"></div>
								<div class="col-sm-5">
									<input type="submit" data-target="#info-false"
										data-toggle="modal"
										class="btn btn-primary btn-login-submit btn-block "
										value="로그인" />
								</div>
								<div class="col-sm-5">
									<input type="button"
										class="btn btn-default btn-login-submit btn-block "
										value="회원가입"
										onclick="location.href='<c:url value="/login/signup"/>'" />
								</div>
								<div class="col-sm-1"></div>
							</div>
						</div>
					</form>
					<%-- <form class="form-horizontal" action="<c:url value="/login/success"/>" method="post">

						<div style="margin-bottom: 5px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input type="text"
								class="form-control" name="cafe_id" placeholder="아이디">
						</div>

						<div style="margin-bottom: 10px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input type="password"
								class="form-control" name="cafe_pw" placeholder="비밀번호">
						</div>



						<div class="input-group">
							<div class="checkbox">
								<label> <input id="login-remember" type="checkbox"
									name="remember" value="1"> ID 기억하기
								</label>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<div style="margin-top: 10px" class="form-group">
							<!-- Button -->

							<div class="form-group">
								<div class="col-sm-1"></div>
								<div class="col-sm-5">
									<input type="submit"
										class="btn btn-primary btn-login-submit btn-block "
										value="로그인" />
								</div>
								<div class="col-sm-5">
									<input type="button"
										class="btn btn-default btn-login-submit btn-block "
										value="회원가입" onclick="location.href='<c:url value="/login/signup"/>'"/>
								</div>
								<div class="col-sm-1"></div>
							</div>
						</div>
					</form> --%>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
<%--

 --%>