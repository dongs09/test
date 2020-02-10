/**
 * 자바스크립트 공통 메소드 모음
 */

// //랜덤 색 지정
function getRandomColor() {
	
    var r = Math.floor(Math.random() * 255);
    var g = Math.floor(Math.random() * 255);
    var b = Math.floor(Math.random() * 255);
    
    return "rgb(" + r + "," + g + "," + b + ")";
    
}