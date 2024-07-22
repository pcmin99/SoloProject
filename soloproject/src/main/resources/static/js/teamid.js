$(function() {
    $('.game-info-team game-info-team-first').click(function() {
        const homeTeamId = $(this).find('.homeTeamid').val();
        if(homeTeamId == null) {
            window.location.href = "../main";
        } else {
            window.location.href = "../posts/threecolumn/" + homeTeamId;
        }
    });

    $('.game-info-team game-info-team-second').click(function() {
        const awayTeamId = $(this).find('.awayTeamid').val();
        if(awayTeamId == null) {
            window.location.href = "../main";
        } else {
            window.location.href = "../posts/threecolumn/" + awayTeamId;
        }
    });
    
});
