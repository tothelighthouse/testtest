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
  <link rel="stylesheet" href="<c:url value='/resources/css/writeForm.css'/>">
  <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

</head>
<body>
  <div class="container">
    <div class="header">
      <div><a href="<c:url value='/'/>">JOB'S RUN</a></div>
      <div><a href="">로그인</a></div>
      <div><a href="<c:url value='/board/list'/>">의뢰자 게시판</a></div>
      <div><a href="<c:url value='/board/list'/>">공급자 게시판</a></div>
      <div><a href="">회원 가입</a></div>
      <div><a href="">고객센터</a></div>
    </div>
	
	<div class="body">
    <%-- <form:form action="${pageContext.request.contextPath }/board/write" --%>
    <form:form action="${pageContext.request.contextPath }/board/write"
			 class="writeForm"
		     enctype="multipart/form-data"
		   	 method="post"
		     modelAttribute="boardVO">
    
      <div class="writeFormTitle">의뢰자 글쓰기</div>
      <div class="category">
        <form:label path="job">업무구분</form:label>
        <form:select path="job">
          <form:option value="">선택</form:option>>
          <form:options items="${job}" itemValue="code" itemLabel="label"/>
        </form:select>
        <form:label path="duration">시간</form:label>
        <form:select path="duration">
          <form:option value="">선택</form:option>>
          <form:options items="${duration}" itemValue="code" itemLabel="label"/>
        </form:select>
        <form:label path="payment">금액</form:label>
        <form:select path="payment">
          <option value="">선택</option>
          <form:options items="${payment }" itemLabel="code" itemValue="label"/>
          <option value="60">1만원</option>
          <option value="90">1.5만원</option>
          <option value="120">2만원</option>
        </form:select>
        <form:label path="stime">시작시간</form:label>
        <form:input type="datetime-local" path="stime" />
        <label for="blocation">지역</label>
        <select name="blocation" id="blocation">
          <option value="">선택</option>
          <option value="부산">부산</option>
          <option value="울산">울산</option>
          <option value="대구">대구</option>
          <option value="광주">광주</option>
        </select>


      </div>
      <div class="btitle">
        <form:label path="btitle">제목</form:label>
        <form:input type="text" path="btitle"/>
      </div>
      <div class="bid">
        <form:label path="bid">글작성자</form:label>
        <form:input type="text" path="btitle" readonly="true"/>
      </div>
      <div class="bnickname">
        <form:label path="bnickname">별칭</form:label>
        <form:input type="text" path="bnickname"/>
      </div>
      
      <div class="bcontent">
        <form:label path="bcontent">본문</form:label>
        <form:textarea rows="15" path="bcontent"/>
      </div>
      <div class="attachment">
        <div>첨부</div>
        <div>첨부파일 내용</div>
        <input type="button" value="파일 선택">
      </div>

      <div class="writeMenu">
        <form:button id="writeBtn">등록</form:button>
        <form:button id="cancelBtn">취소</form:button>
        <form:button id="listBtn">목록</form:button>
      </div>
    </form:form>
</div>
    <div class="footer">
      <div>
        <div>회사소개</div>
        <div>보도기사</div>
        <div>찾아오시는길</div>
        <div>회원약관</div>
        <div>개인정보처리방침</div>
        <div>이메일무단수집거부</div>
        <div>채용정보 API</div>
        <div>제휴문의</div>
      </div>
      <div>잡스럽 유한책임회사<br>
        서울시 강남구 테헤란로 152(역삼동 강남파이낸스센터) 업무집행자 : 변광윤<br>
        사업자등록번호 : 220-81-83676 사업자정보확인통신판매업신고 : 강남 10630호<br>
        Fax : 02-589-8842
      </div>
      <div>
        잡스럽 고객센터 02-2025-4733
        (평일 09:00~19:00, 주말·공휴일 휴무)
      </div>
      <div>
        잡스럽 유한책임회사 사이트의 상품/판매자/쇼핑정보, 컨텐츠, UI 등에 대한 무단 복제, 전송, 배포, 스크래핑 등의 행위는<br> 저작권법, 콘텐츠사업 진흥법 등에 의하여 엄격히
        금지됩니다.콘텐츠산업 진흥법에 따른 표시<br>

        잡스럽은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 잡스럽은 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.<br>

        Copyrightⓒ eBay Korea LLC All rights reserved.<br>

      </div>
    </div>
  </div>

</body></html>