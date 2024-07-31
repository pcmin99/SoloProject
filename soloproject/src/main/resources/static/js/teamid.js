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

    const userHidden = $('.userInfoId1').val();
    const user_idHidden = $('.user_idHidden');
    

    // 일반 로그인시
    const usernameOrgi = userHidden.match(/Username=([^,]+)/);

    // google 로그인시
    const usernameMatch = userHidden.match(/username=([^,]+)/);
    const close = $('#close123');

    
    if(usernameOrgi != null){
        const username123 = usernameOrgi[1];
        const length = user_idHidden.length;    
        for (var i = 0; i < length; i++) {
            const userText =user_idHidden[i].innerText.trim();
            if(userText == username123){
                const closeButton = $(user_idHidden[i]).closest('tr').find('.close span');
                if (closeButton.length) {
                    closeButton.css('display', 'block');
                }
            } else {
            }
        } 
    }else {
        const username = usernameMatch[1];
        const length = user_idHidden.length;    
        for (var i = 0; i < length; i++) {
            const userText =user_idHidden[i].innerText;
            if(userText == username){
                const closeButton = $(user_idHidden[i]).closest('tr').find('.close span');
                if (closeButton.length) {
                    closeButton.css('display', 'block');
                }
            } else {
            }
        } 
    }




    // if (username == user_id){

    // }

    
});
