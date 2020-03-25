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
  <link rel="stylesheet" href="<c:url value='/resources/css/findPWForm.css'/>">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" >
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" >
  <script src="<c:url value ='/resources/js/findPW.js' />"></script>

</head>
<body>
  <div class="container">
  	
   	<%@ include file="../main/header.jsp"%>
  	
    <div class="body">
      <div id = "title">비밀번호 찾기</div>
      <div id = "description">비밀번호가 기억나지 않으신가요?
					가입시 인증한 이메일을 입력하고 비밀번호 찾기 버튼을 눌러주세요.</div>
      <form class="findPWForm-dh">
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
      	<div id = "changepwwrap">
      		<div id = "changepwfont">비밀번호</div>
      		<div id = "changepwinput"><input type = "password" id = "inputpw" placeholder="변경할 비밀번호 입력"/></div>
      	</div>
      	<div id = "checkpwwrap">
      		<div id = "checkpwfont">비밀번호 확인</div>
      		<div id = "checkpwinput"><input type = "password" id = "inputpw" placeholder="비밀번호 확인"/></div>
      	</div>
   
 
      	<div id = "findPWBtnwrap">
      		<button type="button" id ="findPWBtn">비밀번호 찾기</button>
      	</div>
      </form>
      
    </div>
    <!-- end body -->
    
    <%@ include file="../main/footer.jsp"%>
  </div>

</body></html>