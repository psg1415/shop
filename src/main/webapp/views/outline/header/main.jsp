<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.HashSet" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String rootURL = (String)request.getAttribute("rootURL");
	HashSet<String> addCss = (HashSet<String>)request.getAttribute("addCss");	
	HashSet<String> addScripts = (HashSet<String>)request.getAttribute("addScripts");
	
	String pageTitle = (String)request.getAttribute("pageTitle"); // 사이트 기본 제목
	String cssJsVersion = (String)request.getAttribute("cssJsVersion"); 
	
	String bodyClass = (String)request.getAttribute("bodyClass");
%>
<c:set var="rootURL" value="<%=rootURL%>" />
<c:set var="addCss" value="<%=addCss%>" />
<c:set var="addScripts" value="<%=addScripts%>" />
<c:set var="pageTitle" value="<%=pageTitle%>" />
<c:set var="version" value="<%=cssJsVersion%>" />
<c:set var="bodyClass" value="<%=bodyClass%>" />
<!DOCTYPE html>
<html>
	<head>
	    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <meta name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="${rootURL}/resources/css/style.css">
    <link rel="stylesheet" href="${rootURL}/resources/css/sg.css">
    <link rel="stylesheet" href="${rootURL}/resources/css/sy.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
      crossorigin="anonymous"></script>
		<meta charset='utf-8'>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
		<link rel="stylesheet" type="text/css" href="${rootURL}/resources/css/style.css${version}" />
		<c:forEach var="css" items="${addCss}">
		<link rel="stylesheet" type="text/css" href="${rootURL}/resources/css/${css}.css${version}" />
		</c:forEach>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<script type="text/javascript" src="${rootURL}/resources/js/layer.js${version}"></script>
		<script type="text/javascript" src="${rootURL}/resources/js/common.js${version}"></script>
		<c:forEach var="script" items="${addScripts}">
		<script type="text/javascript" src="${rootURL}/resources/js/${script}.js${version}"></script>
		</c:forEach>
		<title><c:out value="${pageTitle}" /></title>
	</head>
	<body class="${bodyClass} layout_width">