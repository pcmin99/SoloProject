$(function () {

$('#descriptionCon > p').each(function() {
    var $p = $(this);
    var text = $p.text(); // 현재 <p> 요소의 텍스트 가져오기
    var maxLength = 90; // 최대 길이

    if (text.length > maxLength) {
        text = text.substring(0, maxLength) + "...";
    }
    $p.text(text);
});








});