$(function () {
    $.ajax({
        url: "/footer",
        type: "POST",
        success: function (res) {
            res.forEach(function (tourInfo, index) {
                var container = $('.col-sm-6').eq(index);
                // 만약 현재 index의 container가 없다면 새로 추가
                if (container.length === 0) {
                    container = $('<div class="col-sm-6"></div>');
                    $('.row.row-20').append(container);
                }

                var newElement = $(
                    `<article class="post-classic">
                            <div class="post-classic-aside"><a class="post-classic-figure" href="#"></a></div>
                            <div class="post-classic-main">
                            <img src="/images/${tourInfo.imgfile_name}" alt="" width="93" height="87">
                            <p class="post-classic-title">${tourInfo.title}</p>
                            <div class="post-classic-time"><span class="icon mdi mdi-clock"></span>
                                <time datetime="2020">${tourInfo.view}</time>
                                <input type="hidden" value="${tourInfo.id}" class="postDetailIdX" />
                            </div>    
                            </div>
                    </article>`
                );
                container.append(newElement);
            });
        },
        error: function (err) {
            console.log(err);
        }
    });


    $(document).on('click', '.col-sm-6', function() {
        console.log("11111");
        const id = $(this).find('.postDetailIdX').val(); 
        if (id == null) {
            window.location.href = "/posts/boardList";
        } else {
            window.location.href = "/posts/postDetail/" + id;
        }
    });




});
