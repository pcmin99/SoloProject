$(function() {
    $('.game-info-team-first').click(function() {
        const homeTeamId = $(this).find('.homeTeamid').val();
        console.log(homeTeamId);
        if(homeTeamId == null) {
            window.location.href = "../main";
        } else {
            window.location.href = "../posts/threecolumn/" + homeTeamId;
        }
    });

    $('.game-info-team-second').click(function() {
        const awayTeamId = $(this).find('.awayTeamid').val();
        if(awayTeamId == null) {
            window.location.href = "../main";
        } else {
            window.location.href = "../posts/threecolumn/" + awayTeamId;
        }
    });
    
});
