window.addEventListener("load", init, false);
function init() {
	findPWBtn.addEventListener("click", findPWBtnclick, false);
	
	function findPWBtnclick(){
		var changepwwrap = document.getElementById("changepwwrap");
		var checkpwwrap = document.getElementById("checkpwwrap");
		
		changepwwrap.style.display = "block";
		checkpwwrap.style.display = "block";
		
		findPWBtn.innerHTML = "비밀번호 변경";
	}
}