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
  <script src="<c:url value='/resources/js/common.js'/>"></script>	
  <script src="<c:url value='/resources/js/writeForm.js'/>"></script>	
</head>
<body>
  <div class="container">
   	<%@ include file="../main/header.jsp"%>

    <%-- <form:form action="${pageContext.request.contextPath }/board/write" --%>
    <form:form action="${pageContext.request.contextPath }/board/write"
			 class="writeForm"
		     enctype="multipart/form-data"
		   	 method="post"
		     modelAttribute="boardVO">
      <form:hidden path="boardCategoryVO.bcid" value="1"/>
      <div class="writeFormTitle">의뢰자 글쓰기</div>
     
      <div class="btitle">
        <form:label path="btitle">제목</form:label>
        <form:input type="text" path="btitle"/>
      </div>
      <div class="bid">
        <form:label path="bid">글작성자</form:label>
        <form:input type="text" path="bid" value="${member.id }" readonly="true"/>
      </div>
      <div class="bnickname">
        <form:label path="bnickname">별칭</form:label>
        <form:input type="text" path="bnickname" value="${member.nickname }" readonly="true"/>
      </div>
      
      <div class="bcontent">
        <form:label path="bcontent">본문</form:label>
        <form:textarea rows="15" path="bcontent"/>
      </div>
       <div class="category">
       	<div>업무 상세 내용</div>
  		<div class="categoryItems">
  			<div>
  				<div>
			        <form:label path="job"><span>*</span>1.업무구분</form:label>
  					<div class="btnContainer">
  						<form:radiobuttons path="job" items="${job}" itemLabel="label" itemValue="code"/>
	  					<div>
	  						<form:radiobutton path="job" label="기타" value=""/>
	  						<form:input type="text" path="job"/>
	  					</div>
  					</div>
		    	</div>
	        	<div>
			        <form:label path="duration"><span>*</span>2.시간</form:label>
	        		<div class="btnContainer">
		        		<form:radiobuttons path="duration" items="${duration}" itemValue="code" itemLabel="label"/>
			        		<form:radiobutton path="duration" value="code" label="기타"/>
			        		<form:input type="text" path="duration"/>
	        		</div>
        		</div>
		        <div>
			        <form:label path="payment"><span>*</span>3.금액</form:label>
			        <div class="btnContainer">
						<form:radiobuttons path="payment" items="${payment }" itemValue="code" itemLabel="label"/>
					          <form:radiobutton path="payment" value="code" label="기타"/>
					          <form:input type="text" path="payment"/>
			        </div>
		        </div>
	        </div>
	        <div>
		        <div>
			        <form:label path="sdate"><span>*</span>4.시작날짜</form:label>
			        <form:input type="date" path="sdate" />
		        </div>
		        <div>
			        <form:label path="stime"><span>*</span>5.시작시간</form:label>
			        <form:input type="time" path="stime" />
		        </div>
	        </div>
	        <div>
		        <div>
			        <label for="blocation"><span>*</span>6.지역</label>
			        <select name="blocation" id="blocation">
			          <option value="">선택</option>
			          <option value="부산">부산</option>
			          <option value="울산">울산</option>
			          <option value="대구">대구</option>
			          <option value="광주">광주</option>
			        </select>
		        </div>
		        <div>
		        	<div>카카오 지도 자리</div>
		        </div>
	        </div>
        </div>
      </div><!-- end of category -->
      <div class="attachment" style="display:none">
       <form:label path="bfiles">첨부</form:label>
        <input type="file" id="bfiles" name="bfiles" multiple="multiple"></input>
     </div>
      <div class="picSection">
	      <div>첨부 이미지</div>
	      <div>
		      <div>이미지를 드래그 드랍 하세요</div>
		      <div class="picContainer">
			      <div id="pic" style="display:none">
				      <div class="delete">삭제ⓧ</div>
				      <div class="picItem"></div>
				      <div class="picTitle">파일명</div>
			      </div>
		      </div>
	      </div>
      </div>

      <div class="writeMenu">
        <form:button id="writeBtn">등록</form:button>
        <form:button id="cancelBtn">취소</form:button>
        <form:button id="listBtn">목록</form:button>
      </div>
    </form:form>

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