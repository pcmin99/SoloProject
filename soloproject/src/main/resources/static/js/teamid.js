$(function() {
    $('.game-info-team-first').click(function() {
        const homeTeamId = $(this).find('.homeTeamid').val();
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


    // list에서 삭제 표시 
    $('.close123').click(function(e) {
        e.preventDefault();
        e.stopPropagation();
        const id = $(this).find('.postDetailIdX').val();
        swal({
            title: "삭제 하시겠습니까?",
            icon: "warning",
            buttons: {
                cancel: {
                    text: "취소",
                    value: false,
                    visible: true,
                    className: "",
                    closeModal: true,
                },
                confirm: {
                    text: "확인",
                    value: true,
                    visible: true,
                    className: "",
                    closeModal: true
                }
            }
        }).then((will) => {
            if (will) {
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


    // 본인이 만든 게시글이면 삭제 x  icon뜨게
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

    const loginId = userHidden.match(/Username=([^,]+)/);
    const loginGoogleId = userHidden.match(/username=([^,]+)/);
    
    // 댓글 삭제 
    $('.deleteCommid').click(function(e) {
        e.preventDefault();
        e.stopPropagation();
        const comsid = $(this).siblings('.comsid').val(); // 댓글 번호
        const comsUserID = $(this).siblings('.user_idHidden').val(); // 아이디
        
        // 일반 로그인 ON
        if(loginId != null && loginId[1] === comsUserID){
            swal({
                title: "삭제 하시겠습니까?",
                icon: "warning",
                buttons: {
                    cancel: {
                        text: "취소",
                        value: false,
                        visible: true,
                        className: "",
                        closeModal: true,
                    },
                    confirm: {
                        text: "확인",
                        value: true,
                        visible: true,
                        className: "",
                        closeModal: true
                    }
                }
            }).then((will) => {
                if (will) {
                    $.ajax({
                        type: "POST",
                        url: "/postDetail/"+comsid,
                        data: { comsid: comsid},
                        success: function(){
                            swal("", "삭제 완료 됬습니다.", "success");
                            setTimeout(function() {
                                window.location.reload();
                            }, 1500);
                        },
                        error: function(){
                            swal("", "에러가 발생했습니다.", "error");
                        }
                    });
                }
            });
        } 
        else if(loginGoogleId != null && loginGoogleId[1] === comsUserID) { // 소셜 로그인 ON
            swal({
                title: "삭제 하시겠습니까?",
                icon: "warning",
                buttons: {
                    cancel: {
                        text: "취소",
                        value: false,
                        visible: true,
                        className: "",
                        closeModal: true,
                    },
                    confirm: {
                        text: "확인",
                        value: true,
                        visible: true,
                        className: "",
                        closeModal: true
                    }
                }
            }).then((will) => {
                if (will) {
                    $.ajax({
                        type: "POST",
                        url: "/postDetail/"+comsid,
                        data: { comsid: comsid},
                        success: function(){
                            swal("", "삭제 완료 됬습니다.", "success");
                            setTimeout(function() {
                                window.location.reload();
                            }, 1500);
                        },
                        error: function(){
                            swal("", "에러가 발생했습니다.", "error");
                        }
                    });
                }
            });
        }else{ // 아무 id랑도 같지 않다면
            swal("", "ID를 확인 해주세요..", "error");
        }
    });










});
