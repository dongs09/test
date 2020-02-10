/**
 * 상품등록 관련 자바스크립트 파일
 */

$(document).ready(function() {
	
	//셀렉트박스 + 검색기능
	var $disabledResults = $(".search-select");
	$disabledResults.select2();

	// 다음버튼 클릭시
	$("#next-stage").click(function(){
		$(".addProductForm").submit();		
	});
	
});

//경고 모달 호출 메서드
function warningModal(content) {
	$(".modal-contents").text(content);
	$("#defaultModal").modal('show');
}

