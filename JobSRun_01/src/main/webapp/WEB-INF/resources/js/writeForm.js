window.addEventListener("load", init, false);
let boardImage = [];
function init(){
	
	writeBtn.addEventListener("click", function(e){
		e.preventDefault();
		document.getElementsByClassName("writeForm")[0].submit();
/*		let request = new XMLHttpRequest();
		let formData = new FormData(document.getElementsByClassName("writeForm")[0]);
		console.log("boardImage size:", boardImage)
		formData.append("bfiles",boardImage);
		
		request.addEventListener("readystatechange", function(){
			console.log("readystate change 발생")
			location.href =  getContextPath() + "/board/list";
		}, false)
		
		
		request.open("POST", getContextPath()+"/board/write");
		request.send(formData);*/
	}, false)
	
  let picContainer =document.getElementsByClassName("picContainer")[0];
  picContainer.addEventListener("dragover", function(e){
	  e.stopPropagation();
	  e.preventDefault();

	  dragOver(e);
  }, false);
  
  picContainer.addEventListener("dragleave", function(e){
	  e.stopPropagation();
	  e.preventDefault();

	 dragOver(e);
  }, false);
  
  picContainer.addEventListener("drop", function(e){
	  e.stopPropagation();
	  e.preventDefault();

	  if(e.currentTarget.children.length > 5){
		  e.preventDefault();
		  e.stopPropagation();
		  alert("사진은 최대 5장 등록 가능합니다");
		  e.currentTarget.style.backgroundColor = "white";
		  e.currentTarget.style.outlineOffeset = "-10px"
		  return;
	  }
	  return uploadFiles(e);
  }, false);
  
  function dragOver(e){
	  e.stopPropagation();
	  e.preventDefault();
	  if(e.type == "dragover"){
		  e.currentTarget.style.backgroundColor = "gray";
		  e.currentTarget.style.outlineOffeset = "-20px"
	  }
	  else{
		  e.currentTarget.style.backgroundColor = "white";
		  e.currentTarget.style.outlineOffeset = "-10px"
	  }
  }
  
  function uploadFiles(e){
	  e.stopPropagation();
	  e.preventDefault();
	  dragOver(e);
	  console.log(e.target);
	  let files = e.target.files || e.dataTransfer.files;
	  console.log("files:" , files)
	  
	  if(files.length > 5){
		  console.log(files.length);
		  alert("사진은 최대 5장 등록 가능합니다");
		  return;
	  }
	  
	  if(Array.from(files).some(file => file.size > 1024 * 300)){
		  alert('300kb 미만의 이미지만 첨부 가능합니다.')
		  return;
	  }
	  
	  let reg = /image\/\/*/;
	  if(!Array.from(files).some(file => file.type.match(reg))){
		  alert('이미지가 아닙니다.')
		  return;
	  }
	  
	  Array.from(files).forEach((file, index)=>{
		let pic = document.getElementById("pic");
		let div = pic.cloneNode(true)
		div.style.display = "grid"
		div.children[0].addEventListener("click", function(){
			div.remove();
		})
		div.children[1].style.backgroundImage = "url(" + window.URL.createObjectURL(file) + ")";
		div.children[1].style.backgroundSize = "100% 100%";
		div.children[2].innerHTML = file.name
	    e.currentTarget.appendChild(div);
/*	    boardImage.push(file);
	    console.log("boardImage 첨부파일 내역" , boardImage)*/
	    
	    
	  });
	  document.getElementById("bfiles").files = files;
	  console.log("bfiles :" , document.getElementsByClassName("writeForm")[0].bfiles.files)
	  
  }
	
}



//modifyBtn.addEventListener("click",function(e){
//    e.preventDefault();
//
//    if(checkValid()){
//      // 유효성 통과하면 메인화면으로 이동
//      //location.href="main.html";
//    	
//      //document.getElementById("joinFrm").submit();
//    	
//      let request = new XMLHttpRequest();
//      let formData = new FormData(document.getElementById("joinFrm"));
//      formData.append("file",profileImage);
//      request.open("POST", getContextPath()+"/member/modify");
//      request.send(formData);      
//    }
//  },false);
//  
//  //사진 드래그 앤 드롭
//  let pic =document.getElementsByClassName("pic")[0];
//  pic.addEventListener("dragover",function(e){ 
//    return dragOver(e);
//  },false);
//  pic.addEventListener("dragleave",function(e){
//    return dragOver(e);
//  },false);  
//  pic.addEventListener("drop",function(e){
//    return uploadFiles(e);
//  },false); 
////사진 드래그이벤트
//function dragOver(e) {
//  e.stopPropagation();
//  e.preventDefault();
//  if (e.type == "dragover") {
//      e.target.style.backgroundColor = "black";
//      e.target.style.outlineOffset = "-20px";
//  } else {
//      e.target.style.backgroundColor = "gray";
//      e.target.style.outlineOffset = "-10px";      
//  }
//}
////사진 드롭이벤트발생시 이미지 첨부
//function uploadFiles(e) {
//  e.stopPropagation();
//  e.preventDefault();
//  dragOver(e); //1
//  console.log(e.target);
// // e.dataTransfer = e.originalEvent.dataTransfer; //2
//  let files = e.target.files || e.dataTransfer.files;
//
//  if (files.length > 1) {
//      alert('이미지는 하나만 첨부하세요');
//      return;
//  }
//  //100kb미만의 이미지만 첨부
//  if(files[0].size > 1024*100){
//  	alert('100kb 미만의 이미지만 첨부 가능합니다');
//  	return;
//  }
//
//  let reg = /image\/\/*/;
//  if (files[0].type.match(reg)) {
//    e.target.style.backgroundImage = "url(" + window.URL.createObjectURL(files[0]) + ")";
//    e.target.style.outline = "none";
//    e.target.style.backgroundSize = "100% 100%";
//    profileImage = files[0];
//  }else{
//    alert('이미지가 아닙니다.');
//    return;
//  } 
//}  



















