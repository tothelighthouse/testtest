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
  <link rel="stylesheet" href="<c:url value='/resources/css/modifyForm.css'/>">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" >
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" >
	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
</script>
</head>
<body>
  <div class="container">
  	
   	<%@ include file="../main/header.jsp"%>
  	
    <div class="body">
      <div id ="title">회원정보 수정</div>
      <form class="joinForm-dh">
      	<div id = "formtitle"><span id ="formtitlespan">회원정보 입력</span> </div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">아이디<b>*</b></div>
      		<div class ="condiv" id="iddiv"><input class="inputtextid" readonly = "ture" type="text" value="engml1705@naver.com"/></div>
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">비밀번호<b>*</b></div>
      		<div class ="condiv"><input class="inputtext" type="password"/></div> 
      		<div class ="message">최소 10자 이상,  숫자+영문 조합</div>	
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">비밀번호 확인<b>*</b></div>
      		<div class ="condiv"><input class="inputtext" type="password"/></div> 
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">전화번호<b>*</b></div>
      		<div class ="condiv"><input class="inputtext" type="text"/></div> 
      		<div class ="message">-빼고 입력하세요</div>	
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">닉네임<b>*</b></div>
      		<div class ="condiv"><input class="inputtext" type="text"/></div> 
      		<div class ="checkdiv"><button type="button" class="nickcheckBtn">중복검사</button></div>
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">생년월일<b>*</b></div>
      		<div class ="condiv"><input class="inputtext" type="date"/></div>      		
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">성별<b>*</b></div>
      		<div class ="condiv">
      			<label><input type="radio"  name="gender" value="남"/>남</label>
      			<label><input type="radio" style = "margin-left:20px;"  name="gender" value="여"/>여</label>
      		</div>      		
      	</div>
      	<div class = "regionwrapdiv">
      	<div class ="textdiv">주소<b>*</b></div>
      	<div class ="regioncondiv">
      		<input type="text" class = "api" id="sample6_postcode" placeholder="우편번호">
			<input type="button" class = "api" id="saple6_check" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" class = "api" id="sample6_address" placeholder="주소"><br>
			<input type="text" class = "api" id="sample6_extraAddress" placeholder="">
			<input type="text" class = "api" id="sample6_detailAddress" placeholder="상세주소 입력">
		</div> 
<!-- 주소 API 스크립트 부분 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<!-- 주소 API 스크립트 부분 끝-->		
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">프로필 사진</div>
      		<div class ="condiv"><input class="inputtext" type="file"/></div>      		
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">고액 추천 여부<b>*</b></div>
      		<div class ="condiv">
      			<label><input type="radio"  name="money" value=""/>Yes</label>
      			<label><input type="radio" style = "margin-left:20px;"  name="money" value=""/>No</label>
      		</div>
      		 <div class ="message">높은 보수의 의뢰를 우선적으로 추천 받을지에 대해 체크합니다.</div>	     		
      	</div>
      	<div id = "bottom">
      		<button type = "button" id = "ok">수정</button>
      		<button type = "button" id = "cancel">취소</button>
      	</div>
      	
      </form>
    </div>
    <!-- end body -->
    
    <%@ include file="../main/footer.jsp"%>
  </div>

</body></html>