<%@ page contentType="text/html; charset=utf-8" %>

<link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/sy.css">
<link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/style.css">

<form class="addresFrm" name='frmAddres' id='frmAddres' method="post" action="${action}" target="ifrmHidden" autocomplete="off">
<div class="address">

    <h2 style="text-align: center;">배송지 변경</h2>

	<input type="text" name="address" value="${member.address}" placeholder="주소"><br><br>
	<input type="submit" value="주소수정" style="padding: 0;"><br><br>
	<div class="cancle" >
					<input class="cancle1" type="reset" value="다시입력" style="padding: 0;">
					<input class="cancle1" class="c" type="button" value="취소" style="padding: 0;" onClick="location.href='${rootURL}/member/mypage'">
				</div>
    </div>
</form>


		