<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.models.goods.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String action = (String)request.getAttribute("action");
%>
<c:set var="action" value="<%=action%>" />
<main>
	<div class='goods_box'>
		<div class='tit'>
			상품등록
		</div>
		<form name='frmGoods' id='frmGoods' method="post" action="${action}" target="ifrmHidden" autocomplete="off" enctype="multipart/form-data">
			<dl>
				<dt>상품 이미지</dt>
				<dd>
					<input type="file" name="goodsImage">	
				</dd>
			</dl>
			<dl>
				<dt>상품명</dt>
				<dd>
					<input type="text" name="goodsNm">
				</dd>
			</dl>
			<dl>
				<dt>상품가격</dt>
				<dd>
					<input type="number" name="goodsPrice">
				</dd>
			</dl>
			<dl>
				<dt>카테고리</dt>
	            <dd>
                <input type="radio" name="category" id='category_chicken' value="닭가슴살" checked>
                <label for='category_chicken'>닭가슴살</label>
                
                <input type="radio" name="category" id='category_sausage' value="소세지/핫바">
                <label for='category_sausage'>소세지 / 핫바</label>
                
                <input type="radio" name="category" id='category_salad' value="샐러드">
                <label for='category_salad'>샐러드</label>
                
                <input type="radio" name="category" id='category_shake' value="쉐이크">
                <label for='category_shake'>쉐이크</label>
            	</dd>
			</dl>
			<dl>
				<dt>상세설명</dt> 
				<dd>
					<input type="text" name="goodsExplain" style="height: 300px; width: 90%;">
				</dd>
			</dl>
			<input type="reset" value="다시입력">
			<input type="submit" value="입력">
		</form>
	</div>
</main>