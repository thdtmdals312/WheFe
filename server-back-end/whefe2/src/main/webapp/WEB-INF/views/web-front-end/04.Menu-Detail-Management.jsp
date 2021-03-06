<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>상세 메뉴 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/checkboxReaction.js"/>"></script>
</head>
<style>
.option-button {
	border-radius: 10px;
	width: 250px;
	height: 50px;
}

.btn-round {
	border-radius: 17px;
}

.btn-lg {
	border-radius: 10px;
	width: 190px;
	height: 50px;
}

.btn-round-lg {
	border-radius: 10px;
	width: 400px;
}

.btn-round-sm {
	border-radius: 15px;
}

.price {
	max-width: 100px;
}

body {
	background: url('http://i67.tinypic.com/2ldeel3.jpg') fixed;
}

.panel {
	/*opacity:0.7;*/
	background-color: #00ff0000;
}

.panel>.panel-body {
	/*opacity : 0.5;*/
	/*background-color:black;*/
	
}

.panel>.panel-heading {
	background-image: none;
	background-color: #222222;
	/*background-color : black;*/
	color: white;
	opacity: 1.0;
}

.image-preview-input {
	position: relative;
	overflow: hidden;
	margin: 0px;
	color: #333;
	background-color: #fff;
	border-color: #ccc;
}

.image-preview-input input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
}

.image-preview-input-title {
	margin-left: 2px;
}
</style>
<script>
	function moneyCheck(obj) {
		var v = obj.value;
		v = parseInt(v / 10) * 10;
		obj.value = v;
	}
	function validate(evt) {
		var theEvent = evt || window.event;
		var key = theEvent.keyCode || theEvent.which;
		key = String.fromCharCode(key);
		var regex = /[0-9]|\./;
		if (!regex.test(key)) {
			theEvent.returnValue = false;
			if (theEvent.preventDefault)
				theEvent.preventDefault();
		}
	}
</script>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/management">Grazie</a>
			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/management">메뉴관리</a></li>
					<li><a href="<c:url value="/management/coupon"/>">쿠폰관리</a></li>
					<li><a href="<c:url value="/management/order"/>">주문확인</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><div class="user-info"
							style="margin-top: 15px; color: #636363">
							<a
								href="<c:url value="/cafeinfo?cafe_id=${pageContext.request.userPrincipal.name}"/>">
								<span class="glyphicon glyphicon-user"></span>&nbsp;
								${pageContext.request.userPrincipal.name}
							</a>
						</div></li>
					<li><a href="<c:url value="/logout"/>"> <span
							class="glyphicon glyphicon-log-out"></span> 로그아웃
					</a></li>
				</ul>
			</div>

		</div>
	</nav>
	

	<div class="container" style="margin-top: 80px">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4>
					<b> ${category_name} 메뉴 관리</b>
				</h4>
			</div>

			<div class="container">
				<div class="row">
					<div class="panel-body">
						<button type="button" class="btn btn-default btn-round-lg btn-lg"
							onclick="location.href='<c:url value="/management"/>'"
							style="text-align: left; width: 260px; float: right; margin-right: 40px;">
							<span class="glyphicon glyphicon-arrow-left"></span>&nbsp;카테고리
							메뉴로 돌아가기
						</button>
					</div>
				</div>
				<div class="container">
					<div class="row">

						<div class="panel-body">
							<button type="button" class="btn btn-default btn-round-lg btn-lg"
								data-toggle="modal" data-target="#addMenu"
								style="border: 0; text-align: left">
								<b> <span class="glyphicon glyphicon-plus-sign"></span>&nbsp;메뉴
									추가하기
								</b>
							</button>
							<!--메뉴 추가하기 팝업-->
							<div class="modal fade" id="addMenu" role="dialog">
								<div class="modal-dialog modal-lg">

									<!-- Modal content-->
									<div class="modal-content">

										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">메뉴 추가하기</h4>
										</div>
										<form action="<c:url value="/management/menu/addmenu"/>"
											method="POST" enctype="multipart/form-data">
											<input type="hidden" name="category_name"
												value="${category_name}" /> <input type="hidden"
												name="cafe_id"
												value="${pageContext.request.userPrincipal.name}" />
											<div class="modal-body">
												<div class="container-fluid">
													<div class="row">
														<div class="input-group">
															<span class="input-group-addon"></span> <input
																id="menu_name" type="text" class="form-control"
																name="menu_name" placeholder="추가할 메뉴 이름 입력">
														</div>
													</div>
													<br />
													<div class="row">
														<!--가격 관리 표 삽입-->
														<div class="table">
															<table class="table">
																<thead>
																	<tr>
																		<th></th>
																		<th>Small</th>
																		<th>Medium</th>
																		<th>Large</th>
																		<th>사이즈 없음</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<th scope="row">HOT</th>
																		<td>
																			<div class="checkbox price">
																				<label><input type="checkbox" id="hot_small" />
																					<input type="text" id="hot_small_box"
																					name="hot_small" class="form-control"
																					disabled="disabled" onkeypress="validate()"
																					onblur="moneyCheck(this)" /></label>
																			</div>
																		</td>
																		<td>
																			<div class="checkbox price">
																				<label> <input type="checkbox"
																					id="hot_medium"> <input id="hot_medium_box"
																					name="hot_medium" type="text" class="form-control"
																					disabled="disabled" onkeypress="validate()"
																					onblur="moneyCheck(this)" /></label>
																			</div>
																		</td>
																		<td>
																			<div class="checkbox price">
																				<label> <input type="checkbox"
																					id="hot_large"> <input id="hot_large_box"
																					name="hot_large" type="text" class="form-control"
																					disabled="disabled" onkeypress="validate()"
																					onblur="moneyCheck(this)" /></label>
																			</div>
																		</td>
																		<td>
																			<div class="checkbox price">
																				<label> <input type="checkbox" id="hot_none">
																					<input id="hot_none_box" name="hot_none"
																					type="text" class="form-control"
																					disabled="disabled" onkeypress="validate()"
																					onblur="moneyCheck(this)" /></label>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">ICE</th>
																		<td>
																			<div class="checkbox price">
																				<label> <input type="checkbox"
																					id="ice_small"> <input id="ice_small_box"
																					name="ice_small" type="text" class="form-control"
																					disabled="disabled" onkeypress="validate()"
																					onblur="moneyCheck(this)" /></label>
																			</div>
																		</td>
																		<td>
																			<div class="checkbox price">
																				<label> <input type="checkbox"
																					id="ice_medium"> <input id="ice_medium_box"
																					name="ice_medium" type="text" class="form-control"
																					disabled="disabled" onkeypress="validate()"
																					onblur="moneyCheck(this)" /></label>
																			</div>
																		</td>
																		<td>
																			<div class="checkbox price">
																				<label> <input type="checkbox"
																					id="ice_large"> <input id="ice_large_box"
																					name="ice_large" type="text" class="form-control"
																					disabled="disabled" onkeypress="validate()"
																					onblur="moneyCheck(this)" /></label>
																			</div>
																		</td>
																		<td>
																			<div class="checkbox price">
																				<label> <input type="checkbox" id="ice_none">
																					<input id="ice_none_box" name="ice_none"
																					type="text" class="form-control"
																					disabled="disabled" onkeypress="validate()"
																					onblur="moneyCheck(this)" /></label>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">단일 메뉴</th>
																		<td>
																			<div class="checkbox price">
																				<label> <input type="checkbox"
																					id="none_small"> <input id="none_small_box"
																					name="none_small" type="text" class="form-control"
																					disabled="disabled" onkeypress="validate()"
																					onblur="moneyCheck(this)" /></label>
																			</div>
																		</td>
																		<td>
																			<div class="checkbox price">
																				<label> <input type="checkbox"
																					id="none_medium"> <input
																					id="none_medium_box" name="none_medium" type="text"
																					class="form-control" disabled="disabled"
																					onkeypress="validate()" onblur="moneyCheck(this)" /></label>
																			</div>
																		</td>
																		<td>
																			<div class="checkbox price">
																				<label> <input type="checkbox"
																					id="none_large"> <input id="none_large_box"
																					name="none_large" type="text" class="form-control"
																					disabled="disabled" onkeypress="validate()"
																					onblur="moneyCheck(this)" /></label>
																			</div>
																		</td>
																		<td>
																			<div class="checkbox price">
																				<label> <input type="checkbox"
																					id="none_none"> <input id="none_none_box"
																					name="none_none" type="text" class="form-control"
																					disabled="disabled" onkeypress="validate()"
																					onblur="moneyCheck(this)" /></label>
																			</div>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div class="input-group image-preview bottom">
														<input placeholder="" type="text"
															class="form-control image-preview-filename"
															disabled="disabled"> <span
															class="input-group-btn">
															<button type="button"
																class="btn btn-default image-preview-clear"
																style="display: none;">
																<span class="glyphicon glyphicon-remove"></span> Clear
															</button>
															<div class="btn btn-default image-preview-input">
																<span class="glyphicon glyphicon-folder-open"></span> <span
																	class="image-preview-input-title">Browse</span> <input
																	type="file" accept="image/png, image/jpeg, image/gif"
																	name="menu_image" />
															</div>
														</span>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-default btn-md"
													data-toggle="modal" data-target="#addMenu_complete">메뉴
													추가</button>
												<!--메뉴 추가 완료-->
												<div class="modal" id="addMenu_complete" role="dialog">
													<div class="modal-dialog modal-sm">
														<div class="modal-content">
															<div class="modal-body">
																<div class="row" style="text-align: center">
																	<b>메뉴 추가 완료!</b>
																</div>
															</div>
															<div class="modal-footer" data-dismiss="modal">
																<button type="button" class="btn btn-default btn-md">확인</button>
															</div>
														</div>
													</div>
												</div>
												<button type="button" class="btn btn-danger btn-md"
													data-dismiss="modal">취소</button>
											</div>
										</form>
									</div>

								</div>
							</div>
						</div>
					</div>

					<div class="row" id="menu">
						<div class="panel-body">
							<c:forEach var="cafe_menu" items="${cafe_menu}">
								<div class="row">
									<div class="col-lg-5">
										<button type="button"
											class="btn btn-default btn-round-lg btn-lg">
											<h4>
												<b> ${cafe_menu.menu_name} </b>
											</h4>
										</button>
									</div>

									<div class="col-lg-2">
										<button type="button" class="btn btn-default btn-lg" onclick="location.href='<c:url value="/management/menu/editmenu/${cafe_menu.menu_name}/${category_name}"/>'"
											>가격관리</button>
									</div>
									<!--가격 관리 팝업-->
									<div class="modal fade" id="price-management" role="dialog">
										<div class="modal-dialog modal-lg">
											<!--Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">가격 수정하기</h4>
												</div>

												<div class="modal-body">
													<div class="container-fluid">
														<!--가격 관리 표 삽입-->

														<div class="table">
															<table class="table">
																<thead>
																	<tr>
																		<th></th>
																		<th>Small</th>
																		<th>Medium</th>
																		<th>Large</th>
																		<th>None</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<th scope="row">HOT</th>
																		<td>
																			<div class="price">
																				<input type="text" id="hot_small_box"
																					name="hot_small" class="form-control"
																					onkeypress="validate()" onblur="moneyCheck(this)" />
																			</div>
																		</td>
																		<td>
																			<div class="price">
																				<input type="text" id="hot_small_box"
																					name="hot_small" class="form-control"
																					onkeypress="validate()" onblur="moneyCheck(this)" />
																			</div>
																		</td>
																		<td>
																			<div class="price">
																				<input type="text" id="hot_small_box"
																					name="hot_small" class="form-control"
																					onkeypress="validate()" onblur="moneyCheck(this)" />
																			</div>
																		</td>
																		<td>
																			<div class="price">
																				<input type="text" id="hot_small_box"
																					name="hot_small" class="form-control"
																					onkeypress="validate()" onblur="moneyCheck(this)" />
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">ICE</th>
																		<td>
																			<div class="price">
																				<input type="text" id="hot_small_box"
																					name="hot_small" class="form-control"
																					onkeypress="validate()" onblur="moneyCheck(this)" />
																			</div>
																		</td>
																		<td>
																			<div class="price">
																				<input type="text" id="hot_small_box"
																					name="hot_small" class="form-control"
																					onkeypress="validate()" onblur="moneyCheck(this)" />
																			</div>
																		</td>
																		<td>
																			<div class="price">
																				<input type="text" id="hot_small_box"
																					name="hot_small" class="form-control"
																					onkeypress="validate()" onblur="moneyCheck(this)" />
																			</div>
																		</td>
																		<td>
																			<div class="price">
																				<input type="text" id="hot_small_box"
																					name="hot_small" class="form-control"
																					onkeypress="validate()" onblur="moneyCheck(this)" />
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">None</th>
																		<td>
																			<div class="price">
																				<input type="text" id="hot_small_box"
																					name="hot_small" class="form-control"
																					onkeypress="validate()" onblur="moneyCheck(this)" />
																			</div>
																		</td>
																		<td>
																			<div class="price">
																				<input type="text" id="hot_small_box"
																					name="hot_small" class="form-control"
																					onkeypress="validate()" onblur="moneyCheck(this)" />
																			</div>
																		</td>
																		<td>
																			<div class="price">
																				<input type="text" id="hot_small_box"
																					name="hot_small" class="form-control"
																					onkeypress="validate()" onblur="moneyCheck(this)" />
																			</div>
																		</td>
																		<td>
																			<div class="price">
																				<input type="text" id="hot_small_box"
																					name="hot_small" class="form-control"
																					onkeypress="validate()" onblur="moneyCheck(this)" />
																			</div>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="modal-footer" data-dismiss="modal">
													<button type="button" class="btn btn-default btn-md"
														data-toggle="modal">가격 수정</button>
													<button type="button" class="btn btn-danger btn-md"
														data-toggle="modal">취소</button>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-2">
										<button type="button" class="btn btn-warning btn-lg"
											data-toggle="modal" data-target="#menu-name-edit">
											<span style="margin-right: 5px"
												class="glyphicon glyphicon-pencil"></span>이름 수정
										</button>
										<!--메뉴 이름수정하기 팝업-->
										<div class="modal fade" id="menu-name-edit" role="dialog">
											<div class="modal-dialog modal-sm">

												<!-- Modal content-->
												<div class="modal-content">
													<form
														action="<c:url value="/management/menu/editmenuname"/>">
														<input type="hidden" name="category_name"
															value="${category_name }" /> <input type="hidden"
															name="menu_name" value="${cafe_menu.menu_name}" />
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4 class="modal-title">메뉴 이름 수정하기</h4>
														</div>
														<div class="modal-body">
															<div class="container">
																<div class="row">
																	<input class="form-control" style="max-width: 270px"
																		name="new_name" placeholder="${cafe_menu.menu_name}"
																		type="text" required autofocus />
																</div>
															</div>

														</div>
														<div class="modal-footer">
															<button type="submit" class="btn btn-default btn-md"
																data-toggle="modal"
																data-target="#menu-name-edit-complete">메뉴 이름 수정</button>
															<!--메뉴 추가 완료-->
															<div class="modal" id="menu-name-edit-complete"
																role="dialog">
																<div class="modal-dialog modal-sm">
																	<div class="modal-content">
																		<div class="modal-body">
																			<div class="row" style="text-align: center">
																				<b>메뉴 이름 수정 완료!</b>
																			</div>
																		</div>
																		<div class="modal-footer" data-dismiss="modal">
																			<button type="button" class="btn btn-default btn-md">확인</button>
																		</div>
																	</div>
																</div>
															</div>
															<button type="button" class="btn btn-danger btn-md"
																data-dismiss="modal">취소</button>
														</div>
													</form>
												</div>

											</div>
										</div>
									</div>
									<div class="col-lg-2">
										<button type="button" class="btn btn-danger btn-lg"
											data-toggle="modal" data-target="#menu-delete">
											<span style="margin-right: 5px"
												class="glyphicon glyphicon-trash"></span>삭제
										</button>
										<!--메뉴 삭제하기 팝업-->
										<div class="modal fade" id="menu-delete" role="dialog">
											<div class="modal-dialog modal-sm">

												<!-- Modal content-->
												<div class="modal-content">

													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h4 class="modal-title">메뉴 삭제하기</h4>
													</div>
													<form
														action="<c:url value="/management/menu/deletemenu"/>">
														<input type="hidden" name="category_name"
															value="${category_name}" /> <input type="hidden"
															name="menu_name" value="${cafe_menu.menu_name }" />
														<div class="modal-body">
															<div class="container">
																<div class="row">메뉴를 삭제하시겠습니까?</div>
															</div>

														</div>
														<div class="modal-footer">
															<button type="submit" class="btn btn-default btn-md"
																data-toggle="modal" data-target="#menu-delete-complete">삭제하기</button>
															<!--메뉴 삭제 완료-->
															<div class="modal" id="menu-delete-complete"
																role="dialog">
																<div class="modal-dialog modal-sm">
																	<div class="modal-content">
																		<div class="modal-body">
																			<div class="row" style="text-align: center">
																				<b>메뉴 삭제 완료!</b>
																			</div>
																		</div>
																		<div class="modal-footer" data-dismiss="modal">
																			<button type="button" class="btn btn-default btn-md">확인</button>
																		</div>
																	</div>
																</div>
															</div>
															<button type="button" class="btn btn-danger btn-md"
																data-dismiss="modal">취소</button>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
								<br>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>
