<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/list.css'/>">
  <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <script src="<c:url value='/resources/js/list.js'/>"></script>
  <script src="<c:url value='/resources/js/common.js'/>"></script>
  
</head>
<body>
  <div class="container">
    <div class="header">
      <a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/잡스런작은로고사람.png'/>"></a>
      <div><a href="<c:url value='/'/>">JOB'S RUN</a></div>
      <div><a href="<c:url value='/loginForm'/>">로그인</a></div>
      <div><a href="<c:url value='/board/list'/>">의뢰자 게시판</a></div>
      <div><a href="<c:url value='/board/list'/>">공급자 게시판</a></div>
      <div><a href="<c:url value='/member/joinForm'/>">회원 가입</a></div>
      <div><a href="">고객센터</a></div>
    </div>

    <div class="list-dg">
      <div class="listTitle">의뢰자 게시판</div>
      <div class="th">
        <div>ID</div>
        <div>제목</div>
        <div>
          <div>시작날짜</div>
          <div>시작시간</div>
          <div>위치</div>
          <div>일종류</div>
          <div>시간</div>
          <div>보수</div>
        </div>
      </div>
      <div class="tbody">
        <c:forEach var="rec" items="${list }">
          <div class="tdata">
            <div>${rec.bid }</div>
            <a href="<c:url value='${pageContext.request.contextPath }board/view/${rec.bnum} }'/>">
              <div>${rec.btitle }</div>
            </a>
            <div>
              <div>${rec.sdate }</div>
              <div>${rec.stime }</div>
              <div>${rec.blocation }</div>
              <div>${rec.job }</div>
              <div>${rec.duration }</div>
              <div>${rec.payment }</div>
            </div>
            <input type="button" data-bnum=${rec.bnum } value="의뢰맡기">
        </div>
        </c:forEach>
      </div>
      <div class="listMenu">
        <a href="<c:url value='/board/writeForm'/>"><input type="button" value="글쓰기"></a>
      </div>
      <div class="paging">
        <a href="">이전</a>
        <a href="">1</a>
        <a href="">2</a>
        <a href="">3</a>
        <a href="">4</a>
        <a href="">5</a>
        <a href="">6</a>
        <a href="">다음</a>
      </div>
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