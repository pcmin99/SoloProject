$(function() {
    
const signup = document.getElementById("sign-up");
const signin = document.getElementById("sign-in");
const loginin = document.getElementById("login-in");
const loginup = document.getElementById("login-up");



signup.addEventListener("click", () => {
    loginin.classList.remove("block");
    loginup.classList.remove("none");

    loginin.classList.add("none");
    loginup.classList.add("block");
});

signin.addEventListener("click", () => {
    loginin.classList.remove("none");
    loginup.classList.remove("block");

    loginin.classList.add("block");
    loginup.classList.add("none");
});



// 아이디 유효성 검사
let isUsernameChecked = false ; 

$('.joinbutton').click( function (event){
    const email = $('#joinEmail').val();
    const password = $('#joinPassword').val();
    if (!isUsernameChecked) {
        event.preventDefault(); // 양식 제출 방지
        swal("", "아이디 중복 확인을 해주세요.", "error");
      }
    else if (email === "") {
        event.preventDefault();
        console.log(email);
        swal("","email을 입력 해주세요","error");
    }
    
    else if( password === ""){
            event.preventDefault();
            swal("","Password 입력 해주세요.","error");
    }  
});




    $('#dupiCheck').click(function () {
        const username = $('#username').val();
        if(username === ""){
            swal("", "아이디를 입력 해주세요.", "warning");
        } else if (username != null) {
            $.ajax({
                type:"POST",
                url:"/login/idCheck",
                data:{username :username},
                success: function(response){
                    if(response == "1"){
                        swal("","이미 존재하는 아이디 입니다.","error")
                        isUsernameChecked = false ; 
                    }
                    else if (response =="0"){
                        swal("","사용 가능한 아이디 입니다.","success")
                        isUsernameChecked = true ;
                    }
    
                },
                error:function() {
                    swal("","에러가 발생했습니다.","error")
                }
            })
        }
    });


})
