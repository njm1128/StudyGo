<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="today" class="java.util.Date" />
<fmt:formatDate value='${today}' pattern='yyyyMMddHHmmddss' var="ver"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<meta property="og:image" content="${pageContext.request.contextPath }/resources/images/icon/ico_studygo.png"/>
<meta property="og:url" content="http://www.studygo.co.kr"/>
<meta property="og:title" content="체험학습Go! | 체험학습의 재미와 학습효율을 UP! UP!"/>
<meta property="og:description" content="현장체험 학습의 지역명소를 대상으로 한 퀴즈게임을 통해 학습 효율을 높이고 주변 상권에서 사용 가능한 쿠폰까지 받자!!"/>

<title>체험학습Go!</title>
<!-- favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/icon/favicon.ico">
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/resources/images/icon/favicon.ico"> 

<link href="${pageContext.request.contextPath }/resources/css/reset.css?ver=${ver}" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/font.css?ver=${ver}" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/main.css?ver=${ver}" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/style.css?ver=${ver}" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/responsive.css?ver=${ver}" rel="stylesheet">
<!-- 부트스트랩 반응형 -->
<link href="https://cdn.rawgit.com/zirafa/bootstrap-grid-only/94433673/css/grid12.css" rel="stylesheet" type="text/css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/plugin/bootstrap/bootstrap-4-utilities.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/plugin/owl-carousel/owl.carousel.min.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath }/resources/plugin/owl-carousel/owl.theme.default.min.css" rel="stylesheet" >

<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/plugin/owl-carousel/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/html5shiv.js?ver=${ver}"></script>
<script src="${pageContext.request.contextPath }/resources/js/respond.js?ver=${ver}"></script>
<script src="${pageContext.request.contextPath }/resources/js/default.js?ver=${ver}"></script>
<script src="${pageContext.request.contextPath }/resources/js/main.js?ver=${ver}"></script>
</head>
<body>
<!-- wrapper (S) -->
<div id="wrapper">