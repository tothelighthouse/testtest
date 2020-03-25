window.addEventListener("load", init, false);
function init() {
	var flag = ["방금 등록", "마감 임박", "Hot Deal", "우수 회원"];
	var image = [
		"https://placekitten.com/200/140",
		"https://placekitten.com/200/287",
		"https://placekitten.com/200/140",
		"https://placekitten.com/200/139",
		"https://www.fillmurray.com/460/300",
		"https://www.fillmurray.com/300/200",
		"https://www.fillmurray.com/g/155/300",
		"https://www.fillmurray.com/140/100",
		"https://www.fillmurray.com/284/196",
		"http://placebeard.it/183/150?6",
		"http://placebeard.it/g/170/150?22",
		"http://placebeard.it/175/150?30",
		"http://placebeard.it/151/150?17",
		"https://picsum.photos/id/10/367/267",
		"https://picsum.photos/id/1001/367/267",
		"https://picsum.photos/id/1005/367/267",
		"https://picsum.photos/id/1015/367/267",
		"https://picsum.photos/id/1027/367/267",
		"https://picsum.photos/id/103/367/267",
		"https://picsum.photos/id/106/367/267",
		"https://picsum.photos/id/1065/367/267",
		"https://picsum.photos/id/1070/367/267",
		"https://picsum.photos/id/1072/367/267",
		"https://picsum.photos/id/1074/367/267",
		"https://picsum.photos/id/1080/367/267",
		"https://picsum.photos/id/111/367/267",
		"https://picsum.photos/id/119/367/267"
	];
	var name = ["홍길동", "이영호", "김철수", "김영희", "이숙자", "이말자"];
	var work = [
		"매장 청소",
		"이사짐 이동",
		"컴퓨터 수리",
		"아파트 경비",
		"매장 관리",
		"수도관 보수",
		"페인트칠"
	];

	var workDesc = [
		"매장 테이블 및 바닥 청소",
		"아파트 10층에서 1층으로 이삿짐 이동",
		"아파트 주변 순찰 및 환경 미화",
		"매장 진열 관리 및 계산",
		"노후 수도관 교체 작업",
		"바닥 및 천장 페인트 칠"
	];

	var amount = ["5,000원", "10,000원", "15,000원", "20,000원"];
	var location = [
		"울산(남구)",
		"울산(북구)",
		"울산(중구)",
		"울산(방어진)",
		"부산(중구)",
		"부산(사하구)",
		"부산(해운대구)",
		"부산(센텀시티)",
		"서울(중구)",
		"서울(용산구)"
	];
	var distance = ["500m", "1km", "1.5km", "2km"];
	var time = ["30분", "1시간", "1.5시간", "2시간", "2.5시간", "3시간"];
	const listCountBtn = document.getElementById("listCountBtn");
	listCountBtn.addEventListener(
		"click",
		function() {
			const bitem = document.getElementsByClassName("bitem")[0];
			while (bitem.childNodes.length != 1) {
				bitem.removeChild(bitem.firstChild);
			}
			console.log(bitem.childNodes.length);

			let count = listCount.options[listCount.selectedIndex].value;
			for (let i = 0; i < count; i++) {
				var info = [
					randomSelect(flag),
					randomSelect(image),
					randomSelect(name),
					randomSelect(work),
					randomSelect(workDesc),
					randomSelect(amount),
					randomSelect(location),
					randomSelect(distance),
					randomSelect(time)
				];
				const copyNode = cloneNode();
				copyNode.children[0].innerHTML = info[0];
				copyNode.children[1].style.background = `url(${info[1]}) no-repeat center/cover`;
				copyNode.children[2].innerHTML = info[2];
				copyNode.children[3].innerHTML = info[3];
				copyNode.children[4].innerHTML = info[4];
				const categoryNode = copyNode.children[5].children;
				categoryNode[0].innerHTML = info[5];
				categoryNode[1].innerHTML = info[6];
				categoryNode[2].innerHTML = info[7];
				categoryNode[3].innerHTML = info[8];
				bitem.appendChild(copyNode);
			}
			bitem.removeChild(bitem.firstChild);
		},
		false
	);
	for (let i = 0; i < 20; i++) {
		var info = [
			randomSelect(flag),
			randomSelect(image),
			randomSelect(name),
			randomSelect(work),
			randomSelect(workDesc),
			randomSelect(amount),
			randomSelect(location),
			randomSelect(distance),
			randomSelect(time)
		];
		const copyNode = cloneNode();
		copyNode.children[0].innerHTML = info[0];
		copyNode.children[1].style.background = `url(${info[1]}) no-repeat center/cover`;
		copyNode.children[2].innerHTML = info[2];
		copyNode.children[3].innerHTML = info[3];
		copyNode.children[4].innerHTML = info[4];
		const categoryNode = copyNode.children[5].children;
		categoryNode[0].innerHTML = info[5];
		categoryNode[1].innerHTML = info[6];
		categoryNode[2].innerHTML = info[7];
		categoryNode[3].innerHTML = info[8];
		const bitem = document.getElementsByClassName("bitem")[0];
		bitem.appendChild(copyNode);
	}
}
function randomSelect(arr) {
	return arr[Math.floor(Math.random() * arr.length)];
}

function cloneNode() {
	let master = document.getElementsByClassName("itemDescription")[0];
	let cloneNode = master.cloneNode(true);
	return cloneNode;
}
