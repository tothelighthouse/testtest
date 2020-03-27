<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/loginForm.css'/>">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" >
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" >
	<script src="<c:url value ='/resources/js/login.js'/>"></script>
</head>
<body>
  <div class="container">
  	
   	<%@ include file="../main/header.jsp"%>
  	
    <div class="body">
      	마이 페이지 입니다.
      
    </div>
    <!-- end body -->
    
    <%@ include file="../main/footer.jsp"%>
  </div>

</body></html>