$(document).on('turbolinks:load', function() {
  var search_list = $(".search__result")
  var preinput;
  function appendUser(user) {
    var html = `<div class="search__user">
                  <a href= "/users/${ user.id }" class="search__user__name" data-user-id="${ user.id }" data-user-name="${ user.name }">${ user.name }</a>
                </div>`
    search_list.append(html)
  }

  function appendNoUser(user) {
    var html = `<div class="search__user">
                  <p class="search__user__no">${ user }</p>
                </div>`
    search_list.apend(html)
  }

  $(".search__quely").on("keyup", function() {
    var input = $(".search__quely").val();
    // if(input != preinput) {
    //   $(search_list).remove();
    //   if(input.length !== 0) {
    // if (input.length === 0) {
    //   $(search_list).remove();
    // }
    // $(html).remove();
    if (input.length !== 0) {
    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(users) {
      // $(search_list).find(html).remove();
      $(".search__result").empty();
        if (users.length !== 0) {
          users.forEach(function(user) {
            appendUser(user);
          });
        }
        else {
          appendNoUser("一致するユーザーはいません");
        }
    })
    .fail(function() {
      alert('ユーザーの検索に失敗しました');
    })
  }
  // preinput = input;
  });
});
