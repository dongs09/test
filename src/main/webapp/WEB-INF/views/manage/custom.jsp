<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 헤더 -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- select2 4.0.5 버전 -->
<link rel="stylesheet" href="/resources/vendor/select2/select2.min.css" />

<!-- daum 주소 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- datepicker -->
<link href="/resources/css/datepicker.css">
<link href="/resources/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

<!-- 폰트 어썸 4.7 버전 -->
<link href="/resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
<link href="/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">

<!-- 폰트어썸 5.12 버전 -->
<script src="https://kit.fontawesome.com/a1cb5a2b66.js" crossorigin="anonymous"></script>

<!-- 게시판(테이블) dataTable 1.10.19 & 부트스트랩4 버전 -->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css" rel="stylesheet">

<!-- 제이쿼리 3.2.1 버전 -->
<!-- Bootstrap core JavaScript -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript -->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- 자바스크립트 공통 메소드 모임 -->
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                
// 				jQuery("#post_num").val(data.post_num);
// 				jQuery("#addr1").val(data.addr1);
// 				jQuery("#addr2").val(data.addr2);

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
                    document.getElementById("addr2").value = extraAddr;
                
                } else {
                    document.getElementById("addr2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post_num').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }
</script>
<script type="text/javascript">
$(document).ready(function() {
	
	//국가 검색 모달에서, 선택 완료 버튼 눌렀을때
	$('#selectBtn').click(function(){
		$('#country_eng').html('');
		var country = $('#myModal #country').val().trim();
		console.log(country);
		document.getElementById("country_eng").value = country;
		
		if(country === 'kor'){
			document.getElementById('country_kor').value = '대한민국';
		}else if(country === 'jpn'){
			document.getElementById('country_kor').value = '일본';
		}else if(country === 'chn'){
			document.getElementById('country_kor').value = '중국';
		}else{
			document.getElementById('country_kor').value = '미국';
		}
		$('#myModal').modal('hide');
	});
	
	//저장 버튼 눌렀을 때
	$('#customAdd').click(function(){
		
	});
});
</script>
<title>Insert title here</title>
</head>
<body>
<div id="custom">
	<form action="/manage/custom" method="get">
		<fieldset>
			<legend class="text-primary">거래처 관리</legend>
			<table>
				<thead>
					<tr>
						<td>
							<div>
								<label>사업자번호</label>
								<input id="busi_num" name="busi_num" type="text" class="form-control">
								<br>
								<label>거래처명</label>
								<input id="custom" name="custom" type="text" class="form-control">
							</div>
							<div class="form-group">
								<button id="searchCustom" class="btn btn-primary">조회</button>
							</div>
						</td>
					</tr>
				</thead>
			</table>
		</fieldset>
	</form>
</div> <!--custom div -->
<div id="customList">
	<table class="table">
		<thead>
			<tr>
			<th>사업자 번호</th>
			<th>거래처 명</th>
			</tr>
		</thead>
	</table>
</div>
<div id="addCustom">
	<div>
		<button id="delCustom" class="btn btn-primary pull-right">삭제</button>
		<button id="customAdd" class="btn btn-primary pull-right">저장</button>
	</div>
	<table class="table">
		<tr>
			<th>사업자번호</th>
			<td>
				<input type="text" id="busi_num" class="form-control">
			</td>
			<th>약칭</th>
			<td>
				<input type="text" id="shortName" class="form-control">
			</td>
		</tr>
		<tr>
			<th>거래처명</th>
			<td>
				<input type="text" id="custom" class="form-control">
			</td>
		</tr>
		<tr>
			<th>대표자</th>
			<td>
				<input type="text" id="ceo" class="form-control">
			</td>
			<th>담당자</th>
			<td>
				<input type="text" id="charge_person" class="form-control">
			</td>
		</tr>
		<tr>
			<th>업태</th>
			<td>
				<input type="text" id="busi_condition" class="form-control">
			</td>
			<th>종목</th>
			<td>
				<input type="text" id="item" class="form-control">
			</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td>
				<input type="text" id="post_num" class="form-control">
				<button id="searchPost" class="btn btn-primary" onClick="sample6_execDaumPostcode();">검색</button>
			</td>
			<th>주소 1</th>
			<td>
				<input type="text" id="addr1" class="form-control">
			</td>
		</tr>
		<tr>
			<th>주소2</th>
			<td>
				<input type="text" id="addr2" class="form-control">
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" id="tel" class="form-control">
			</td>
			<th>팩스번호</th>
			<td>
				<input type="text" id="fax" class="form-control">
			</td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td>
				<input type="text" id="homepage" class="form-control">
			</td>
		</tr>
		<tr>
			<th>법인여부</th>
			<td>
				<div id="co_yn" class="form-control">
					<input type="radio" name="chk_info" value="y">법인
					<input type="radio" name="chk_info" value="n">개인
				</div>
			</td>
			<th>해외여부</th>
			<td>
				<div id="foreign_yn" class="form-control">
					<input type="radio" name="chk_info" value="n">국내
					<input type="radio" name="chk_info" value="y">해외
				</div>
			</td>
		</tr>
		<tr>
			<th>과세구분</th>
			<td>
				<select id="tax_yn">
					<option value="">과세/면세</option>
					<option value="y">과세</option>
					<option value="n">면세</option>
				</select>
			</td>
			<th>국가</th>
			<td>
				<input type="text" id="country_eng" class="form-control">
				<input type="text" id="country_kor" class="form-control">
				<button id="searchCountry" class="btn btn-primary" data-toggle="modal" data-target="#myModal">검색</button>
			</td>
		</tr>
		<tr>
			<th>특수관계자</th>
			<td>
				<input type="checkbox" id="special_relation" value="y">
			</td>
			<th>거래중지</th>
			<td>
				<input type="checkbox" id="trade_stop" value="y">
			</td>
		</tr>
		<tr>
			<th>계약기간</th>
			<td>
				<div id="period" class="input-group">
                       	<input class="input--style-1 js-datepicker" type="text" placeholder="" id="contract_period_s" name="contract_period_s">
                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                      	~
                       	<input class="input--style-1 js-datepicker" type="text" placeholder="" id="contract_period_e" name="contract_period_e">
                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                </div>
			</td>
		</tr>
		<tr>
			<th>등록정보</th>
			<td>
				<input type="text" id="regi_info_man" class="form-control">
				<input type="text" id="regi_info_date" class="form-control">
			</td>
			<th>변경정보</th>
			<td>
				<input type="text" id="modi_info_man" class="form-control">
				<input type="text" id="modi_info_date" class="form-control">
			</td>
		</tr>
		<tr>
			<th>(거래처 계좌정보)</th>
			<td>
				<div id="account">
					<table class="table">
						<tr>
							<th>사무소</th>
							<th>은행</th>
							<th>계좌번호</th>
						</tr>
						<tr>
							<td>
								<input type="text" id="factory" class="form-control">
							</td>
							<td>
								<input type="text" id="trade_bank" class="form-control">
							</td>
							<td>
								<input type="text" id="account_num" class="form-control">
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
</div>

<!-- 국가 검색 모달 -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalTitle" aria-hidden="true">
	<div class="modal-dialog modal-m" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalTitle">국가 검색</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
			</div>
			<div class="modal-body">
				<table class="table">
					<tr>
						<th>국가선택</th>
						<td>
							<select class="search-select select2-selection select2-selection--single form-control" id="country">
								<option value="">국가선택</option>
								<option value="kor">대한민국</option>
								<option value="jpn">일본</option>
								<option value="chn">중국</option>
								<option value="usa">미국</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		        <button type="submit" class="btn btn-primary" id="selectBtn">선택</button>
		      </div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	
	//select2 실행 코드
	var $disabledResults = $(".search-select");
	$disabledResults.select2();
	
	//datepicker 설정
	$('input[name="contract_period_s"]').daterangepicker({
		singleDatePicker : true,
		showDropdowns : true,
		minYear : 1960,
		maxYear : parseInt(moment().format('YYYY'), 10),
		autoUpdateInput: false,
		locale: {
			format : "YYYY-MM-DD"
		}
	});
	//계약시작 날짜값 지정
	$('input[name="contract_period_s"]').on('apply.daterangepicker', function(ev, picker) {
	    $(this).val(picker.startDate.format('YYYY-MM-DD'));
	});


	$('input[name="contract_period_e"]').daterangepicker({
		singleDatePicker : true,
		showDropdowns : true,
		minYear : 1960,
		maxYear : parseInt(moment().format('YYYY'), 10),
		autoUpdateInput: false,
		locale: {
			format : "YYYY-MM-DD"
		}
	});
	
	
	//계약종료 날짜값 지정
	$('input[name="contract_period_e"]').on('apply.daterangepicker', function(ev, picker) {
	    $(this).val(picker.startDate.format('YYYY-MM-DD'));
	});
});
</script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<!-- select2 JS -->
<script src="/resources/vendor/select2/select2.min.js"></script>

<!-- datepickerJS -->
<script src="/resources/vendor/datepicker/moment.min.js"></script>
<script src="/resources/vendor/datepicker/daterangepicker.js"></script>
<script src="/resources/js/datepicker.js"></script>

</body>
</html>