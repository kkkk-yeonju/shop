<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="nav" value="qna" scope="request"/>
<c:set var="title" value="Aroma Shop - Q&A" scope="request"/>
<jsp:include page="/WEB-INF/views/include/header.jsp" />


<!-- ##### Main Content Wrapper Start ##### -->
<div class="main-content-wrapper d-flex clearfix">

	<!-- Product Catagories Area Start -->
	<div class="products-catagories-area clearfix" style="width: 100%">
		
			<h3 style="text-align: center; padding-top: 5%">QnA</h3>
			<div style="padding-top: 50; text-align: center">
				<div id="inputcontent">
					<div class="inputsubtitle"></div>
					<form action="qa-write" method="post" enctype="multipart/form-data">
						
						<table class="table" style="width: 50%; margin: auto">
							<tr>
								<th colspan="1"><img src="/shop/resources/files/product-files/${ product.file.fileName }" 
									style="width: 60px; padding-right:10px"></th>
								<td colspan="2" style="text-align: left">
								${ product.title }<input type='button' onclick='javascript()' value='상품정보선택'/>
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td>
									<select name="category">
										<option value="상품문의" selected="selected">상품문의</option>
										<option value="교환/반품문의">교환/반품문의</option>
										<option value="기타문의">기타문의</option>
									</select>
								</td>
								<td>
									<input type="text" name="title" 
										style="width: 550px" class="form-control" />
								</td>
							</tr>
							<tr>
								<th colspan="1">작성자</th>
								<td colspan="2" style="text-align: left">
								<input type="hidden" name="uploader" value="${ loginuser.memberId}">
									${ loginuser.memberId}</td>
							</tr>
							<tr>
								<td colspan="3">
									<textarea name="content" id="editor"
									style="width: 100%" rows="20" class="form-control"></textarea>
								</td>	
							</tr>
							<tr>
								<th colspan="1">비밀번호</th>
								<td colspan="2" style="text-align: left">
								<input type="password" class="form-control" id="pwd" 
									name="pwd" style="width:100px" required>
								</td>
							</tr>
							<tr>
								<th colspan="1">비밀글 설정
								<td colspan="2" style="text-align: left">
									<input name="secure" id="secure1" type="radio" value="false" checked="checked" >
									<label for="secure1">공개글</label>
									<input name="secure" id="secure2" type="radio" value="true" >
									<label for="secure2">비밀글</label>
								</td>
							</tr>
							<tr><th/><td/></tr>
						</table>
						<br>
						<div class="buttons">
							<input type="submit" value="Write" id="insertBoard" class="button button-subscribe mr-auto mb-1" /> 
							<input id="cancel_button" type="button" value="Back" class="button button-subscribe mr-auto mb-1" />
						</div>
					</form>
				</div>
			</div>
		
	</div>
</div>

<br>
<br>
<br>
<br>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		// Add the following code if you want the name of the file appear on select
		$(".custom-file-input").on(
				"change",
				function() {
					var fileName = $(this).val().split("\\").pop();
					$(this).siblings(".custom-file-label").addClass("selected")
							.html(fileName);
				});
	</script>

	<!-- editor -->
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript"
		src="/shop/resources/navereditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript">
	
	function javascript(){
		 
	    //팝업창출력
	    //width : 300px크기
	    //height : 300px크기
	    //top : 100px 위의 화면과 100px 차이해서 위치
	    //left : 100px 왼쪽화면과 100px 차이해서 위치
	    //툴바 X, 메뉴바 X, 스크롤바 X , 크기조절 X
	    window.open('/shop/productSelect/','popName',
	                'width=450,height=300,top=100,left=100,toolbar=no,menubar=no,scrollbars=no,resizable=no,status=no');
	}


	출처: https://jdkblog.tistory.com/59 [JDK's blog]
		$(function() {
			//전역변수
			var obj = [];
			//스마트에디터 프레임생성
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : obj,
				elPlaceHolder : "editor",
				sSkinURI : "/shop/resources/navereditor/SmartEditor2Skin.html",
				htParams : {
					// 툴바 사용 여부
					bUseToolbar : true,
					// 입력창 크기 조절바 사용 여부
					bUseVerticalResizer : true,
					// 모드 탭(Editor | HTML | TEXT) 사용 여부
					bUseModeChanger : true,
				}
			});
			//전송버튼
			$("#insertBoard").click(function() {
				//id가 smarteditor인 textarea에 에디터에서 대입
				obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
				//폼 submit
				$("#insertBoardFrm").submit();
			});
		});
	</script>

<jsp:include page="../include/footer.jsp" />