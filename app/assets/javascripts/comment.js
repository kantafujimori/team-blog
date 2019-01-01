$(function() {
  $(".comment__delete").click(function() {
    if(!confirm("本当に削除しますか？")){
      return false;
    } else {
      location.href = 'index.html';
    }
  });
});
