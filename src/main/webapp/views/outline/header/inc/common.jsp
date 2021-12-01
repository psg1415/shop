<%@ page contentType="text/html; charset=utf-8" %>
<%@ page  import="com.models.member.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String rootURL = (String)request.getAttribute("rootURL");
	boolean isLogin = (Boolean)request.getAttribute("isLogin");
	Member member = (Member)request.getAttribute("member");
%>
<c:set var="rootURL" value="<%=rootURL%>" />
<c:set var="isLogin" value="<%=isLogin%>" />
<c:set var="member" value="<%=member%>" />
    <header>
      <div class="tit">
        <span class="site"><a href="${rootURL}">Diet<br>Shop</a></span>
        <div class="search">
          <input id="search" type="search" name="search" placeholder="검색"></input>
          <span class="icon"><i class="xi-search"></i></span>
        </div>
       		<c:choose>
			<c:when test="${isLogin}">
				<span class="header_login"><a href="${rootURL}/member/logout">로그아웃</a></span>
			</c:when>
			<c:otherwise>
				<span class="header_login"><a href="${rootURL}/member/login">로그인</a></span>
			</c:otherwise>
		</c:choose>
        
      </div>
    </header>
    <nav>
      <div class="category_top" id="category_top">
        <span class="category"><a href="${rootURL}/category">카테고리</a></span>
        <span class="mypage"><a href="${rootURL}/member/mypage">마이페이지</a></span>
        <span class="shoppingbag"><a href="${rootURL}/mypage/shoppingbag">장바구니</a></span>
      </div>
    </nav>
    <main>
      <div class="search2">
        <input id="search2" type="search" name="search2"
              placeholder="검색"></input></span>
        <span class="icon2"><i class="xi-search"></i></span>
      </div>


