<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/findIDForm.css'/>">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" >
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" >
  <script src="<c:url value ='/resources/js/findID.js' />"></script>

</head>
<body>
  <div class="container">
  	
   	<%@ include file="../main/header.jsp"%>
  	
    <div class="body">
      <div id = "title">아이디 찾기</div>
      <div id = "description">아이디가 기억나지 않으신가요?
					가입시 인증한 이메일을 입력하고 아이디 찾기 버튼을 눌러주세요.</div>
      <form class="findIDForm-dh">
      	<div id = "emailwrap">
      		<div id = "emamilfont">이메일</div>
      		<div id = "emailinput"><input type="text" id ="emailinput-input"/></div>
      		<div id = "emailBtnwrap"><button id = "emailBtn" type ="button">전송</button></div>
      	</div>
      	<div id = "codewrap">
      		<div id = "codefont">인증번호</div>
      		<div id = "codeinput"><input type="text" id = "codeinput-input"/></div>
      		<div id = "codeBtnwrap"><button id = "codeBtn" type ="button">확인</button></div>
      	</div>
      	<div id = "idfind">
      	 
      	<div id ="inputfindwrap"><input type="text" id ="inputfind" readonly="true" placeholder ="찾은 아이디  표시"/></div>
      	<div id ="joindatewrap"><span id="joindate">(가입날짜 : 2020-03-02)</span></div>
      	</div>
      	<div id = "findIDBtnwrap">
      		<button type="button" id ="findIDBtn">아이디 찾기</button>
      	</div>
      </form>     
    </div>
    <!-- end body -->
    
    <%@ include file="../main/footer.jsp"%>
  </div>

</body></html>