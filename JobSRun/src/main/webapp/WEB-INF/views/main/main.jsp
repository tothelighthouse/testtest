<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap">
  <script src="<c:url value='/resources/js/main.js'/>"></script>
</head>

  <div class="container">
    <%@ include file="../main/header.jsp"%>
    <div class="searchBar">
      <select>
        <option value="">시간</option>
        <option value="">장소</option>
        <option value="">금액</option>
        <option value="">아이디</option>
      </select>
      <div id="searchInputWidth"><input type="text" id="searchInput"></div>
      <input type="button" value="검색">
    </div>
    <div class="banner">
      <div class="bigLogo"><img src="<c:url value='/resources/img/잡스런큰로고캐릭터.png'/>"></div>
      <div>이벤트 페이지 자리입니다</div>
    </div>

    <div class="body">
      <div class="more-Body">
        <div>방금 등록된 게시물</div>
        <label for="count">목록 개수</label>
        <select id="listCount">
          <option value="10">10개</option>
          <option value="20">20개</option>
          <option value="30">30개</option>
          <option value="40">40개</option>
        </select>
        <input type="button" value="선택" id="listCountBtn">
        <a href="">
          더보기...
        </a>
      </div>
      <div class="bitem">

        <a href="#" class="itemDescription">
          <div class="hot">방금 등록</div>
          <div class="image"></div>
          <div>홍길동</div>
          <div>매장 청소</div>
          <div>테이블 및 바닥 관리</div>
          <div class="catagory">
            <div>10,000원</div>
            <div>울산(남구)</div>
            <div>1.5km</div>
            <div>30분</div>
          </div>
        </a>
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
    <div class="board">
      <div class="host">
        <div class="hostMenu">
          <div>의뢰자 게시판</div>
          <a href="">더보기...</a>
        </div>
        <div class="hostBoard">
          <div class="th">
            <div>ID</div>
            <div>업무</div>
            <div>금액</div>
            <div>위치</div>
            <div>거리</div>
            <div>시간</div>
          </div>
          <div class="tbody">
            <div class="tdata">
              <div>홍길동</div>
              <div>매장 청소</div>
              <div>10,000원</div>
              <div>울산(남구)</div>
              <div>1.5km</div>
              <div>30분</div>
            </div>
            <div class="tdata">
              <div>홍길동</div>
              <div>매장 청소 업무</div>
              <div>10,000원</div>
              <div>울산(남구)</div>
              <div>1.5km</div>
              <div>30분</div>
            </div>
            <div class="tdata">
              <div>홍길동</div>
              <div>매장 청소</div>
              <div>10,000원</div>
              <div>울산(남구)</div>
              <div>1.5km</div>
              <div>30분</div>
            </div>
            <div class="tdata">
              <div>홍길동</div>
              <div>매장 청소</div>
              <div>10,000원</div>
              <div>울산(남구)</div>
              <div>1.5km</div>
              <div>30분</div>
            </div>
            <div class="tdata">
              <div>홍길동</div>
              <div>매장 청소</div>
              <div>10,000원</div>
              <div>울산(남구)</div>
              <div>1.5km</div>
              <div>30분</div>
            </div>
            <div class="tdata">
              <div>홍길동</div>
              <div>매장 청소</div>
              <div>10,000원</div>
              <div>울산(남구)</div>
              <div>1.5km</div>
              <div>30분</div>
            </div>

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


      </div>
      <div class="guest">
        <div class="guestMenu">
          <div>제공자 게시판</div>
          <a href="">더보기...</a>
        </div>
        <div class="guestBoard">
          <div class="th">
            <div>ID</div>
            <div>업무</div>
            <div>위치</div>
          </div>
          <div class="tbody">
            <div class="tdata">
              <div>홍길동</div>
              <div>매장 청소</div>
              <div>울산(남구)</div>
            </div>

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


      </div>
    </div>
    <%@ include file="../main/footer.jsp"%>
  </div>

</body>
</html>