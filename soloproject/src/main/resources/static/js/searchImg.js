$(function () {
    $('.rd-search-form-submit').click(function(event){
        event.preventDefault(); 

        const searchImg = $('.rd-navbar-search-form-input').val(); // 검색어 값을 가져옴

        $.ajax({
            type: "POST",
            url: "/searchImg", 
            data: { searchImg: searchImg },
            success: function(response){
                const searchResults = response.items;
                let html = '';
                
                // 각 검색 결과 항목을 반복
                searchResults.forEach(item => {
                    html += `
                        <div class="col-md-6">
                            <!-- Post Future-->
                            <article class="post-future">
                                <a class="post-future-figure" href="${item.link}">
                                    <img src="${item.thumbnail}" alt="${item.title}" width="368" height="287"/>
                                </a>
                                <div class="post-future-main">
                                    <h4 class="post-future-title">
                                        <a href="${item.link}">${item.title}</a>
                                    </h4>
                                    <div class="post-future-meta">
                                        <div class="post-future-time">
                                            <span class="icon mdi mdi-clock"></span>
                                            <time datetime="2020">April 15, 2020</time>
                                        </div>
                                    </div>
                                    <hr/>
                                    <div class="post-future-text">
                                        <p>Some description here...</p>
                                    </div>
                                    <div class="post-future-footer group-flex group-flex-xs">
                                        <a class="button button-gray-outline" href="${item.link}">Read more</a>
                                    </div>
                                </div>
                            </article>
                        </div>
                    `;
                });
                $('#searchResults').html(html);
            },
            error: function() {
                swal("", "에러가 발생했습니다.", "error");
                setTimeout(function() {
                    window.location.href = "/login/login";
                }, 1500);
            }
        });
    });
});
