function loadMoreMatches() {
    var matches = document.querySelectorAll('#matchSchedule .match-info');
    for (var i = 3; i < matches.length; i++) {
        if (matches[i].style.display === 'none') {
            matches[i].style.display = 'block';
        }
    }
    var hiddenMatches = document.querySelectorAll('#matchSchedule .match-info[style="display:none;"]');
    if (hiddenMatches.length === 0) {
        document.getElementById('loadMoreBtn').style.display = 'none';
    }
}