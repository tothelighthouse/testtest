<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
  <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

  <script src="<c:url value='/resources/js/main.js'/>"></script>
</head>

  <div class="container">
    <%@ include file="main/header.jsp"%>

    <div class="body">
    <h1>
		INDEX
		
		
		
		내가 한거고 커밋해본다
		
		두희자리에서 커밋을 해본다
    </h1>
    </div>
    <!-- end .body -->

    <%@ include file="main/footer.jsp"%>
  </div>
</body>
</html>