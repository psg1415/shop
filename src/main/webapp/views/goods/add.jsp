<%@ page contentType="text/html; charset=utf-8" %>

<link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/sy.css">
<link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/style.css">

<div class="add">

 <form name="newGoods" class="newGoods" >
	<h1 style="text-align: center; border-bottom:2px solid #c5c5c5; padding-bottom:1rem;">상품 등록</h1>
 	<h1 style=" text-align: center;font-size:1.5rem;"> 카테고리 </h1>
 	<div class="radio">
	 	<div>
		 	<input type="radio" id="chicken" name="category" value="chicken" checked>
		 	<label for="chicken">닭가슴살</label>
	 	</div>
	 	<div>
		 	<input type="radio" id="salad" name="category" value="salad">
		 	<label for="salad">샐러드</label>
	 	</div>
	 	<div>
		 	<input type="radio" id="sausage" name="category" value="sausage">
		 	<label for="sausage">소세지/핫바</label>
	 	</div>
	 	<div>
		 	<input type="radio" id="shake" name="category" value="shake">
		 	<label for="shake">쉐이크</label>
	 	</div>
 	</div>
 	<h1 style="text-align: center; font-size:1.5rem">상품 내용</h1>
	<div>
	<span>상품 이름</span><input type="text" id="goodsNm" name="name" placeholder="상품 이름" > <br>
	</div>	
	<div>
	<span>가격</span><input type="text" id="unitPrice" name="unitPrice" placeholder="가격"><br>
	</div>	
	<div>
	<span>상세 내용</span><textarea name="description" cols="50" rows="2" placeholder="상세 내용"></textarea><br>
	</div>
	<div>
	<span>상품 이미지</span><input type="file" name="goodsImage" ><br>
	</div>	 
	<div class="newGoods_btn">
	<input type="button"  value="등 록 하 기" onclick="location='../main/index.jsp'">
	</div>

			
	</form>
	
</div>
