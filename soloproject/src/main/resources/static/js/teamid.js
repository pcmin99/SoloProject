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



    $('.close123').click(function(e) {
        e.preventDefault();
        e.stopPropagation();
        const id = $(this).find('.postDetailIdX').val();
        $.ajax({
            type: "POST",
            url: "/boardList/"+id,
            data: { id: id},
            success: function(){
                swal("", "삭제 완료 됬습니다.", "success");
                setTimeout(function() {
                    window.location.reload();
                }, 1500);
            },
            error: function(){
                swal("", "에러가 발생했습니다.", "error");
                setTimeout(function() {
                    window.location.href = "../posts/boardList";
                }, 1500);

            }
        });
    });

    
    $('.alert').click(function() {
        const id = $(this).find('#postDetailId').text();
        if(id == null) {
            window.location.href = "../posts/boardList";
        } else {
            window.location.href = "../posts/postDetail/" + id;
        }
    });

    //event.preventDefault();








    const userHidden = $('.userInfoId').val();
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
